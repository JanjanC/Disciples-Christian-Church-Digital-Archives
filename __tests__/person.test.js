const sinon = require('sinon');
const request = require('supertest');
const app = require('../app');
const personController = require('../controllers/personController');
const db = require("../models/db");

describe('Person Controller', () => {

    let req = {}
    let res = {}
    let callback = null

    const sandbox = sinon.createSandbox();

    beforeEach(() => {
        res = {
            send: sandbox.spy()
        };
    });

    afterEach(() => {
        sandbox.restore();
    });

    it('Should be able to access postAddPerson where the callback is defined', () => {
        //Arrange
        req = {
            body: {
                people: '{"person_id": 12345}'
            }
        }

        sandbox.stub(db, "insert").yields(req.body.people);
        expectedResult = 200;

        //Act
        personController.postAddPerson(req, res, function (result) {
            res.send(200);
        });

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });

    it('Should be able to access postAddPerson where the callback is null', () => {
        //Arrange
        req = {
            body: {
                people: '{"person_id": 12345}'
            }
        }

        sandbox.stub(db, "insert").yields(req.body.people);
        expectedResult = req.body.people;

        //Act
        personController.postAddPerson(req, res, null);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });

    it('Should be able to access putUpdatePerson', () => {
        //Arrange
        expectedResult = true;

        //Act
        personController.putUpdatePerson(req, res, callback);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });

    it('Should be able to access delPerson', () => {
        //Arrange
        expectedResult = true;

        //Act
        personController.delPerson(req, res, callback);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });
});