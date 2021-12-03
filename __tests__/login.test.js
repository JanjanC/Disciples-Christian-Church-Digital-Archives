const sinon = require('sinon');
const request = require('supertest');
const app = require('../app');
const LoginController = require('../controllers/loginController');

describe ('Login Controller', () => {

    let req = {}
    let res = {}
        
    const sandbox = sinon.createSandbox();

    beforeEach (() => {
        res = {
            render: sandbox.spy(),
            redirect: sandbox.spy()
        };
    });

    afterEach(() => {
        sandbox.restore();
    });

    it('Should be able to access getLoginPage', () => {
        //Arrange
        req = {
            session: {
                editMemberId: null
            }
        }

        expectedResult =  {
            styles: ['login'],
            scripts: ['login']
        }

        //Act
        LoginController.getLoginPage(req, res);

        //Assert
        sinon.assert.calledWith(res.render, 'login', sinon.match({styles: expectedResult.styles}));
        sinon.assert.calledWith(res.render, 'login', sinon.match({scripts: expectedResult.scripts}));  
    });

    /*
    it('Should be able to access getLogout', () => {
        //Arrange
        expectedResult =  '/';

        //Act
        LoginController.getLogout(req, res);

        //Assert
        sinon.assert.calledWith(res.redirect, '/');        
    });
    */
});