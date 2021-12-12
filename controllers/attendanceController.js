const db = require('../models/db')
const personFields = require('../models/person')
const attendanceFields = require('../models/attendanceRecord')
const coupleFields = require('../models/couple') //no
const { Condition, queryTypes } = require('../models/condition')
const { validationResult } = require('express-validator')
const memberFields = require('../models/members')
const { sendError } = require('./errorController')
const { updateMemberToMember, updateMemberToNonMember, updateNonMemberToMember, updateNonMemberToNonMember } = require('./updateController')
const { routes } = require('../routes/routes')

const attendanceController = {
  /**
   * This function renders the attendance record main page
   * @param req - the incoming request containing either the query or body
   * @param res - the result to be sent out after processing the request
   */
   getViewAttendance: function (req, res) {
    const level = req.session.level
    const date = new Date(req.params.date).toISOString()
    if (level === undefined || level === null || (parseInt(level) === 1 && req.session.editId != date)) {
      res.status(401)
      res.render('error', {
        title: '401 Unauthorized Access',
        css: ['global', 'error'],
        status: {
          code: '401',
          message: 'Unauthorized access'
        }
      })
    } else {
      const joinTables = [
        {
          tableName: { person: db.tables.PERSON_TABLE },
          sourceCol: db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.PERSON,
          destCol: 'person.' + personFields.ID
        }
      ]

      const columns = [
        db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.ID + ' as attendance_id',
        db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.DATE + ' as date',
        'person.' + personFields.FIRST_NAME + ' as member_first_name',
        'person.' + personFields.MID_NAME + ' as member_mid_name',
        'person.' + personFields.LAST_NAME + ' as member_last_name',
        'person.' + personFields.MEMBER + ' as member_id'
      ]
      const conditions = new Condition(queryTypes.where)
      conditions.setKeyValue(db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.DATE, date)

      db.find(db.tables.ATTENDANCE_TABLE, [conditions], joinTables, columns, function (result) {
        console.log("Here")
        const data = {}
        data.records = result
        data.scripts = ['viewAttendance']
        data.styles = ['attendanceView']
        data.backLink = 'attendance_main_page'
        console.log(data)

        res.render('view-attendance', data)
      })
    }
  },
  /**
   * This function gets all attendance details and renders the add attendance page
   * @param req - the incoming request containing either the query or body
   * @param res - the result to be sent out after processing the request
   */
  getAddAttendance: function (req, res) {
    const joinTables1 = [
      {
        tableName: db.tables.PERSON_TABLE,
        sourceCol: db.tables.MEMBER_TABLE + '.' + memberFields.PERSON,
        destCol: db.tables.PERSON_TABLE + '.' + personFields.ID
      }
    ]
    let membersNames = []
    db.find(db.tables.MEMBER_TABLE, [], joinTables1, "*", function (result) {
      if (result === null) 
        result = []
      console.log(result)
      membersNames = result
      req.session.editId = null
      res.render('add-attendance-temp', {
        styles: ['forms'],
        scripts: ['addAttendance'],
        Origin: 'coming from forms creation',
        membersNames: membersNames
      })
    })
  },
  /**
   * This function creates a prenuptial row into the prenuptial table
   * when both partners are non-members
   * @param req
   * @param res
   */
  createAttendance: function (req, res) {
    let errors = validationResult(req)
    if (!errors.isEmpty()) {
      errors = errors.errors

      let msg = ''
      errors.forEach((error) => {
        msg += error.msg + '<br>'
      })
      res.send(msg)
    } else {
      const date = req.body.date
      const nonMemberAttendees = []
      const attendees = []
      console.log(req.body)
      const allAttendees = JSON.parse(req.body.attendees)
      console.log("reached")
      console.log(allAttendees)

      allAttendees.forEach(function (attendee) {
        const curAttendee = {}
        if (attendee.person_id != null) {
          curAttendee[attendanceFields.DATE] = date
          curAttendee[attendanceFields.PERSON] = attendee.person_id
          attendees.push(curAttendee)
        } else { // For every non-member attendee, add to nonMemberAttendees to insert to people table
          curAttendee[personFields.FIRST_NAME] = attendee.first_name
          curAttendee[personFields.MID_NAME] = attendee.mid_name
          curAttendee[personFields.LAST_NAME] = attendee.last_name
          nonMemberAttendees.push(curAttendee)
        }
      })

      const matchesDate = new Condition(queryTypes.where)
      matchesDate.setKeyValue(db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.DATE, date)

      // insert non members to person table
      db.find(db.tables.ATTENDANCE_TABLE, matchesDate, [], '*', function(result) {
        if (result && result.length > 0) {
          res.send('EXISTS')
          return;
        }
        console.log(nonMemberAttendees)
        db.insert(db.tables.PERSON_TABLE, nonMemberAttendees, function (result) {
          console.log(result.type)
          if (result) {
            result = result[0]
            nonMemberAttendees.forEach(function (personID) {
              const curAttendee = {}
              curAttendee[attendanceFields.DATE] = date
              curAttendee[attendanceFields.PERSON] = result
              attendees.push(curAttendee)
              result -= 1
            })
          }

          console.log(attendees)
          // insert each person into a new attendance table
          db.insert(db.tables.ATTENDANCE_TABLE, attendees, function (result) {
            if (result !== false) {
              req.session.editId = date
              res.send(true)
            } else {
              res.send(false)
            }
          })
        })
      })
    }
  },
  /**
   * This function renders the edit attendance form page supplying the text fields with
   * details from the existing
   * @param req - the incoming request containing either the query or body
   * @param res - the result to be sent out after processing the request
   */
  getEditAttendance: function (req, res) {
    console.log('req params date' + req.params.date)
    const date = new Date(req.params.date).toISOString()
    if (parseInt(req.session.level) === 3 || parseInt(req.session.editId === parseInt(date))) {
      console.log(date)
      const data = {
        scripts: ['editAttendance', 'edit'],
        styles: ['forms'],
        attendeesMembers: [],
        attendeesNonMembers:[],
        attendees:[],
        members: []
      }
      // join table for the groom
      const joinTables1 = [
        {
          tableName: { person: db.tables.PERSON_TABLE },
          sourceCol: db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.PERSON,
          destCol: 'person.' + personFields.ID
        }
      ]
      
      const matchesDate = new Condition(queryTypes.where)
      matchesDate.setKeyValue(db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.DATE, date)
      const memberId = new Condition(queryTypes.whereNotNull)


      db.find(db.tables.ATTENDANCE_TABLE, [matchesDate], joinTables1, "*", function (result) {
        data.attendeesMembers = result.filter(person => person.member_id != null)
        data.attendeesNonMembers = result.filter(person => person.member_id == null)
        data.attendees = result
      
        let existingUsers = []
        if (result != undefined && result != null)
          existingUsers = result.map(a => a.member_id).filter((v, i, a) => a.indexOf(v) === i && v != null)
        console.log(existingUsers)
        
        const columns = [
          db.tables.MEMBER_TABLE + '.' + memberFields.ID + ' as member_id',
          db.tables.MEMBER_TABLE + '.' + memberFields.PERSON + ' as person_id',
          'person.' + personFields.FIRST_NAME + ' as first_name',
          'person.' + personFields.MID_NAME + ' as middle_name',
          'person.' + personFields.LAST_NAME + ' as last_name'
        ]

        const joinTables2 = [
          {
            tableName: { person: db.tables.PERSON_TABLE },
            sourceCol: db.tables.MEMBER_TABLE + '.' + memberFields.PERSON,
            destCol: 'person.' + personFields.ID
          }
        ]

        const notInAttendance = new Condition(queryTypes.whereNotIn)
        notInAttendance.setArray(db.tables.MEMBER_TABLE + '.' + memberFields.ID, existingUsers)
        
        db.find(db.tables.MEMBER_TABLE, [notInAttendance], joinTables2, columns, function (result) {
          if (result !== null) {
            data.members = result
            console.dir(data)
            res.render('edit-attendance', data)
          }
        })
      })
    } else {
      sendError(req, res, 401)
    }
  },
  /**
   * This function will update the list of attendees
   * @param req - the incoming request containing either the query or body
   * @param res - the result to be sent out after processing the request
   */
  putUpdateAttendance: function (req, res) {
    let errors = validationResult(req)
    if (!errors.isEmpty()) {
      errors = errors.errors

      let msg = ''
      errors.forEach((error) => {
        msg += error.msg + '<br>'
      })
      res.send(msg)
    } else {
      let isChanged = false
      const date = new Date(req.body.date).toISOString()
      const newAttendees = []
      const attendees = []
      const keptAttendanceRecords = []
      const attendeesRaw = JSON.parse(req.body.attendees)
      console.log(`attendeesRaw ${attendeesRaw}`)
      attendeesRaw.forEach(function (attendee) {
        const curAttendee = {}
        if (attendee.attendance_id) {
          keptAttendanceRecords.push(attendee.attendance_id)
        } 
        else if (attendee.member_id) {
          curAttendee[attendanceFields.DATE] = date
          curAttendee[attendanceFields.PERSON] = attendee.person_id
          attendees.push(curAttendee)
        } 
        else {
          curAttendee[personFields.FIRST_NAME] = attendee.first_name
          curAttendee[personFields.MID_NAME] = attendee.mid_name
          curAttendee[personFields.LAST_NAME] = attendee.last_name
          newAttendees.push(curAttendee)
        }
      })

      const notKept = new Condition(queryTypes.whereNotIn)
      notKept.setArray(db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.ID, keptAttendanceRecords)

      const matchesDate = new Condition(queryTypes.where)
      matchesDate.setKeyValue(db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.DATE, date)

      // find the the person ids of each attendance record that was removed in the update
      db.find(db.tables.ATTENDANCE_TABLE, [notKept, matchesDate], [], attendanceFields.PERSON, function (result) {
        let personIDs = []
        if (result)
          personIDs = result.map((row) => row[attendanceFields.PERSON])

        const removedPersons = new Condition(queryTypes.whereIn)
        removedPersons.setArray(db.tables.PERSON_TABLE + '.' + personFields.ID, personIDs)
        console.log('keptAttendanceRecords')
        console.log(keptAttendanceRecords)
        console.log('personIDs')
        console.log(personIDs)

        // delete each attendance record that was removed in the update
        db.delete(db.tables.ATTENDANCE_TABLE, [notKept, matchesDate], function (result) {
          if (result)
            isChanged = true

          const notAMember = new Condition(queryTypes.whereNull)
          notAMember.setField(db.tables.PERSON_TABLE + '.' + personFields.MEMBER)

          // delete each person whose person id was used in the attendance records that were deleted
          db.delete(db.tables.PERSON_TABLE, [removedPersons, notAMember], function (result) {
            // insert every new person into the person table
            db.insert(db.tables.PERSON_TABLE, newAttendees, function (personIDs) {
              if (personIDs) {
                personIDs.forEach(function (personID) {
                  const curAttendee = {}
                  curAttendee[attendanceFields.DATE] = date
                  curAttendee[attendanceFields.PERSON] = personID
                  attendees.push(curAttendee)
                })
                // insert every newly created person into the attendance table
                db.insert(db.tables.ATTENDANCE_TABLE, attendees, function (result) {
                  if (result)
                    isChanged = true
                  if (isChanged)
                    res.send(true)
                  else
                    res.send(false)
                })
              }
            })
          })
        })
      })
    }
  },
  checkIfAttendanceDateExists: function (req, res) {
    console.log('REACHED THIS')
    const date = new Date(req.body.date).toISOString()
    console.log(`THIS IS THE DATE ${date}`)
    const condition = new Condition(queryTypes.where)
    condition.setKeyValue(db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.DATE, date)
    
    // find the the person ids of each attendance record that was removed in the update
    db.find(db.tables.ATTENDANCE_TABLE, condition, [], "*", function (result) {
      console.log(`Value of result is ${result}`)
      if (result == 0)
        res.send(true)
      else
        res.send(false)
    })
  },
  deleteAttendance: function (req, res) {
    const date  = req.body.date

    const condition = new Condition(queryTypes.where)
    condition.setKeyValue(db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.DATE, date)
    
    // find the the person ids of each attendance record that was removed in the update
    db.delete(db.tables.ATTENDANCE_TABLE, condition, function (result) {
      if (result)
        res.send(true)
      else
        res.send(false)
    })
  }
}

module.exports = attendanceController
