const sinon = require('sinon');
const request = require('supertest');
const app = require('../app');
const indexController = require('../controllers/indexController');
const db = require("../models/db");
const bcrypt = require('bcrypt')

describe('Index Controller', () => {

    let req = {};
    let res = {};
    let expectedResult;
    const sandbox = sinon.createSandbox();

    //Wondering if the levels should be tested given a test account
    describe('Level one access', () => {
        req = {
            session: {
                level: 1,
                editId: null
            }
        }

        beforeEach(() => {
            res = {
                render: sandbox.spy(),
                status: sandbox.stub().returns({ end: sinon.spy() })
            };
        });

        afterEach(() => {
            sandbox.restore();
        });

        it('Should be able to access getMainPage', () => {
            //Arrange
            expectedResult = {
                level: 1,
                styles: ['mainPage'],
                scripts: [''],
                canSee: false
            }

            //Act
            indexController.getMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.render, 'main-page', sinon.match({ level: expectedResult.level }));
            sinon.assert.calledWith(res.render, 'main-page', sinon.match({ styles: expectedResult.styles }));
            sinon.assert.calledWith(res.render, 'main-page', sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, 'main-page', sinon.match({ canSee: expectedResult.canSee }));
        });

        it('Should be able to access getFormsPage', () => {
            //Arrange
            expectedResult = {
                level: 1,
                styles: ['mainPage'],
                scripts: [''],
                canSee: false,
                backLink: 'main_page'
            }

            //Act
            indexController.getFormsMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.render, 'forms-main-page', sinon.match({ level: expectedResult.level }));
            sinon.assert.calledWith(res.render, 'forms-main-page', sinon.match({ styles: expectedResult.styles }));
            sinon.assert.calledWith(res.render, 'forms-main-page', sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, 'forms-main-page', sinon.match({ canSee: expectedResult.canSee }));
            sinon.assert.calledWith(res.render, 'forms-main-page', sinon.match({ backLink: expectedResult.backLink }));
        });

        it('Should not be able to access getMemberMainPage', () => {
            //Arrange
            expectedResult = {
                title: '401 Unauthorized Access',
                css: ['global', 'error'],
                status: {
                    code: '401',
                    message: 'Unauthorized access'
                }
            };

            //Act
            indexController.getMemberMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, 'error', sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, 'error', sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, 'error', sinon.match({ status: expectedResult.status }));
        });

        it('Should not be able to access getDedicationMainPage', () => {
            //Arrange
            expectedResult = {
                title: '401 Unauthorized Access',
                css: ['global', 'error'],
                scripts: ['convertDataTable'],
                status: {
                    code: '401',
                    message: 'Unauthorized access'
                }
            };

            //Act
            indexController.getDedicationMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, 'error', sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, 'error', sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, 'error', sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, 'error', sinon.match({ status: expectedResult.status }));
        });

        it('Should not be able to access getPrenupMainPage', () => {
            //Arrange
            expectedResult = {
                title: '401 Unauthorized Access',
                css: ['global', 'error'],
                status: {
                    code: '401',
                    message: 'Unauthorized access'
                }
            };

            //Act
            indexController.getPrenupMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, 'error', sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, 'error', sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, 'error', sinon.match({ status: expectedResult.status }));
        });

        it('Should not be able to access getWeddingMainPage', () => {
            //Arrange
            expectedResult = {
                title: '401 Unauthorized Access',
                css: ['global', 'error'],
                status: {
                    code: '401',
                    message: 'Unauthorized access'
                }
            };

            //Act
            indexController.getWeddingMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, 'error', sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, 'error', sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, 'error', sinon.match({ status: expectedResult.status }));
        });

        it('Should not be able to access getBapRecordsMainPage', () => {
            //Arrange
            expectedResult = {
                title: '401 Unauthorized Access',
                css: ['global', 'error'],
                status: {
                    code: '401',
                    message: 'Unauthorized access'
                }
            };

            //Act
            indexController.getBapRecordsMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.status, 401);
            sinon.assert.calledWith(res.render, 'error', sinon.match({ title: expectedResult.title }));
            sinon.assert.calledWith(res.render, 'error', sinon.match({ css: expectedResult.css }));
            sinon.assert.calledWith(res.render, 'error', sinon.match({ status: expectedResult.status }));
        });
    });

    describe('Level three access', () => {

        beforeEach(() => {
            req = {
                session: {
                    level: 3,
                    editId: 123
                }
            }
            res = {
                render: sandbox.spy(),
            };
        });

        afterEach(() => {
            sandbox.restore();
        });

        it("Should have access to level three getMemberMainPage", () => {
            // Arrange
            sandbox.stub(db, "find").yields([{
                person_id: 123,
                address_id: 456,
            }]);

            expectedResult = {
                styles: ['lists'],
                scripts: ['convertDataTable'],
                canSee: true
            };

            // Act
            indexController.getMemberMainPage(req, res);

            // Assert
            sinon.assert.calledWith(res.render, 'member-main-page', sinon.match({ styles: expectedResult.styles }));
            sinon.assert.calledWith(res.render, 'member-main-page', sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, 'member-main-page', sinon.match({ canSee: expectedResult.canSee }));
        });

        it('Should have access to level three getFormsPage', () => {
            //Arrange
            expectedResult = {
                level: 3,
                styles: ['mainPage'],
                scripts: [''],
                canSee: true,
                backLink: 'main_page'
            }

            //Act
            indexController.getFormsMainPage(req, res);

            //Assert
            sinon.assert.calledWith(res.render, 'forms-main-page', sinon.match({ level: expectedResult.level }));
            sinon.assert.calledWith(res.render, 'forms-main-page', sinon.match({ styles: expectedResult.styles }));
            sinon.assert.calledWith(res.render, 'forms-main-page', sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, 'forms-main-page', sinon.match({ canSee: expectedResult.canSee }));
            sinon.assert.calledWith(res.render, 'forms-main-page', sinon.match({ backLink: expectedResult.backLink }));
        });

        it("Should have access to level three getDedicationMainPage", () => {
            // Arrange
            sandbox.stub(db, "find").yields([{
                infant_first_name: 'John',
                infant_mid_name: 'K',
                infant_last_name: 'Peta',
                guardianOne_first_name: 'Johan',
                guardianOne_mid_name: 'K',
                guardianOne_last_name: 'Liebert',
                guardianTwo_first_name: 'Nina',
                guardianTwo_mid_name: 'K',
                guardianTwo_last_name: 'Fortner',
                date: '2021-12-31T00:00:00.000Z'
            }]);

            expectedResult = {
                styles: ['lists'],
                scripts: ['convertDataTable'],
                dedication: [{
                    infant_first_name: 'John',
                    infant_mid_name: 'K',
                    infant_last_name: 'Peta',
                    guardianOne_first_name: 'Johan',
                    guardianOne_mid_name: 'K',
                    guardianOne_last_name: 'Liebert',
                    guardianTwo_first_name: 'Nina',
                    guardianTwo_mid_name: 'K',
                    guardianTwo_last_name: 'Fortner',
                    date: '2021-12-31T00:00:00.000Z'

                }],
                backLink: 'forms_main_page'
            };

            // Act
            indexController.getDedicationMainPage(req, res);

            // Assert
            sinon.assert.calledWith(res.render, 'dedication-main-page', sinon.match({ styles: expectedResult.styles }));
            sinon.assert.calledWith(res.render, 'dedication-main-page', sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, 'dedication-main-page', sinon.match({ dedication: expectedResult.dedication }));
            sinon.assert.calledWith(res.render, 'dedication-main-page', sinon.match({ backLink: expectedResult.backLink }));
        });

        it("Should have access to level three getPrenupMainPage", () => {
            // Arrange
            sandbox.stub(db, "find").yields([{
                record_id: '12345',
                date: '2021-12-25T00:00:00.000Z',
                date_of_wedding: '2021-12-31T00:00:00.000Z',
                bride_first_name: 'Rose',
                bride_mid_name: 'M',
                bride_last_name: 'Maiden',
                groom_first_name: 'Lily',
                groom_mid_name: 'Y',
                groom_last_name: 'Maria',
            }]);

            expectedResult = {
                styles: ['lists'],
                scripts: ['convertDataTable'],
                prenup: [{
                    record_id: '12345',
                    date: '2021-12-25T00:00:00.000Z',
                    date_of_wedding: '2021-12-31T00:00:00.000Z',
                    bride_first_name: 'Rose',
                    bride_mid_name: 'M',
                    bride_last_name: 'Maiden',
                    groom_first_name: 'Lily',
                    groom_mid_name: 'Y',
                    groom_last_name: 'Maria',
                }],
                backLink: 'forms_main_page'
            };

            // Act
            indexController.getPrenupMainPage(req, res);

            // Assert
            sinon.assert.calledWith(res.render, 'prenup-main-page', sinon.match({ styles: expectedResult.styles }));
            sinon.assert.calledWith(res.render, 'prenup-main-page', sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, 'prenup-main-page', sinon.match({ prenup: expectedResult.prenup }));
            sinon.assert.calledWith(res.render, 'prenup-main-page', sinon.match({ backLink: expectedResult.backLink }));
        });

        it("Should have access to level three getWeddingMainPage", () => {
            // Arrange
            sandbox.stub(db, "find").yields([{
                wedding_id: '12345',
                date: '2021-12-25T00:00:00.000Z',
                date_of_wedding: '2021-12-31T00:00:00.000Z',
                bride_first_name: 'Rose',
                bride_mid_name: 'M',
                bride_last_name: 'Maiden',
                groom_first_name: 'Lily',
                groom_mid_name: 'Y',
                groom_last_name: 'Maria',
            }]);

            expectedResult = {
                styles: ['lists'],
                scripts: ['convertDataTable'],
                prenup: [{
                    wedding_id: '12345',
                    date: '2021-12-25T00:00:00.000Z',
                    date_of_wedding: '2021-12-31T00:00:00.000Z',
                    bride_first_name: 'Rose',
                    bride_mid_name: 'M',
                    bride_last_name: 'Maiden',
                    groom_first_name: 'Lily',
                    groom_mid_name: 'Y',
                    groom_last_name: 'Maria',
                }],
                backLink: 'forms_main_page'
            };

            // Act
            indexController.getWeddingMainPage(req, res);

            // Assert
            sinon.assert.calledWith(res.render, 'wedding-main-page', sinon.match({ styles: expectedResult.styles }));
            sinon.assert.calledWith(res.render, 'wedding-main-page', sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, 'wedding-main-page', sinon.match({ prenup: expectedResult.prenup }));
            sinon.assert.calledWith(res.render, 'wedding-main-page', sinon.match({ backLink: expectedResult.backLink }));
        });

        it("Should have access to level three getBapRecordsMainPage", () => {
            // Arrange
            sandbox.stub(db, "find").yields([{
                reg_id: '12345',
                date: '2021-12-25T00:00:00.000Z',
                date_created: '2021-12-31T00:00:00.000Z',
                place: 'Kinderheim',
                member_first_name: 'Rose',
                member_mid_name: 'M',
                member_last_name: 'Maiden',
                member_id: '123',
                officiant_first_name: 'Lily',
                officiant_mid_name: 'Y',
                officiant_last_name: 'Maria',
                officiant_id: '456'
            }]);

            expectedResult = {
                records: [{
                    reg_id: '12345',
                    date: '2021-12-25T00:00:00.000Z',
                    date_created: '2021-12-31T00:00:00.000Z',
                    place: 'Kinderheim',
                    member_first_name: 'Rose',
                    member_mid_name: 'M',
                    member_last_name: 'Maiden',
                    member_id: '123',
                    officiant_first_name: 'Lily',
                    officiant_mid_name: 'Y',
                    officiant_last_name: 'Maria',
                    officiant_id: '456'
                }],
                scripts: ['convertDataTable'],
                styles: ['lists'],
                backLink: 'forms_main_page'
            };

            // Act
            indexController.getBapRecordsMainPage(req, res);

            // Assert
            sinon.assert.calledWith(res.render, 'baptismal-main-page', sinon.match({ records: expectedResult.records }));
            sinon.assert.calledWith(res.render, 'baptismal-main-page', sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, 'baptismal-main-page', sinon.match({ styles: expectedResult.styles }));
            sinon.assert.calledWith(res.render, 'baptismal-main-page', sinon.match({ backLink: expectedResult.backLink }));
        });

        it("Should have access to level three getSettings", () => {
            // Arrange
            sandbox.stub(db, "findAll").yields([{
                passwords: {
                    low: 'NormandyN7',
                    med: 'HelloSweng',
                    high: 'Coffee118'
                }
            }]);

            expectedResult = {
                scripts: ['settings'],
                styles: ['settings'],
                passwords: {}
            };

            // Act
            indexController.getSettings(req, res);

            // Assert
            sinon.assert.calledWith(res.render, 'settings-page', sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, 'settings-page', sinon.match({ styles: expectedResult.styles }));
            sinon.assert.calledWith(res.render, 'settings-page', sinon.match({ passwords: expectedResult.passwords }));
        });

        it("Should have access to level three postChangePassword", () => {
            // Arrange
            req = {
                body: {
                    level: 3,
                    password: 'Coffee118'
                },
                session: {
                    level: 3
                }
            };

            res = {
                send: sandbox.spy()
            }

            sandbox.stub(bcrypt, "hash").yields(null, true);
            sandbox.stub(db, "update").yields(true);

            expectedResult = true;

            // Act
            indexController.postChangePassword(req, res);

            // Assert
            sinon.assert.calledWith(res.send, expectedResult);
        });

        it("PostComparePassword should be passing accordingly", () => {
            // Arrange
            req = {
                body: {
                    currPass: 'Coffee118',
                    confirmPass: 'Coffee118'
                },
            };

            res = {
                send: sandbox.spy()
            }

            sandbox.stub(bcrypt, "compare").yields(null, true);

            // Act
            indexController.postComparePasswords(req, res);

            // Assert
            sinon.assert.calledWith(res.send, true);
        });

        it("PostDropAllTables should be passing accordingly", () => {
            // Arrange
            res = {
                send: sandbox.spy()
            }

            sandbox.stub(db, "deleteAndReset");
            expectedResult = true;

            // Act
            indexController.postDropAllTables(req, res);

            // Assert
            sinon.assert.calledWith(res.send, expectedResult);
        });
    })
});