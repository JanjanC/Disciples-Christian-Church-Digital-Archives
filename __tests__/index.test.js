const sinon = require("sinon");
const IndexController = require("../controllers/indexController");

describe("Index Controller", () => {
    let req = {};
    let res = {};

    const sandbox = sinon.createSandbox();

    //Wondering if the levels should be tested given a test account
    describe("Level one access", () => {
        req = {
            session: {
                level: 1,
                editId: null,
            },
        };

        beforeEach(() => {
            res = {
                render: sandbox.spy(),
                status: sandbox.stub().returns({ end: sinon.spy() }),
            };
        });

        afterEach(() => {
            sandbox.restore();
        });

        it("Should be able to access getMainPage", () => {
            //Arrange
            expectedResult = {
                level: 1,
                styles: ["mainPage"],
                scripts: [""],
                canSee: false,
            };

            //Act
            IndexController.getMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.render, "main-page", sinon.match({ level: expectedResult.level }));
            sinon.assert.calledWith(res.render, "main-page", sinon.match({ styles: expectedResult.styles }));
            sinon.assert.calledWith(res.render, "main-page", sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, "main-page", sinon.match({ canSee: expectedResult.canSee }));
        });

        it("Should be able to access getFormsPage", () => {
            //Arrange
            expectedResult = {
                level: 1,
                styles: ["mainPage"],
                scripts: [""],
                canSee: false,
                backLink: "main_page",
            };

            //Act
            IndexController.getFormsMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.render, "forms-main-page", sinon.match({ level: expectedResult.level }));
            sinon.assert.calledWith(res.render, "forms-main-page", sinon.match({ styles: expectedResult.styles }));
            sinon.assert.calledWith(res.render, "forms-main-page", sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, "forms-main-page", sinon.match({ canSee: expectedResult.canSee }));
            sinon.assert.calledWith(res.render, "forms-main-page", sinon.match({ backLink: expectedResult.backLink }));
        });

        it("Should not be able to access getMemberMainPage", () => {
            //Arrange
            expectedResult = {
                title: "401 Unauthorized Access",
                css: ["global", "error"],
                status: {
                    code: "401",
                    message: "Unauthorized access",
                },
            };

            //Act
            IndexController.getMemberMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, "error", sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ status: expectedResult.status }));
        });

        it("Should not be able to access getDedicationMainPage", () => {
            //Arrange
            expectedResult = {
                title: "401 Unauthorized Access",
                css: ["global", "error"],
                scripts: ["convertDataTable"],
                status: {
                    code: "401",
                    message: "Unauthorized access",
                },
            };

            //Act
            IndexController.getDedicationMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, "error", sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ status: expectedResult.status }));
        });

        it("Should not be able to access getPrenupMainPage", () => {
            //Arrange
            expectedResult = {
                title: "401 Unauthorized Access",
                css: ["global", "error"],
                status: {
                    code: "401",
                    message: "Unauthorized access",
                },
            };

            //Act
            IndexController.getPrenupMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, "error", sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ status: expectedResult.status }));
        });

        it("Should not be able to access getWeddingMainPage", () => {
            //Arrange
            expectedResult = {
                title: "401 Unauthorized Access",
                css: ["global", "error"],
                status: {
                    code: "401",
                    message: "Unauthorized access",
                },
            };

            //Act
            IndexController.getWeddingMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, "error", sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ status: expectedResult.status }));
        });

        it("Should not be able to access getBapRecordsMainPage", () => {
            //Arrange
            expectedResult = {
                title: "401 Unauthorized Access",
                css: ["global", "error"],
                status: {
                    code: "401",
                    message: "Unauthorized access",
                },
            };

            //Act
            IndexController.getBapRecordsMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, "error", sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, "error", sinon.match({ status: expectedResult.status }));
        });
    });
    /*
    describe('Helper', () => {        
        beforeEach (() => {
            res = {
                send: sandbox.stub().returns({end: sinon.spy()})
            };
        });

        afterEach(() => {
            sandbox.restore();
        });

        it('Passwords should be the same', () => {
            req = {
                body: {
                    confirmPass: 'pass123',
                    currPass: 'pass123'
                }
            }

            //Act
            IndexController.postComparePasswords(req, res);

            //Assert
            sinon.assert.calledOnce(res.send(true).end);                 
        });
    });
    */
});
