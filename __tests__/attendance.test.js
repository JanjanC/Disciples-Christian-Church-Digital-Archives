const sinon = require('sinon');
const request = require('supertest');
const app = require('../app');
const IndexController = require('../controllers/indexController');
const AttendanceController = require('../controllers/attendanceController');
const ErrorController = require('../controllers/errorController')
const db = require('../models/db.js');

describe ('Index Controller', () => {

    let req = {};
    let res = {};

    const sandbox = sinon.createSandbox();

    //Wondering if the levels should be tested given a test account
    describe('Level one access', () => {        

        beforeEach (() => {
            res = {
                render: sandbox.spy(),
                status: sandbox.stub().returns({end: sinon.spy()})
            };
            
            req = {
                session: {
                    level: 1,
                    editId: null
                }
            };
        });

        afterEach(() => {
            sandbox.restore();
        });

        it('Should be able to access attendance main page', () => {
            //Arrange
            const expectedResult =  {
                level: 1,
                styles: ['mainPage'],
                scripts: ['mainAttendance'],
                canSee: false
            }

            //Act
            IndexController.getAttendanceMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.render, 'attendance-main-page', sinon.match({level: expectedResult.level}));
            sinon.assert.calledWith(res.render, 'attendance-main-page', sinon.match({styles: expectedResult.styles}));
            sinon.assert.calledWith(res.render, 'attendance-main-page', sinon.match({scripts: expectedResult.scripts}));
            sinon.assert.calledWith(res.render, 'attendance-main-page', sinon.match({canSee: expectedResult.canSee}));            
        });

        it('Should not be able to access view attendance', () => {
            //Arrange
            req.params = {date: "11/11/2021"}
            const expectedResult =  {
                title: '401 Unauthorized Access',
                css: ['global', 'error'],
                status: {
                  code: '401',
                  message: 'Unauthorized access'
                }
              };

            //Act
            AttendanceController.getViewAttendance(req, res);

            //Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, 'error', sinon.match({title: expectedResult.title}));
            sinon.assert.calledWith(res.render, 'error', sinon.match({css: expectedResult.css}));
            sinon.assert.calledWith(res.render, 'error', sinon.match({status: expectedResult.status}));
        });

        it('Should be able to access view attendance if the editId is set correctly', () => {
            //Arrange
            sandbox.stub(db, "find").yields([{
                attendance_id: 13000000,
                date: '2021-12-31T00:00:00.000Z',
                member_first_name: 'John',
                member_mid_name: 'J',
                member_last_name: 'Doe',
                member_id: 1000001
            }]);
            req.params = {date: "2021-11-11"}
            req.session.editId = new Date("2021-11-11").toISOString()
            const expectedResult =  {
                records: [{
                    attendance_id: 13000000,
                    date: '2021-12-31T00:00:00.000Z',
                    member_first_name: 'John',
                    member_mid_name: 'J',
                    member_last_name: 'Doe',
                    member_id: 1000001
                }],
                scripts: ['viewAttendance'],
                styles: ['lists'],
                backLink: 'attendance_main_page'
            };

            //Act
            AttendanceController.getViewAttendance(req, res);

            //Assert
            sinon.assert.calledWith(res.render, 'view-attendance', sinon.match({records: expectedResult.records}));
            sinon.assert.calledWith(res.render, 'view-attendance', sinon.match({scripts: expectedResult.scripts}));
            sinon.assert.calledWith(res.render, 'view-attendance', sinon.match({styles: expectedResult.styles}));
            sinon.assert.calledWith(res.render, 'view-attendance', sinon.match({backLink: expectedResult.backLink}));
        });

        it('Should not be able to access view attendance if the editId does not match', () => {
            //Arrange
            req.params = {date: "2021-11-11"}
            req.session.editId = new Date("2021-12-11").toISOString()
            const expectedResult =  {
                title: '401 Unauthorized Access',
                css: ['global', 'error'],
                status: {
                  code: '401',
                  message: 'Unauthorized access'
                }
              };

            //Act
            AttendanceController.getViewAttendance(req, res);

            //Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, 'error', sinon.match({title: expectedResult.title}));
            sinon.assert.calledWith(res.render, 'error', sinon.match({css: expectedResult.css}));
            sinon.assert.calledWith(res.render, 'error', sinon.match({status: expectedResult.status}));
        });

        it('Should be able to access new attendance page', () => {
            //Arrange
            sandbox.stub(db, "find").yields([{
                member_id: 1000001,
                address_id: 2000001,
                bap_reg_id: null,
                wedding_reg_id: null,
                prenup_record_id: null,
                person_id: 12000001,
                child_dedication_id: null,
                member_status: 'Active',
                member_type: 'Regular Member (Resident)',
                civil_status: 'Single',
                birthday: '2000-01-01',
                occupation: '',
                workplace: '',
                email: 'johndoe@email.com',
                telephone: '',
                mobile: '09123456789',
                educ_attainment: '',
                alma_mater: '',
                skills: '',
                date_created: '2021-11-28T00:00:00.000Z',
                sex: 'Male',
                family_members: '',
                parents_id: null,
                first_name: 'John',
                middle_name: 'J',
                last_name: 'Doe'
            }]);
            const expectedResult =  {
                styles: ['forms'],
                scripts: ['addAttendance'],
                Origin: 'coming from forms creation',
                membersNames: [{
                    member_id: 1000001,
                    address_id: 2000001,
                    bap_reg_id: null,
                    wedding_reg_id: null,
                    prenup_record_id: null,
                    person_id: 12000001,
                    child_dedication_id: null,
                    member_status: 'Active',
                    member_type: 'Regular Member (Resident)',
                    civil_status: 'Single',
                    birthday: '2000-01-01',
                    occupation: '',
                    workplace: '',
                    email: 'johndoe@email.com',
                    telephone: '',
                    mobile: '09123456789',
                    educ_attainment: '',
                    alma_mater: '',
                    skills: '',
                    date_created: '2021-11-28T00:00:00.000Z',
                    sex: 'Male',
                    family_members: '',
                    parents_id: null,
                    first_name: 'John',
                    middle_name: 'J',
                    last_name: 'Doe'
                }]
            };

            //Act
            AttendanceController.getAddAttendance(req, res);

            //Assert
            sinon.assert.calledWith(res.render, 'add-attendance-temp', sinon.match({styles: expectedResult.styles}));
            sinon.assert.calledWith(res.render, 'add-attendance-temp', sinon.match({scripts: expectedResult.scripts}));
            sinon.assert.calledWith(res.render, 'add-attendance-temp', sinon.match({Origin: expectedResult.Origin}));
            sinon.assert.calledWith(res.render, 'add-attendance-temp', sinon.match({membersNames: expectedResult.membersNames}));
        });

        it('Should be able to redirect when it is able to insert new attendance', () => {
            //Arrange
            req.body = {
                date: "2021-11-11",
                attendees: JSON.stringify([{person_id:12000010}])
            };
            sandbox.stub(db, "find").yields(false);
            sandbox.stub(db, "insert").yields(true);
            res.send = sandbox.spy();

            //Act
            AttendanceController.createAttendance(req, res);

            //Assert
            sinon.assert.calledWith(res.send, true);
        });

        it('Should not be able to redirect when it is unable to insert new attendance', () => {
            //Arrange
            req.body = {
                date: "2021-11-11",
                attendees: JSON.stringify([{person_id:12000010}])
            };
            sandbox.stub(db, "find").yields(false);
            sandbox.stub(db, "insert").yields(false);
            res.send = sandbox.spy();

            //Act
            AttendanceController.createAttendance(req, res);

            //Assert
            sinon.assert.calledWith(res.send, false);
        });

        it('Should send a signal if an attendance already exists with the given date', () => {
            //Arrange
            req.body = {
                date: "2021-11-11",
                attendees: JSON.stringify([{person_id:12000010}])
            };
            sandbox.stub(db, "find").yields([{
                attendance_id: 11000000,
                date: new Date("2021-11-11").toISOString,
                person_id: 12000001}
            ]);
            sandbox.stub(db, "insert").yields(false);
            res.send = sandbox.spy();

            //Act
            AttendanceController.createAttendance(req, res);

            //Assert
            sinon.assert.calledWith(res.send, 'EXISTS');
        });

        it('Should be unable to get the edit attendance page', () => {
            //Arrange
            req.params = {date: "2021-11-11"};
            const spy = sandbox.spy(ErrorController, "sendError")
            const expectedResult = {
                scripts: [ 'editAttendance', 'edit' ],
                styles: [ 'forms' ],
                attendeesMembers: [{
                    attendance_id: 13000069,
                    person_id: 12000001,
                    date: '2021-12-11T00:00:00.000Z',
                    member_id: 1000001,
                    first_name: 'John',
                    middle_name: 'J',
                    last_name: 'Doe'
                }],
                attendeesNonMembers: [{
                    attendance_id: 13000060,
                    person_id: 12000065,
                    date: '2021-12-1T00:00:00.000Z',
                    member_id: null,
                    first_name: 'Jane',
                    middle_name: 'J',
                    last_name: 'Doe'
                }],
                attendees: [{
                        attendance_id: 13000069,
                        person_id: 12000001,
                        date: '2021-12-11T00:00:00.000Z',
                        member_id: 1000001,
                        first_name: 'John',
                        middle_name: 'J',
                        last_name: 'Doe'
                    }, {
                        attendance_id: 13000060,
                        person_id: 12000065,
                        date: '2021-12-1T00:00:00.000Z',
                        member_id: null,
                        first_name: 'Jane',
                        middle_name: 'J',
                        last_name: 'Doe'
                }],
                members: [
                  {
                    member_id: 1000001,
                    person_id: 12000010,
                    first_name: 'Amos Rafael',
                    middle_name: 'J',
                    last_name: 'Cacha'
                  }
                ]
              };

            //Act
            AttendanceController.getEditAttendance(req, res);

            //Assert
            sinon.assert.calledOnce(spy)
            //sinon.assert.calledWith(ErrorController.sendError, req, res, 401);
        });
        
    });
});