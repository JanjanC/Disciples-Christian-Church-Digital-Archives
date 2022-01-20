const sinon = require("sinon");
const PersonController = require("../controllers/personController");

describe("Person Controller", () => {
    let req = {};
    let res = {};
    let callback = null;

    const sandbox = sinon.createSandbox();

    beforeEach(() => {
        res = {
            send: sandbox.spy(),
        };
    });

    afterEach(() => {
        sandbox.restore();
    });

    it("Should send result in putUpdatePerson", () => {
        //Arrange
        expectedResult = true;

        //Act
        PersonController.putUpdatePerson(req, res, callback);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });

    it("Should send result in delPerson", () => {
        //Arrange
        expectedResult = true;

        //Act
        PersonController.delPerson(req, res, callback);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });
});
