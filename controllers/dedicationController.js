const db = require('../models/db')
const { promisify } = require("util");
const coupleFields = require('../models/couple')
const personFields = require('../models/person')
const witnessFields = require('../models/witness')
const memberFields = require('../models/members')
const infDedFields = require('../models/infantDedication')
const { Condition, queryTypes } = require('../models/condition')
const { sendError } = require('../controllers/errorController')
const { updateMemberToMember, updateMemberToNonMember, updateNonMemberToMember, updateNonMemberToNonMember, updateNoneToMember, updateNoneToNonMember, updateMemberToNone, updateNonMemberToNone } = require('./updateController')
const { tables } = require('../models/db')

const dedicationController = {
  /**
   * This function renders the add dedication page
   * @param req - the incoming request containing either the query or body
   * @param res - the result to be sent out after processing the request
   */
  getAddDedicationPage: function (req, res) {
    if (req.session.level === null || req.session.level === undefined) {
      res.render('error', {
        title: '401 Unauthorized Access',
        css: ['global', 'error'],
        status: {
          code: '401',
          message: 'Unauthorized access'
        },
        backLink: '/forms_main_page'
      })
    } else {
      const join = [
        {
          tableName: db.tables.PERSON_TABLE,
          sourceCol: db.tables.MEMBER_TABLE + '.' + memberFields.PERSON,
          destCol: db.tables.PERSON_TABLE + '.' + personFields.ID
        }
      ]
      db.find(db.tables.MEMBER_TABLE, [], join, '*', function (result) {
        if (result) {
          const data = {}
          data.noDedicationMembers = result.filter(elem => elem[memberFields.CHILD_DEDICATION] === null)
          data.members = result
          data.styles = ['forms']
          data.scripts = ['addDedication']
          data.backLink = parseInt(req.session.level) >= 2 ? '/dedication_main_page' : '/forms_main_page'
          data.males = data.members.filter((element) => { return element[memberFields.SEX] === 'Male' })
          data.females = data.members.filter((element) => { return element[memberFields.SEX] === 'Female' })
          res.render('add-child-dedication', data)
        }
      })
    }
  },
  /**
   * This function renders the view of a specific child dedication record
   * @param req - the incoming request containing either the query or body
   * @param res - the result to be sent out after processing the request
   */
  getViewDedication: function (req, res) {
    // function execution starts here
    const dedicationId = parseInt(req.params.dedication_id)
    if (parseInt(req.session.level) >= 2 || parseInt(req.session.editId) === dedicationId) {
      const cond1 = new Condition(queryTypes.where)
      cond1.setKeyValue(db.tables.INFANT_TABLE + '.' + infDedFields.ID, dedicationId)
      const witnessCond = new Condition(queryTypes.where)
      witnessCond.setKeyValue(db.tables.WITNESS_TABLE + '.' + witnessFields.DEDICATION, dedicationId)

      /* Similar to
        FROM inf_dedication
        JOIN people AS child ON child.person_id=inf_dedication.dedication_id
        JOIN couples ON couples.couple_id = inf_dedication.parents_id
        JOIN people AS parent1 ON parent1.person_id=couples.female_id
        LEFT JOIN peopl AS parent2 ON parent2.person_id=couples.male_id
      */
      // Original Table is Child Dedication Table
      const joinTables = [
        // Join to Person Table as child to get child info
        {
          tableName: { child: db.tables.PERSON_TABLE },
          sourceCol: db.tables.INFANT_TABLE + '.' + infDedFields.PERSON,
          destCol: 'child.' + personFields.ID
        },
        // Join to Couple Table
        {
          tableName: db.tables.COUPLE_TABLE,
          sourceCol: db.tables.INFANT_TABLE + '.' + infDedFields.PARENTS,
          destCol: db.tables.COUPLE_TABLE + '.' + coupleFields.ID
        },
        // Join to Person Tables as parent1 to get first parent/guardian
        {
          tableName: { parent1: db.tables.PERSON_TABLE },
          sourceCol: db.tables.COUPLE_TABLE + '.' + coupleFields.FEMALE,
          destCol: 'parent1.' + personFields.ID
        },
        // Left Join to Person Tables as parent2 to get second/guardian
        {
          type: 'leftJoin',
          tableName: { parent2: db.tables.PERSON_TABLE },
          sourceCol: db.tables.COUPLE_TABLE + '.' + coupleFields.MALE,
          destCol: 'parent2.' + personFields.ID
        }
      ]

      const columns = [
        db.tables.INFANT_TABLE + '.' + infDedFields.ID + ' as dedication_id',
        db.tables.INFANT_TABLE + '.' + infDedFields.PERSON + ' as infant_person_id',
        db.tables.INFANT_TABLE + '.' + infDedFields.PARENTS + ' as parents_id',
        db.tables.INFANT_TABLE + '.' + infDedFields.DATE + ' as date',
        db.tables.INFANT_TABLE + '.' + infDedFields.DEDICATION_DATE + ' as dedication_date',
        db.tables.INFANT_TABLE + '.' + infDedFields.PLACE + ' as place',
        db.tables.INFANT_TABLE + '.' + infDedFields.OFFICIANT + ' as officiant',
        'parent1.' + personFields.ID + ' as guardianOne_person_id',
        'parent1.' + personFields.MEMBER + ' as guardianOne_member_id',
        'parent1.' + personFields.FIRST_NAME + ' as guardianOne_first_name',
        'parent1.' + personFields.MID_NAME + ' as guardianOne_mid_name',
        'parent1.' + personFields.LAST_NAME + ' as guardianOne_last_name',
        'parent2.' + personFields.ID + ' as guardianTwo_person_id',
        'parent2.' + personFields.MEMBER + ' as guardianTwo_member_id',
        'parent2.' + personFields.FIRST_NAME + ' as guardianTwo_first_name',
        'parent2.' + personFields.MID_NAME + ' as guardianTwo_mid_name',
        'parent2.' + personFields.LAST_NAME + ' as guardianTwo_last_name',
        'child.' + personFields.MEMBER + ' as infant_member_id',
        'child.' + personFields.FIRST_NAME + ' as infant_first_name',
        'child.' + personFields.MID_NAME + ' as infant_middle_name',
        'child.' + personFields.LAST_NAME + ' as infant_last_name'
      ]

      const witnessJoin = [
        {
          tableName: db.tables.PERSON_TABLE,
          sourceCol: db.tables.WITNESS_TABLE + '.' + witnessFields.PERSON,
          destCol: db.tables.PERSON_TABLE + '.' + personFields.ID
        }
      ]
      const witnessColumns = [
        db.tables.WITNESS_TABLE + '.' + witnessFields.DEDICATION + ' as dedication_id',
        db.tables.WITNESS_TABLE + '.' + witnessFields.PERSON + ' as witness_person_id',
        db.tables.WITNESS_TABLE + '.' + witnessFields.ID + ' as witness_id',
        db.tables.PERSON_TABLE + '.' + personFields.MEMBER + ' as witness_member_id',
        db.tables.PERSON_TABLE + '.' + personFields.FIRST_NAME + ' as witness_first_name',
        db.tables.PERSON_TABLE + '.' + personFields.MID_NAME + ' as witness_mid_name',
        db.tables.PERSON_TABLE + '.' + personFields.LAST_NAME + ' as witness_last_name',
        db.tables.WITNESS_TABLE + '.' + witnessFields.TYPE + ' as type'
      ]

      db.find(db.tables.INFANT_TABLE, [cond1], joinTables, columns, function (result) {
        if (result !== null && result.length > 0) {
          const data = {
            ...result[0]
          }
          data.styles = ['view']
          data.scripts = ['deleteDedication']
          data.backLink = parseInt(req.session.level) >= 2 ? '/dedication_main_page' : '/forms_main_page'
          data.canSee = parseInt(req.session.level) >= 2 || parseInt(req.session.editId) === parseInt(dedicationId)
          db.find(db.tables.WITNESS_TABLE, witnessCond, witnessJoin, witnessColumns, function (result) {
            if (result) {
              data.witnesses = result
              // Filters all Godfathers
              data.witnessMale = data.witnesses.filter((witness) => { return witness.type === 'Godfather' })
              // Filters all Godmothers
              data.witnessFemale = data.witnesses.filter((witness) => { return witness.type === 'Godmother' })
              res.render('view-dedication', data)
            }
          })
        } else {
          sendError(req, res, 404, '404 Record Not Found at Child Dedication Table')
        }
      })
    } else {
      sendError(req, res, 401)
    }
  },

  /**
   * This function adds a child dedication record to the database
   * @param req - the incoming request containing either the query or body
   * @param res - the result to be sent out after processing the request
   */
  postAddDedication: async function (req, res) {
    try {
      // Parse the body fields into the data object
      const data = {};
      data['newDate'] = new Date().toISOString()
      const bodyKeys = Object.keys(req.body);
      bodyKeys.forEach((key) => {
        //console.log("KEY IS: " + key);
        if (
          !(
            key === "officiant" ||
            key === "place" ||
            key === "date"
          )
        ) {
          data[key] = (req.body[key] ? JSON.parse(req.body[key]) : req.body[key]);
        } else {
          data[key] = req.body[key];
        }
        if (key === "date") data[key] = new Date(req.body[key]);
      })

      // Pre-promisify wrappers
      const wrapDbFind = (table, conditions = null, join = null, projection = "*", callback, rawSelect = []) => {
        db.find(
          table,
          conditions,
          join,
          projection,
          (result) => {
            if (result === false) {
              callback("[DBFind Wrapper] Error occurred for FIND.", null);
            } else {
              callback(null, result);
            }
          },
          rawSelect
        );
      };

      const wrapDbInsert = (table, data, callback) => {
        db.insert(table, data, (result) => {
          if (result === false) {
            callback("[DBInsert Wrapper] Error occurred for INSERT.", null);
          } else {
            callback(null, result);
          }
        });
      };

      const wrapDbUpdate = (table, data, conditions, callback) => {
        db.update(table, data, conditions, (result) => {
          if (result === false) {
            callback("[DBInsert Wrapper] Error occured for UPDATE.", null);
          } else {
            callback(null, result);
          }
        });
      };

      // Promisified Methods
      const dbInsert = promisify(wrapDbInsert);
      const dbFind = promisify(wrapDbFind);
      const dbUpdate = promisify(wrapDbUpdate);

      // Check if the child is a member
      // If not, create a people entry for them.
      // console.log("Checking if child is member. Insert person entry if child is not member.");
      if (!data.child.isMember) {
        const result = await dbInsert(db.tables.PERSON_TABLE, {
          first_name: data.child.first_name,
          middle_name: data.child.mid_name,
          last_name: data.child.last_name,
        });

        if (result === false) {
          return res.send(false);
        }

        data.child.person_id = result[0];
      }

      // console.log("Checking if guardian1 is member. Insert person entry if groom is not member.");
      if (data.guardian1 && !data.guardian1.isMember) {
        const result = await dbInsert(db.tables.PERSON_TABLE, {
          first_name: data.guardian1.first_name,
          middle_name: data.guardian1.mid_name,
          last_name: data.guardian1.last_name,
        });

        if (result === false) {
          return res.send(false);
        }

        data.guardian1.person_id = result[0];
      }

      // console.log("If guardian2 is not null, check if member. If not member, create a person record.");
      if (data.guardian2 && !data.guardian2.isMember) {
        const result = await dbInsert(db.tables.PERSON_TABLE, {
          first_name: data.guardian2.first_name,
          middle_name: data.guardian2.mid_name,
          last_name: data.guardian2.last_name,
        });

        if (result === false) {
          return res.send(false);
        }

        data.guardian2.person_id = result[0];
      }

      if (!(data.child.person_id)) {
        console.error("Child person_id somewhere");
        return res.send(false);
      }

      const coupleIds = {
        childGuardians: null
      };

      //Parents
      if (data.guardian1 || data.guardian2) {
        //console.log("GUARDIAN1 " + JSON.stringify(data.guardian1))
        //console.log("GUARDIAN2 " + JSON.stringify(data.guardian2))
        const childGuardiansConditions = [];
        const childGuardian1Condition = new Condition(queryTypes.where);
        const childGuardian2Condition = new Condition(queryTypes.where);

        if (data.guardian1) {
          childGuardian1Condition.setKeyValue(coupleFields.FEMALE, data.guardian1.person_id);
          childGuardiansConditions.push(childGuardian1Condition);
        } else {
          childGuardian1Condition.setKeyValue(coupleFields.FEMALE, null);
          childGuardiansConditions.push(childGuardian1Condition);
        }
        if (data.guardian2) {
          childGuardian2Condition.setKeyValue(coupleFields.MALE, data.guardian2.person_id);
          childGuardiansConditions.push(childGuardian2Condition);
        } else {
          childGuardian2Condition.setKeyValue(coupleFields.MALE, null);
          childGuardiansConditions.push(childGuardian2Condition);
        }
        const childGuardiansCoupleId = await dbFind(
          db.tables.COUPLE_TABLE,
          childGuardiansConditions,
          null,
          coupleFields.ID
        );
        if (childGuardiansCoupleId.length > 0) {
          coupleIds.childGuardians = childGuardiansCoupleId[0].couple_id; // returns {"couple_id":159}
          //console.log("CHILD GUARDIANS COUPLE ID: " + JSON.stringify(coupleIds.childGuardians))
        } else {
          // Insert couple to table
          const coupleInsertResult = await dbInsert(db.tables.COUPLE_TABLE, {
            female_id: data.guardian1 ? data.guardian1.person_id : null,
            male_id: data.guardian2 ? data.guardian2.person_id : null,
          });

          if (coupleInsertResult === false) {
            console.error("Error inserting child's parents' couple entry");
            return res.send(false);
          }
          coupleIds.childGuardians = coupleInsertResult[0]; // returns 159
          //console.log("COUPLE INSERT RESULT[0]: " + JSON.stringify(coupleIds.childGuardians))
        }

      }

      const insertDedicationData = {};
      insertDedicationData[infDedFields.PERSON] = data.child.person_id;
      insertDedicationData[infDedFields.DATE] = data.newDate;
      insertDedicationData[infDedFields.DEDICATION_DATE] = data.date;
      insertDedicationData[infDedFields.PLACE] = data.place;
      insertDedicationData[infDedFields.OFFICIANT] = data.officiant;
      insertDedicationData[infDedFields.PARENTS] = coupleIds.childGuardians;

      //console.log(JSON.stringify(insertDedicationData) + "\n");
      //console.log("FEMALE: " + JSON.stringify(data.witnessFemale));
      //console.log("MALE: " + JSON.stringify(data.witnessMale));

      // Insert the dedication data
      const dedicationInsertResult = await dbInsert(db.tables.INFANT_TABLE, insertDedicationData);
      const dedicationId = dedicationInsertResult[0];

      // Add the dedication ID to the child_dedication_id field on the member table for the child if they are a member
      //Child
      if (data.child.isMember) {
        const childMemberFindCondition = new Condition(queryTypes.where);
        childMemberFindCondition.setKeyValue(memberFields.ID, data.child.member_id);
        const updateData = {};
        updateData[memberFields.CHILD_DEDICATION] = dedicationId;
        await dbUpdate(db.tables.MEMBER_TABLE, updateData, [childMemberFindCondition]);
      }

      //Process the witnesses

      //Male witnesses
      //console.log("Check if each male witness is a member. If not a member, create a person record for them.");
      await Promise.all(
        data.witnessMale.map(async (witness, i) => {
          // Execute if not member
          if (!witness.isMember) {
            // Find a person record for this person. Match via first name, middle name, and last name.
            const witnessFirstNameCondition = new Condition(queryTypes.where);
            const witnessMiddleNameCondition = new Condition(queryTypes.where);
            const witnessLastNameCondition = new Condition(queryTypes.where);
            witnessFirstNameCondition.setKeyValue(personFields.FIRST_NAME, witness.first_name);
            witnessMiddleNameCondition.setKeyValue(personFields.MID_NAME, witness.mid_name);
            witnessLastNameCondition.setKeyValue(personFields.LAST_NAME, witness.last_name);
            const witnessPersonLookupResult = await dbFind(
              db.tables.PERSON_TABLE,
              [witnessFirstNameCondition, witnessMiddleNameCondition, witnessLastNameCondition],
              null,
              personFields.ID
            );
            if (witnessPersonLookupResult.length === 0) {
              // Create new record for this person
              const insertData = {};
              insertData[personFields.FIRST_NAME] = witness.first_name;
              insertData[personFields.MID_NAME] = witness.mid_name;
              insertData[personFields.LAST_NAME] = witness.last_name;
              const witnessPersonInsertResult = await dbInsert(db.tables.PERSON_TABLE, insertData);
              if (witnessPersonInsertResult.length > 0) {
                // Save the person id to the witness
                data.witnessMale[i].person_id = witnessPersonInsertResult[0];
              } else {
                console.error("Unable to insert male witnesses");
                return res.send(false);
              }
            } else {
              data.witnessMale[i].person_id = witnessPersonLookupResult[0].person_id;
            }
          }
          // Insert the witness to the witness table
          const witnessInsertionResult = await dbInsert(db.tables.WITNESS_TABLE, {
            dedication_id: dedicationId,
            type: "Godfather",
            person_id: data.witnessMale[i].person_id,
          });
          if (witnessInsertionResult.length === 0) {
            console.error("Unable to insert male witness into witness table");
          }
        })
      );

      // Female witnesses
      // console.log("Check if each female witness is a member. If not a member, create a person record for them.");
      await Promise.all(
        data.witnessFemale.map(async (witness, i) => {
          // Execute if not member
          if (!witness.isMember) {
            // Find a person record for this person. Match via first name, middle name, and last name.
            const witnessFirstNameCondition = new Condition(queryTypes.where);
            const witnessMiddleNameCondition = new Condition(queryTypes.where);
            const witnessLastNameCondition = new Condition(queryTypes.where);
            witnessFirstNameCondition.setKeyValue(personFields.FIRST_NAME, witness.first_name);
            witnessMiddleNameCondition.setKeyValue(personFields.MID_NAME, witness.mid_name);
            witnessLastNameCondition.setKeyValue(personFields.LAST_NAME, witness.last_name);
            const witnessPersonLookupResult = await dbFind(
              db.tables.PERSON_TABLE,
              [witnessFirstNameCondition, witnessMiddleNameCondition, witnessLastNameCondition],
              null,
              personFields.ID
            );
            //console.log("PERSON LOOK UP IS " + JSON.stringify(witnessPersonLookupResult));
            if (witnessPersonLookupResult.length === 0) {
              // Create new record for this person
              const insertData = {};
              insertData[personFields.FIRST_NAME] = witness.first_name;
              insertData[personFields.MID_NAME] = witness.mid_name;
              insertData[personFields.LAST_NAME] = witness.last_name;
              const witnessPersonInsertResult = await dbInsert(db.tables.PERSON_TABLE, insertData);
              if (witnessPersonInsertResult.length > 0) {
                // Save the person id to the witness
                data.witnessFemale[i].person_id = witnessPersonInsertResult[0];
              } else {
                console.error("Unable to insert female witnesses");
                return res.send(false);
              }
            } else {
              data.witnessFemale[i].person_id = witnessPersonLookupResult[0].person_id;
            }
          }
          // Insert the witness to the witness table
          const witnessInsertionResult = await dbInsert(db.tables.WITNESS_TABLE, {
            dedication_id: dedicationId,
            type: "Godmother",
            person_id: data.witnessFemale[i].person_id,
          });
          if (witnessInsertionResult.length === 0) {
            console.error("Unable to insert female witness into witness table");
          }
        })
      );
      req.session.editId = dedicationId;
      return res.json(dedicationId);
    } catch (err) {
      console.error("[DedicationController] Error occured while creating new dedication registry record.");
      console.error(err);
      return res.send(false);
    }
  },

  getEditDedication: function (req, res) {
    req.session.level = 3
    const dedicationId = req.params.dedication_id
    if (parseInt(req.session.level) >= 2 || parseInt(req.session.editId) === parseInt(dedicationId)) {
      const cond1 = new Condition(queryTypes.where)
      cond1.setKeyValue(db.tables.INFANT_TABLE + '.' + infDedFields.ID, dedicationId)
      const witnessCond = new Condition(queryTypes.where)
      witnessCond.setKeyValue(db.tables.WITNESS_TABLE + '.' + witnessFields.DEDICATION, dedicationId)
      const joinTables = [
        {
          tableName: { child: db.tables.PERSON_TABLE },
          sourceCol: db.tables.INFANT_TABLE + '.' + infDedFields.PERSON,
          destCol: 'child.' + personFields.ID
        },
        {
          tableName: db.tables.COUPLE_TABLE,
          sourceCol: db.tables.INFANT_TABLE + '.' + infDedFields.PARENTS,
          destCol: db.tables.COUPLE_TABLE + '.' + coupleFields.ID
        },
        {
          tableName: { parent1: db.tables.PERSON_TABLE },
          sourceCol: db.tables.COUPLE_TABLE + '.' + coupleFields.FEMALE,
          destCol: 'parent1.' + personFields.ID
        },
        {
          type: 'leftJoin',
          tableName: { parent2: db.tables.PERSON_TABLE },
          sourceCol: db.tables.COUPLE_TABLE + '.' + coupleFields.MALE,
          destCol: 'parent2.' + personFields.ID
        }
      ]

      const columns = [
        db.tables.INFANT_TABLE + '.' + infDedFields.ID + ' as dedication_id',
        db.tables.INFANT_TABLE + '.' + infDedFields.PERSON + ' as infant_person_id',
        db.tables.INFANT_TABLE + '.' + infDedFields.PARENTS + ' as parents_id',
        db.tables.INFANT_TABLE + '.' + infDedFields.DATE + ' as date',
        db.tables.INFANT_TABLE + '.' + infDedFields.DEDICATION_DATE + ' as dedication_date',
        db.tables.INFANT_TABLE + '.' + infDedFields.PLACE + ' as place',
        db.tables.INFANT_TABLE + '.' + infDedFields.OFFICIANT + ' as officiant',
        'parent1.' + personFields.ID + ' as guardianOne_person_id',
        'parent1.' + personFields.MEMBER + ' as guardianOne_member_id',
        'parent1.' + personFields.FIRST_NAME + ' as guardianOne_first_name',
        'parent1.' + personFields.MID_NAME + ' as guardianOne_mid_name',
        'parent1.' + personFields.LAST_NAME + ' as guardianOne_last_name',
        'parent2.' + personFields.ID + ' as guardianTwo_person_id',
        'parent2.' + personFields.MEMBER + ' as guardianTwo_member_id',
        'parent2.' + personFields.FIRST_NAME + ' as guardianTwo_first_name',
        'parent2.' + personFields.MID_NAME + ' as guardianTwo_mid_name',
        'parent2.' + personFields.LAST_NAME + ' as guardianTwo_last_name',
        'child.' + personFields.MEMBER + ' as infant_member_id',
        'child.' + personFields.FIRST_NAME + ' as infant_first_name',
        'child.' + personFields.MID_NAME + ' as infant_middle_name',
        'child.' + personFields.LAST_NAME + ' as infant_last_name'
      ]

      const witnessJoin = [
        {
          tableName: db.tables.PERSON_TABLE,
          sourceCol: db.tables.WITNESS_TABLE + '.' + witnessFields.PERSON,
          destCol: db.tables.PERSON_TABLE + '.' + personFields.ID
        }
      ]
      const witnessColumns = [
        db.tables.WITNESS_TABLE + '.' + witnessFields.DEDICATION + ' as dedication_id',
        db.tables.WITNESS_TABLE + '.' + witnessFields.PERSON + ' as witness_person_id',
        db.tables.WITNESS_TABLE + '.' + witnessFields.ID + ' as witness_id',
        db.tables.PERSON_TABLE + '.' + personFields.MEMBER + ' as witness_member_id',
        db.tables.PERSON_TABLE + '.' + personFields.FIRST_NAME + ' as witness_first_name',
        db.tables.PERSON_TABLE + '.' + personFields.MID_NAME + ' as witness_mid_name',
        db.tables.PERSON_TABLE + '.' + personFields.LAST_NAME + ' as witness_last_name',
        db.tables.WITNESS_TABLE + '.' + witnessFields.TYPE + ' as type'
      ]

      db.find(db.tables.INFANT_TABLE, [cond1], joinTables, columns, function (result) {
        if (result !== null && result.length > 0) {
          const data = {
            ...result[0]
          }
          data.canSee = (parseInt(req.session.editId) === parseInt(dedicationId)) || (parseInt(req.session.level) >= 2)
          if ((parseInt(req.session.level) <= 2)) {
            data.canSee = false
          }
          data.styles = ['forms']
          data.scripts = ['editDedication', 'edit']
          db.find(db.tables.WITNESS_TABLE, witnessCond, witnessJoin, witnessColumns, function (result) {
            if (result) {
              data.witnesses = result
              // Filters all Godfathers
              data.witnessMale = data.witnesses.filter((witness) => { return witness.type === 'Godfather' })
              // Filters all Godmothers
              data.witnessFemale = data.witnesses.filter((witness) => { return witness.type === 'Godmother' })
              db.find(db.tables.MEMBER_TABLE, [], {
                tableName: tables.PERSON_TABLE,
                sourceCol: tables.PERSON_TABLE + '.' + personFields.ID,
                destCol: db.tables.MEMBER_TABLE + '.' + memberFields.PERSON
              }, '*', function (result) {
                if (result) {
                  data.members = result
                  data.males = result.filter(elem => elem[memberFields.SEX] === 'Male')
                  data.females = result.filter(elem => elem[memberFields.SEX] === 'Female')
                  data.noBapReg = result.filter(elem => elem[memberFields.BAPTISMAL_REG] === null || elem[memberFields.BAPTISMAL_REG] === data.dedication_id)
                  res.render('edit-dedication', data)
                } else {
                  sendError(req, res, 404)
                }
              })
            }
          })
        } else {
          sendError(req, res, 404, '404 Record Not Found at Child Dedication Table')
        }
      })
    } else {
      sendError(req, res, 401)
    }
  },

  putUpdateChild: function (req, res) {
    const isOldMember = req.body.isOldMember === 'true'
    const person = JSON.parse(req.body.person)
    const isNewMember = person.isMember
    const ids = {
      recordId: req.body.recordId,
      oldPersonId: req.body.oldPersonId,
      newPersonId: person.personId
    }
    const fields = {
      recordId: infDedFields.ID,
      memberRecordField: memberFields.CHILD_DEDICATION,
      recordPersonField: infDedFields.PERSON
    }

    if (isOldMember && isNewMember) { // From member to member
      updateMemberToMember(ids, fields, tables.INFANT_TABLE, sendReply)
    } else if (isOldMember && !isNewMember) { // From member to non member
      updateMemberToNonMember(person, ids, fields, tables.INFANT_TABLE, sendReply)
    } else if (!isOldMember && isNewMember) { // From non member to member
      updateNonMemberToMember(ids, fields, tables.INFANT_TABLE, sendReply)
    } else {
      updateNonMemberToNonMember(person, sendReply)
    }

    function sendReply(result) {
      if (result) {
        res.send(JSON.stringify(result))
      } else {
        res.send(false)
      }
    }
  },

  putUpdateGuardian: function (req, res) {
    const isFirstGuardian = req.body.isFirstGuardian === 'true'
    const isOldMember = req.body.isOldMember === 'true'
    const person = JSON.parse(req.body.person)
    const isNewMember = person === null ? false : person.isMember
    const isNewNone = person === null
    const isOldNone = !req.body.oldPersonId && !req.body.oldMemberId
    const ids = {
      recordId: req.body.coupleId,
      oldPersonId: req.body.oldPersonId,
      newPersonId: person ? person.personId : null
    }
    const fields = {
      recordId: coupleFields.ID,
      memberRecordField: null,
      recordPersonField: isFirstGuardian ? coupleFields.FEMALE : coupleFields.MALE
    }

    if (isOldNone && !isNewNone && isNewMember) {
      updateNoneToMember(ids, fields, tables.COUPLE_TABLE, sendReply)
    } else if (isOldNone && !isNewNone && !isNewMember) {
      updateNoneToNonMember(person, ids, fields, tables.COUPLE_TABLE, sendReply)
    } else if (isOldMember && isNewNone) {
      updateMemberToNone(ids, fields, tables.COUPLE_TABLE, sendReply)
    } else if (!isOldMember && isNewNone) {
      updateNonMemberToNone(ids, fields, tables.COUPLE_TABLE, sendReply)
    } else if (isOldMember && isNewMember) { // From member to member
      updateMemberToMember(ids, fields, tables.COUPLE_TABLE, sendReply)
    } else if (isOldMember && !isNewMember) { // From member to non member
      updateMemberToNonMember(person, ids, fields, tables.COUPLE_TABLE, sendReply)
    } else if (!isOldMember && isNewMember) { // From non member to member
      updateNonMemberToMember(ids, fields, tables.COUPLE_TABLE, sendReply)
    } else {
      person.personId = ids.oldPersonId
      updateNonMemberToNonMember(person, sendReply)
    }

    function sendReply(result) {
      if (result) {
        res.send(JSON.stringify(result))
      } else {
        res.send(false)
      }
    }
  },

  putUpdateDedication: function (req, res) {
    const location = req.body.location
    const officiant = req.body.officiant
    const recordId = req.body.recordId
    const date = req.body.date

    const data = {}

    const recordCond = new Condition(queryTypes.where)
    recordCond.setKeyValue(infDedFields.ID, recordId)

    data[infDedFields.DEDICATION_DATE] = date
    data[infDedFields.OFFICIANT] = officiant
    data[infDedFields.PLACE] = location

    db.update(db.tables.INFANT_TABLE, data, recordCond, function (result) {
      if (result) {
        res.send(true)
      } else {
        res.send(false)
      }
    })
  },

  putUpdateWitness: function (req, res) {
    const isOldMember = req.body.isOldMember === 'true'
    const person = JSON.parse(req.body.person)
    const isNewMember = person.isMember
    const ids = {
      recordId: req.body.witnessId,
      oldPersonId: req.body.oldPersonId,
      newPersonId: person.personId
    }
    const fields = {
      recordId: witnessFields.ID,
      memberRecordField: null, // No need to edit in witness
      recordPersonField: witnessFields.PERSON
    }

    if (isOldMember && isNewMember) { // From member to member
      updateMemberToMember(ids, fields, tables.WITNESS_TABLE, sendReply)
    } else if (isOldMember && !isNewMember) { // From member to non member
      updateMemberToNonMember(person, ids, fields, tables.WITNESS_TABLE, sendReply)
    } else if (!isOldMember && isNewMember) { // From non member to member
      updateNonMemberToMember(ids, fields, tables.WITNESS_TABLE, sendReply)
    } else {
      person.personId = ids.oldPersonId
      updateNonMemberToNonMember(person, sendReply)
    }

    function sendReply(result) {
      if (result) {
        res.send(JSON.stringify(result))
      } else {
        res.send(false)
      }
    }
  },

  putAddWitness: function (req, res) {
    const recordId = req.body.recordId
    const isFemale = req.body.isFemale === 'true'
    const person = JSON.parse(req.body.person)

    const witnessData = {}
    witnessData[witnessFields.DEDICATION] = recordId
    witnessData[witnessFields.TYPE] = isFemale ? 'Godmother' : 'Godfather'
    witnessData[witnessFields.PERSON] = person.personId

    const personInfo = []

    if (!person.isMember) {
      const personData = {}
      personData[personFields.FIRST_NAME] = person.firstName
      personData[personFields.MID_NAME] = person.midName
      personData[personFields.LAST_NAME] = person.lastName

      personInfo.push(personData)
    }

    db.insert(db.tables.PERSON_TABLE, personInfo, function (result) {
      if (result) {
        if (!person.isMember) {
          witnessData[witnessFields.PERSON] = result[0]
        }

        db.insert(db.tables.WITNESS_TABLE, witnessData, function (result) {
          if (result) {
            const data = {
              layout: false,
              type: isFemale ? 'female' : 'male',
              witness_id: result[0],
              witness_person_id: witnessData[witnessFields.PERSON],
              witness_member_id: person.memberId,
              witness_first_name: person.firstName,
              witness_mid_name: person.midName,
              witness_last_name: person.lastName
            }

            res.render('partials/edit-witness', data, function (err, html) {
              if (err) {
                res.send(false)
              } else {
                res.send(html)
              }
            })
          } else {
            res.send(false)
          }
        })
      } else {
        res.send(false)
      }
    })
  },

  delWitness: function (req, res) {
    const recordId = req.body.recordId
    const person = JSON.parse(req.body.person)

    const condition = new Condition(queryTypes.where)
    condition.setKeyValue(witnessFields.ID, recordId)

    let personCondition = null

    if (!person.memberId) {
      personCondition = new Condition(queryTypes.where)
      personCondition.setKeyValue(personFields.ID, person.personId)
    } else {
      personCondition = new Condition(queryTypes.whereNull)
      personCondition.setField(personFields.ID)
    }

    db.delete(tables.WITNESS_TABLE, condition, function (result) {
      if (result) {
        db.delete(tables.PERSON_TABLE, personCondition, function (result) {
          if (person.memberId && result === 0) {
            result = true
          }
          if (result) {
            res.send(true)
          } else {
            res.send(false)
          }
        })
      } else {
        res.send(false)
      }
    })
  },

  deleteDedication: function (req, res) {
    const nonMembers = JSON.parse(req.body.nonMembers)
    const couples = JSON.parse(req.body.couples)
    const witnesses = JSON.parse(req.body.witnesses)
    const recordId = req.body.recordId
    console.log(JSON.stringify(req.body))
    const nonMembersCond = new Condition(queryTypes.whereIn)
    nonMembersCond.setArray(personFields.ID, nonMembers)

    const couplesCond = new Condition(queryTypes.whereIn)
    couplesCond.setArray(coupleFields.ID, couples)

    const witnessesCond = new Condition(queryTypes.whereIn)
    witnessesCond.setArray(witnessFields.ID, witnesses)

    const recordCond = new Condition(queryTypes.where)
    recordCond.setKeyValue(infDedFields.ID, recordId)

    const memberCond = new Condition(queryTypes.where)
    memberCond.setKeyValue(memberFields.CHILD_DEDICATION, recordId)

    db.update(db.tables.MEMBER_TABLE, { child_dedication_id: null }, memberCond, function (result) {
      if (result || result === 0) {
        //Delete Witnesses
        db.delete(tables.WITNESS_TABLE, witnessesCond, function (result) {
          if (result === 0) {
            result = true
          }
          if (result) {
            db.delete(tables.COUPLE_TABLE, couplesCond, function (result) {
              if (result) {
                db.delete(tables.PERSON_TABLE, nonMembersCond, function (result) {
                  if (nonMembers.length === 0 || result) {
                    db.delete(tables.INFANT_TABLE, recordCond, function (result) {
                      if (result || result === 0) { // Dedication record should be deleted because of FK constraint
                        res.send(true)
                      } else {
                        res.send(false)
                      }
                    })
                  } else {
                    res.send(false)
                  }
                })
              } else {
                res.send(false)
              }
            })
          } else {
            res.send(false)
          }
        })
      } else {
        res.send(false);
      }
    })
  }
}

module.exports = dedicationController
