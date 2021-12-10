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

        it("returns an appropriate response", () => {
            // Arrange
            expectedResult = true;
            responseStub = sandbox.stub(db, "find").yields("", "", [], "", expectedResult);

            // Act
            churchController.getChurchInfo(req, res);

            // Assert
            sinon.assert.calledWith(res.send, JSON.stringify(expectedResult));
        });
    });
});
