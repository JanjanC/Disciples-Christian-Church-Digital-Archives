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
    req.session.editId = null

    if (level === undefined || level === null || parseInt(level) === 1) {
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
      conditions.setKeyValue(db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.DATE, req.params.date)

      db.find(db.tables.ATTENDANCE_TABLE, [conditions], joinTables, columns, function (result) {
        const data = {}
        data.records = result
        data.scripts = ['convertDataTable']
        data.styles = ['lists']
        data.backLink = 'forms_main_page'

        res.render('attendance-main-page', data)
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
    db.find(db.tables.MEMBER_TABLE, [], joinTables1, function (result) {
      if (result !== null) {
        membersNames = result
        req.session.editId = null
        res.render('add-attendance-temp', {
          styles: ['forms'],
          scripts: ['addAttendance'],
          Origin: 'coming from forms creation',
          membersNames: membersNames
        })
      }
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
      const attendeesRaw = JSON.parse(req.body.attendees)

      attendeesRaw.forEach(function (attendee) {
        if (attendee.isMember) {
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

      // insert non members to person table
      db.insert(db.tables.PERSON_TABLE, nonMemberAttendees, function (personIDs) {
        if (personIDs) {
          personIDs.forEach(function (personID) {
            const curAttendee = {}
            curAttendee[attendanceFields.DATE] = date
            curAttendee[attendanceFields.PERSON] = personID
            attendees.push(curAttendee)
          })
        }
        // insert each person into a new attendance table
        db.insert(db.tables.PERSON_TABLE, attendees, function (result) {
          if (result !== false) {
            req.session.editId = date
            res.redirect('/view_attendance/' + date)
          } else {
            res.send('ADD ATTENDANCE ERROR')
          }
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
    const date = req.params.date
    if (parseInt(req.session.level) === 3 || parseInt(req.session.editId === parseInt(date))) {
      console.log(date)
      const data = {
        scripts: ['editAttendance', 'edit'],
        styles: ['forms'],
        attendees: [],
        members: []
      }
      // join table for the groom
      const joinTables = [
        {
          tableName: db.tables.PERSON_TABLE,
          sourceCol: db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.PERSON,
          destCol: db.tables.PERSON_TABLE + '.' + personFields.ID
        }
      ]
      const cond = new Condition(queryTypes.where)
      cond.setKeyValue(db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.DATE, date)
      // find the attendees
      db.find(db.tables.ATTENDANCE_TABLE, cond, joinTables, '*', function (result) {
        if (result !== null) {
          data.attendees = result

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
            db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.PERSON + ' as person_id',
            'person.' + personFields.FIRST_NAME + ' as member_first_name',
            'person.' + personFields.MID_NAME + ' as member_mid_name',
            'person.' + personFields.LAST_NAME + ' as member_last_name',
            'person.' + personFields.MEMBER + ' as member_id'
          ]
    
          const conditions = new Condition(queryTypes.where)
          conditions.setKeyValue(db.tables.ATTENDANCE_TABLE + '.' + date)

          db.find(db.tables.ATTENDANCE_TABLE, [conditions], joinTables, columns, function (result) {
              data.members = result
              res.render('edit-attendance', data)
          })
        }
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
      const date = req.body.date
      const newAttendees = []
      const attendees = []
      const keptAttendanceRecords = []
      const attendeesRaw = JSON.parse(req.body.attendees)

      attendeesRaw.forEach(function (attendee) {
        if (attendee.attendance_id) {
          keptAttendanceRecords.push(attendee.attendance_id)
        } else { // For every non-member attendee, add to nonMemberAttendees to insert to people table
          const curAttendee = {}
          curAttendee[personFields.FIRST_NAME] = attendee.first_name
          curAttendee[personFields.MID_NAME] = attendee.mid_name
          curAttendee[personFields.LAST_NAME] = attendee.last_name
          newAttendees.push(curAttendee)
        }
      })

      const condition1 = new Condition(queryTypes.whereNotIn)
      condition1.setKeyValue(db.tables.ATTENDANCE_TABLE + '.' + attendanceFields.ID, keptAttendanceRecords)

      // find the the person ids of each attendance record that was removed in the update
      db.find(db.tables.ATTENDANCE_TABLE, condition1, [], attendanceFields.PERSON, function (result) {
        personIDs = result.map(function (row) {
          return row[attendanceFields.PERSON]
        })
        const condition2 = new Condition(queryTypes.whereIn)
        condition2.setKeyValue(db.tables.PERSON_TABLE + '.' + personFields.ID, personIDs)
        // delete each attendance record that was removed in the update
        db.delete(db.tables.ATTENDANCE_TABLE, condition1, function (result) {
          if (result)
            isChanged = true
          // delete each person whose person id was used in the attendance records that were deleted
          db.delete(db.tables.PERSON_TABLE, condition2, function (result) {
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
  deletePrenup: function (req, res) {
    const nonMembers = JSON.parse(req.body.nonMembers)
    const couples = JSON.parse(req.body.couples)
    const recordId = req.body.recordId

    const nonMembersCond = new Condition(queryTypes.whereIn)
    nonMembersCond.setArray(personFields.ID, nonMembers)

    const couplesCond = new Condition(queryTypes.whereIn)
    couplesCond.setArray(coupleFields.ID, couples)

    const recordCond = new Condition(queryTypes.where)
    recordCond.setKeyValue(prenupRecordFields.ID, recordId)

    db.delete(db.tables.COUPLE_TABLE, couplesCond, function (result) {
      if (result) {
        db.delete(db.tables.PERSON_TABLE, nonMembersCond, function (result) {
          if (nonMembers.length === 0 || result) {
            db.delete(db.tables.PRENUPTIAL_TABLE, recordCond, function (result) {
              if (result || result === 0) {
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
  }
}

module.exports = attendanceController
