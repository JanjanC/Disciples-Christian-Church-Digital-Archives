const sinon = require("sinon");
const db = require("../models/db.js");
const attendanceReportController = require("../controllers/attendanceReportController");

describe("Get attendance records given a date range", () => {
    let req = {};
    let res = {};
    
    const sandbox = sinon.createSandbox();

    beforeEach(() => {
        res = {
            send: sandbox.spy(),
        };

        req.body = {
            startDate: "2021-11-11",
            endDate: "2021-12-11"
        };
    });

    afterEach(() => {
        sandbox.restore();
    });

    it("Should return the correct bins if it finds attendance records within the given date", () => {
        // Arrange
        const expectedResult = {
            "January": 1,
            "February": 0,
            "March": 1,
            "April": 2,
            "May": 0,
            "June": 0,
            "July": 0,
            "August": 0,
            "September": 0,
            "October": 0,
            "November": 0,
            "December": 1
        };
        sandbox.stub(db, "find").yields([
            {date: '2021-03-01T00:00:00.000Z'},
            {date: '2021-01-22T00:00:00.000Z'},
            {date: '2021-04-15T00:00:00.000Z'},
            {date: '2021-12-10T00:00:00.000Z'},
            {date: '2021-04-21T00:00:00.000Z'}
        ]);

        // Act
        attendanceReportController.getCountAttendance(req, res);

        // Assert
        sinon.assert.calledWith(res.send, sinon.match({January: expectedResult.January}));
        sinon.assert.calledWith(res.send, sinon.match({February: expectedResult.February}));
        sinon.assert.calledWith(res.send, sinon.match({March: expectedResult.March}));
        sinon.assert.calledWith(res.send, sinon.match({April: expectedResult.April}));
        sinon.assert.calledWith(res.send, sinon.match({May: expectedResult.May}));
        sinon.assert.calledWith(res.send, sinon.match({June: expectedResult.June}));
        sinon.assert.calledWith(res.send, sinon.match({July: expectedResult.July}));
        sinon.assert.calledWith(res.send, sinon.match({August: expectedResult.August}));
        sinon.assert.calledWith(res.send, sinon.match({September: expectedResult.September}));
        sinon.assert.calledWith(res.send, sinon.match({October: expectedResult.October}));
        sinon.assert.calledWith(res.send, sinon.match({November: expectedResult.November}));
        sinon.assert.calledWith(res.send, sinon.match({December: expectedResult.December}));
    });

    it("Should return an error if it cannot find any attendance records within the given date", () => {
        // Arrange
        const expectedResult = {error: true};
        sandbox.stub(db, "find").yields([]);

        // Act
        attendanceReportController.getCountAttendance(req, res);

        // Assert
        sinon.assert.calledWith(res.send, sinon.match({error: expectedResult.error}));
    });

    it("Should return an error if it cannot find any attendance records within the given date", () => {
        // Arrange
        req.body = {
            startDate: "2010-11-11",
            endDate: "2040-12-11"
        };
        const expectedResult = {error: true};
        sandbox.stub(db, "find").yields([
            {date: '2021-03-01T00:00:00.000Z'},
            {date: '2021-01-22T00:00:00.000Z'},
            {date: '2021-04-15T00:00:00.000Z'},
            {date: '2021-12-10T00:00:00.000Z'},
            {date: '2021-04-21T00:00:00.000Z'}
        ]);

        // Act
        attendanceReportController.getCountAttendance(req, res);

        // Assert
        sinon.assert.calledWith(res.send, sinon.match({error: expectedResult.error}));
    });
});