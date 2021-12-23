const db = require("../models/db");
const baptismFields = require("../models/baptismalRegistry");
const dedicationFields = require("../models/infantDedication");
const prenupFields = require("../models/prenupRecord");
const weddingFields = require("../models/weddingRegistry");
const { Condition, queryTypes } = require("../models/condition");
const { sendError } = require("./errorController");
const infDedFields = require("../models/infantDedication");

const attendanceController = {
    /**
     * This function renders the attendance record main page
     * @param req - the incoming request containing either the query or body
     * @param res - the result to be sent out after processing the request
     */
    getCountPerEventData: function (req, res) {
        const startDate = new Date(req.body.startDate).toISOString();
        const endDate = new Date(req.body.endDate).toISOString();
        const data = {};

        const withinDateRange = new Condition(queryTypes.whereBetween);
        withinDateRange.setArray(db.tables.BAPTISMAL_TABLE + "." + baptismFields.DATE_CREATED, [startDate, endDate]);

        db.find(db.tables.BAPTISMAL_TABLE, [withinDateRange], [], "*", function (result) {
            data.baptisms = result.length;
            withinDateRange.setArray(db.tables.INFANT_TABLE + "." + dedicationFields.DATE_CREATED, [startDate, endDate]);

            db.find(db.tables.INFANT_TABLE, [withinDateRange], [], "*", function (result) {
                data.dedications = result.length;
                withinDateRange.setArray(db.tables.PRENUPTIAL_TABLE + "." + prenupFields.DATE_CREATED, [startDate, endDate]);

                db.find(db.tables.PRENUPTIAL_TABLE, [withinDateRange], [], "*", function (result) {
                    data.prenups = result.length;
                    withinDateRange.setArray(db.tables.WEDDING_TABLE + "." + weddingFields.DATE_CREATED, [startDate, endDate]);
                    
                    db.find(db.tables.WEDDING_TABLE, [withinDateRange], [], "*", function (result) {
                        data.weddingFields = result.length;
                        res.send(data);
                    });
                });
            });
        });
    },
    /**
     * This function gets all attendance details and renders the add attendance page
     * @param req - the incoming request containing either the query or body
     * @param res - the result to be sent out after processing the request
     */
    getAttendanceData: function (req, res) {
        console.log("REACHED THIS");
        const date = new Date(req.body.date).toISOString();
        console.log(`THIS IS THE DATE ${date}`);
        const condition = new Condition(queryTypes.where);
        condition.setKeyValue(db.tables.ATTENDANCE_TABLE + "." + attendanceFields.DATE, date);

        // find the the person ids of each attendance record that was removed in the update
        db.find(db.tables.ATTENDANCE_TABLE, condition, [], "*", function (result) {
            console.log(`Value of result is ${result}`);
            if (result == 0) res.send(true);
            else res.send(false);
        });
    },
    deleteAttendance: function (req, res) {
        const date = req.body.date;

        const condition = new Condition(queryTypes.where);
        condition.setKeyValue(db.tables.ATTENDANCE_TABLE + "." + attendanceFields.DATE, date);

        // find the the person ids of each attendance record that was removed in the update
        db.delete(db.tables.ATTENDANCE_TABLE, condition, function (result) {
            if (result) res.send(true);
            else res.send(false);
        });
    },
};

module.exports = attendanceController;
