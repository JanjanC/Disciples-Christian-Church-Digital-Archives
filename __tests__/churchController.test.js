const sinon = require("sinon");
const churchController = require("../controllers/churchController");
const db = require("../models/db");

describe("churchController", () => {
    let req = {};
    let res = {};

    let expectedResult = {};

    let sandbox = sinon.createSandbox();

    describe("getChurchInfo", () => {
        let responseStub;

        beforeEach(() => {
            req = {
                query: {
                    church_id: 1,
                },
            };
            res = {
                send: sandbox.spy(),
            };
        });

        afterEach(() => {
            sandbox.restore();
            responseStub.restore();
        });

        it("Should return a true response", () => {
            // Arrange
            expectedResult = true;
            responseStub = sandbox.stub(db, "find").yields(expectedResult);

            // Act
            churchController.getChurchInfo(req, res);

            // Assert
            sinon.assert.calledWith(res.send, JSON.stringify(true));
        });

        it("Should return a false response", () => {
            // Arrange
            expectedResult = false;
            responseStub = sandbox.stub(db, "find").yields(expectedResult);

            // Act
            churchController.getChurchInfo(req, res);

            // Assert
            sinon.assert.calledWith(res.send, JSON.stringify(expectedResult));
        });

        it("Should return a true update response", () => {
            req = {
                body: {
                    church_id: 1,
                    address_id: 1,
                },
            };

            // Arrange
            expectedResult = true;
            responseStub = sandbox.stub(db, "update").yields(expectedResult);

            // Act
            churchController.putUpdateChurch(req, res);

            // Assert
            sinon.assert.calledWith(res.send, expectedResult);
        });
    });
});
