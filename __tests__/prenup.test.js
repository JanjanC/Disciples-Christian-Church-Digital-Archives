const sinon = require('sinon');
const prenupController = require('../controllers/prenupController');
const db = require("../models/db");

describe('Prenup Controller', () => {

    let req = {};
    let res = {};
    let expectedResult;

    const sandbox = sinon.createSandbox();

    describe('Level three access', () => {
        beforeEach(() => {
            req = {
                session: {
                    level: 3
                },
                params: {
                    prenup_id: 12345
                }
            }
            res = {
                render: sandbox.spy(),
                send: sandbox.spy()
            };
        });

        afterEach(() => {
            sandbox.restore();
        });

        it('Should be able to access getViewPrenup', () => {
            //Arrange       
            sandbox.stub(db, "find").yields([{
                prenupId: 12345,
                weddingDate: '2021-12-31T00:00:00.000Z',
                date: '2021-12-25T00:00:00.000Z',
                coupleId: 56789,
                brideFirst: 'Rose',
                brideMid: 'M',
                brideLast: 'Maiden',
                groomFirst: 'Lily',
                groomMid: 'Y',
                groomLast: 'Maria',
                groomMemberId: 123,
                brideMemberId: 456
            }]);

            expectedResult = {
                prenupId: 12345,
                weddingDate: '2021-12-31T00:00:00.000Z',
                date: '2021-12-25T00:00:00.000Z',
                coupleId: 56789,
                brideFirst: 'Rose',
                brideMid: 'M',
                brideLast: 'Maiden',
                groomFirst: 'Lily',
                groomMid: 'Y',
                groomLast: 'Maria',
                groomMemberId: 123,
                brideMemberId: 456,
                canSee: true,
                styles: ['view'],
                scripts: ['deletePrenup'],
                backLink: '/prenup_main_page'
            };

            //Act
            prenupController.getViewPrenup(req, res);

            //Assert
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ prenupId: expectedResult.prenupId }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ weddingDate: expectedResult.weddingDate }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ date: expectedResult.date }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ coupleId: expectedResult.coupleId }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ brideFirst: expectedResult.brideFirst }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ brideMid: expectedResult.brideMid }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ brideLast: expectedResult.brideLast }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ groomFirst: expectedResult.groomFirst }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ groomMid: expectedResult.groomMid }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ groomLast: expectedResult.groomLast }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ groomMemberId: expectedResult.groomMemberId }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ brideMemberId: expectedResult.brideMemberId }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ canSee: expectedResult.canSee }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ styles: expectedResult.styles }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ scripts: expectedResult.scripts }));
            sinon.assert.calledWith(res.render, 'view-prenup', sinon.match({ backLink: expectedResult.backLink }));
        });

        it('Should be able to access putUpdatePrenupDate', () => {
            //Arrange       
            req = {
                body: {
                    newWeddingDate: '2021-11-25T00:00:00.000Z',
                    prenupId: 12345
                }
            }

            sandbox.stub(db, "update").yields([{
                date_of_wedding: '2021-11-25T00:00:00.000Z',
            }]);

            expectedResult = true;

            //Act
            prenupController.putUpdatePrenupDate(req, res);

            //Assert
            sinon.assert.calledWith(res.send, expectedResult);
        });

        it('Should be able to access putUpdatePrenupBride where the update was successful', () => {
            //Arrange
            req = {
                body: {
                    isOldMember: null,
                    person: '{"firstName": "John", "midName": "K", "lastName": "Doe", "personId": 12345, "isMember": false}',
                    isNewMember: null,
                    prenupRecId: 123,
                    coupleId: 456,
                    oldPersonId: 12345
                }
            }

            sandbox.stub(db, "update").yields(req.body.oldPersonId);
            expectedResult = req.body.oldPersonId;

            //Act
            prenupController.putUpdatePrenupBride(req, res);

            //Assert
            sinon.assert.calledWith(res.send, JSON.stringify(expectedResult));
        });

        it('Should be able to access putUpdatePrenupBride where the update was unsuccessful', () => {
            //Arrange
            req = {
                body: {
                    isOldMember: null,
                    person: '{"firstName": "John", "midName": "K", "lastName": "Doe", "personId": 12345, "isMember": false}',
                    isNewMember: null,
                    prenupRecId: 123,
                    coupleId: 456,
                    oldPersonId: 12345
                }
            }

            sandbox.stub(db, "update").yields(null);
            expectedResult = false;

            //Act
            prenupController.putUpdatePrenupBride(req, res);

            //Assert
            sinon.assert.calledWith(res.send, expectedResult);
        });

        it('Should be able to access putUpdatePrenupGroom where the update was successful', () => {
            //Arrange
            req = {
                body: {
                    isOldMember: null,
                    person: '{"firstName": "Jane", "midName": "K", "lastName": "Doe", "personId": 12345, "isMember": false}',
                    isNewMember: null,
                    prenupRecId: 123,
                    coupleId: 456,
                    oldPersonId: 12345
                }
            }

            sandbox.stub(db, "update").yields(req.body.oldPersonId);
            expectedResult = req.body.oldPersonId;

            //Act
            prenupController.putUpdatePrenupGroom(req, res);

            //Assert
            sinon.assert.calledWith(res.send, JSON.stringify(expectedResult));
        });

        it('Should be able to access putUpdatePrenupGroom where the update was unsuccessful', () => {
            //Arrange
            req = {
                body: {
                    isOldMember: null,
                    person: '{"firstName": "Jane", "midName": "K", "lastName": "Doe", "personId": 12345, "isMember": false}',
                    isNewMember: null,
                    prenupRecId: 123,
                    coupleId: 456,
                    oldPersonId: 12345
                }
            }

            sandbox.stub(db, "update").yields(null);
            expectedResult = false;

            //Act
            prenupController.putUpdatePrenupGroom(req, res);

            //Assert
            sinon.assert.calledWith(res.send, expectedResult);
        });
    });
});