const sinon = require('sinon');
const observationController = require('../controllers/observationController');
const db = require("../models/db");

describe('Observation Controller', () => {
    let person = {};
    let res = {};
    let expectedResult;

    const sandbox = sinon.createSandbox();
    beforeEach(() => {
        req = {
            body: {
                observation_id: 1234,
                observer: "Johan",
                observee: "Nina",
                comment: "Nicely Done"
            }
        };

        res = {
            send: sandbox.spy(),
            render: sandbox.spy()
        };
    })

    afterEach(() => {
        sandbox.restore();
    });

    it("Should have access to postAddObservation", () => {
        //Arrange        
        sandbox.stub(db, "insert").yields([1234]);
        expectedResult = {
            observer: "Johan",
            observee_id: "Nina",
            comment: "Nicely Done",
            date: new Date().toISOString(),
            observation_id: 1234,
            layout: false
        };

        //Act
        observationController.postAddObservation(req, res);

        //Assert
        sinon.assert.calledWith(res.render, 'partials/observation', expectedResult);
    });

    it("Should have access to putUpdateObservation where the update is successful", () => {
        //Arrange                
        sandbox.stub(db, "update").yields([{
            observer: "Johan",
            observee_id: "Nina",
            comment: "Nicely Done",
        }]);
        expectedResult = true;

        //Act
        observationController.putUpdateObservation(req, res);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });

    it("Should have access to putUpdateObservation where the update is unsuccessful", () => {
        //Arrange        
        sandbox.stub(db, "update").yields(null);
        expectedResult = false;

        //Act
        observationController.putUpdateObservation(req, res);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });

    it("Should have access to delObservation where the delete is successful", () => {
        //Arrange                
        sandbox.stub(db, "delete").yields(req.body.observation_id);
        expectedResult = true;

        //Act
        observationController.delObservation(req, res);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });

    it("Should have access to delObservation where the delete is unsuccessful", () => {
        //Arrange                
        sandbox.stub(db, "delete").yields(null);
        expectedResult = false;

        //Act
        observationController.delObservation(req, res);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });
});