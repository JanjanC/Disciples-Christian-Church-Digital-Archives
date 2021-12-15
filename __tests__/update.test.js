const sinon = require('sinon');
const request = require('supertest');
const app = require('../app');
const updateController = require('../controllers/updateController');
const db = require("../models/db");

describe('Update Controller', () => {
    let person = {};
    let res = {};

    const sandbox = sinon.createSandbox();

    afterEach(() => {
        sandbox.restore();
    });

    it("Should have access to updateNonMemberToNonMember", () => {
        //Arrange
        person = {
            firstName: "John",
            midName: "K",
            lastName: "Doe",
            personId: 123
        }
        res.send = sandbox.spy();
        expectedResult = person.personId;
        sandbox.stub(db, "update").yields(person.personId);

        //Act
        updateController.updateNonMemberToNonMember(person, function (result) {
            res.send(result);
        });

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });
});