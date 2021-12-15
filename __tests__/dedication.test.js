const sinon = require('sinon');
const dedicationController = require('../controllers/dedicationController');
const db = require("../models/db");

describe('Dedication Controller', () => {
    let req = {};
    let res = {};
    let expectedResult;

    const sandbox = sinon.createSandbox();

    beforeEach(() => {
        res = {
            render: sandbox.spy(),
            send: sandbox.spy()
        };
    });

    afterEach(() => {
        sandbox.restore();
    });

    it('Should not be able to access getAddDedicationPage', () => {
        //Arrange
        req = {
            session: {
                level: null
            }
        }

        expectedResult = {
            title: '401 Unauthorized Access',
            css: ['global', 'error'],
            status: {
                code: '401',
                message: 'Unauthorized access'
            },
            backLink: '/forms_main_page'
        };

        //Act
        dedicationController.getAddDedicationPage(req, res);

        //Assert
        sinon.assert.calledWith(res.render, 'error', sinon.match({ title: expectedResult.title }));
        sinon.assert.calledWith(res.render, 'error', sinon.match({ css: expectedResult.css }));
        sinon.assert.calledWith(res.render, 'error', sinon.match({ status: expectedResult.status }));
        sinon.assert.calledWith(res.render, 'error', sinon.match({ backLink: expectedResult.backLink }));
    });

    it('Should be able to access getAddDedicationPage', () => {
        //Arrange
        req = {
            session: {
                level: 2
            }
        };

        sandbox.stub(db, 'find').yields([{
            person_id: 1234,
        }]);

        expectedResult = {
            noDedicationMembers: [],
            members: [{ person_id: 1234 }],
            styles: ['forms'],
            scripts: ['addDedication'],
            backLink: '/dedication_main_page',
            males: [],
            females: []
        };

        //Act
        dedicationController.getAddDedicationPage(req, res);

        //Assert
        sinon.assert.calledWith(res.render, 'add-child-dedication', expectedResult);
    });

    it('Should be able to access putUpdateChild where the update was successful', () => {
        //Arrange
        req = {
            body: {
                isOldMember: null,
                person: '{"firstName": "Jane", "midName": "K", "lastName": "Doe", "personId": 12345, "isMember": false}',
                isNewMember: null,
                prenupRecId: 123,
                coupleId: 456,
                oldPersonId: 12345
            }
        }

        sandbox.stub(db, "update").yields(req.body.oldPersonId);
        expectedResult = req.body.oldPersonId;

        //Act
        dedicationController.putUpdateChild(req, res);

        //Assert
        sinon.assert.calledWith(res.send, JSON.stringify(expectedResult));
    });

    it('Should be able to access putUpdateChild where the update was unsuccessful', () => {
        //Arrange
        req = {
            body: {
                isOldMember: null,
                person: '{"firstName": "Jane", "midName": "K", "lastName": "Doe", "personId": 12345, "isMember": false}',
                isNewMember: null,
                prenupRecId: 123,
                coupleId: 456,
                oldPersonId: 12345
            }
        }

        sandbox.stub(db, "update").yields(null);
        expectedResult = false;

        //Act
        dedicationController.putUpdateChild(req, res);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });

    it('Should be able to access putUpdateGuardian where the update was successful', () => {
        //Arrange
        req = {
            body: {
                isFirstGuardian: true,
                isOldMember: null,
                person: '{"firstName": "Jane", "midName": "K", "lastName": "Doe", "personId": 12345, "isMember": false}',
                prenupRecId: 123,
                coupleId: 456,
                oldPersonId: 12345,
                oldMemberId: 12345
            }
        }

        sandbox.stub(db, "update").yields(req.body.oldPersonId);
        expectedResult = req.body.oldPersonId;

        //Act
        dedicationController.putUpdateGuardian(req, res);

        //Assert
        sinon.assert.calledWith(res.send, JSON.stringify(expectedResult));
    });

    it('Should be able to access putUpdateGuardian where the update was unsuccessful', () => {
        //Arrange
        req = {
            body: {
                isFirstGuardian: true,
                isOldMember: null,
                person: '{"firstName": "Jane", "midName": "K", "lastName": "Doe", "personId": 12345, "isMember": false}',
                prenupRecId: 123,
                coupleId: 456,
                oldPersonId: 12345,
                oldMemberId: 12345
            }
        }

        sandbox.stub(db, "update").yields(null);
        expectedResult = false;

        //Act
        dedicationController.putUpdateGuardian(req, res);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });

    it('Should be able to access putUpdateDedication where the update was successful', () => {
        //Arrange
        req = {
            body: {
                location: "Kinderheim",
                officiant: "John",
                recordId: 12345,
                date: '2021-12-25T00:00:00.000Z'
            }
        }
        sandbox.stub(db, "update").yields([{
            location: "Kinderheim",
            officiant: "John",
            recordId: 12345,
            date: '2021-12-25T00:00:00.000Z'
        }]);
        expectedResult = true;

        //Act
        dedicationController.putUpdateDedication(req, res);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });

    it('Should be able to access putUpdateDedication where the update was unsuccessful', () => {
        //Arrange
        req = {
            body: {
                location: "Kinderheim",
                officiant: "John",
                recordId: 12345,
                date: '2021-12-25T00:00:00.000Z'
            }
        }
        sandbox.stub(db, "update").yields(null);
        expectedResult = false;

        //Act
        dedicationController.putUpdateDedication(req, res);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });

    it('Should be able to access putUpdateWitness where the update was successful', () => {
        //Arrange
        req = {
            body: {
                isOldMember: null,
                person: '{"firstName": "Jane", "midName": "K", "lastName": "Doe", "personId": 12345, "isMember": false}',
                oldPersonId: 12345,
                witnessId: 45678,
            }
        }

        sandbox.stub(db, "update").yields(req.body.oldPersonId);
        expectedResult = req.body.oldPersonId;

        //Act
        dedicationController.putUpdateGuardian(req, res);

        //Assert
        sinon.assert.calledWith(res.send, JSON.stringify(expectedResult));
    });

    it('Should be able to access putUpdateWitness where the update was unsuccessful', () => {
        //Arrange
        req = {
            body: {
                isOldMember: null,
                person: '{"firstName": "Jane", "midName": "K", "lastName": "Doe", "personId": 12345, "isMember": false}',
                oldPersonId: 12345,
                witnessId: 45678,
            }
        }

        sandbox.stub(db, "update").yields(null);
        expectedResult = false;

        //Act
        dedicationController.putUpdateGuardian(req, res);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });
});