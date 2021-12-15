const sinon = require('sinon');
const updateController = require('../controllers/updateController');
const db = require("../models/db");

describe('Update Controller', () => {
    let person = {};
    let res = {};
    let expectedResult;

    const sandbox = sinon.createSandbox();
    beforeEach(() => {
        person = {
            firstName: "John",
            midName: "K",
            lastName: "Doe",
            personId: 123
        }
    })

    afterEach(() => {
        sandbox.restore();
    });

    it("Should have access to updateNonMemberToNonMember where the result yields something", () => {
        //Arrange        
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

    it("Should have access to updateNonMemberToNonMember where the result yields nothing/null", () => {
        //Arrange
        res.send = sandbox.spy();
        expectedResult = false;
        sandbox.stub(db, "update").yields(null);

        //Act
        updateController.updateNonMemberToNonMember(person, function (result) {
            res.send(result);
        });

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });
});