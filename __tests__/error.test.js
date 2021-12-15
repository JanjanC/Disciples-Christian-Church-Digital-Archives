const sinon = require("sinon");

const errorController = require("../controllers/errorController");

describe("errorController", () => {
    let req = {};
    let res = {};
    let expectedResult = {};

    const sandbox = sinon.createSandbox();

    describe("processes errors correctly", () => {
        beforeEach(() => {
            res = {
                status: sandbox.stub().returns({ end: sinon.spy() }),
                render: sandbox.spy(),
            };
            req = {
                session: { level: 1 },
            };
        });

        afterEach(() => {
            sandbox.restore();
        });

        it("renders a 404 error correctly", async () => {
            // Arrange
            expectedResult = {
                title: "Page Not Found",
                css: ["global", "error"],
                status: {
                    code: 404,
                    message: "Page Not Found",
                },
                backLink: "/main_page",
                level: 1,
            };

            // Act
            errorController.sendError(req, res, 404);

            // Assert
            sinon.assert.calledWith(res.status, 404);
            sinon.assert.calledWith(res.render, "error", sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ status: expectedResult.status }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ backLink: expectedResult.backLink }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ level: expectedResult.level }));
        });

        it("renders a 401 error correctly", async () => {
            // Arrange
            expectedResult = {
                title: "Unauthorized Access",
                css: ["global", "error"],
                status: {
                    code: 401,
                    message: "Unauthorized Access",
                },
                backLink: "/main_page",
                level: 1,
            };

            // Act
            errorController.sendError(req, res, 401);

            // Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, "error", sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ status: expectedResult.status }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ backLink: expectedResult.backLink }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ level: expectedResult.level }));
        });

        it("correctly renders an error with a given error message", async () => {
            // Arrange
            expectedResult = {
                title: "Internal Server Error: Something messed up!",
                css: ["global", "error"],
                status: {
                    code: 501,
                    message: "Internal Server Error: Something messed up!",
                },
                backLink: "/main_page",
                level: 1,
            };

            // Act
            errorController.sendError(req, res, 501, (msg = "Internal Server Error: Something messed up!"));

            // Assert
            sinon.assert.calledWith(res.status, 501);
            sinon.assert.calledWith(res.render, "error", sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ status: expectedResult.status }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ backLink: expectedResult.backLink }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ level: expectedResult.level }));
        });
    });
});
