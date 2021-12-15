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

    it('Should be able to access postUpdatePerson', () => {
        //Arrange
        req = {
            body: {
                people: '"personId": 12345'
            }
        }

        sandbox.stub(db, "insert").yields(req.body.people);
        expectedResult = req.body.people;

        //Act
        personController.postAddPerson(req, res, callback);

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