const db = require("../models/db");
const attendanceFields = require("../models/attendanceRecord");
const { Condition, queryTypes } = require("../models/condition");
const binningFunction = require("../helpers/binAttendance");

const attendanceReportController = {
    /**
     * This function renders the attendance record main page
     * @param req - the incoming request containing either the query or body
     * @param res - the result to be sent out after processing the request
     */
    getCountAttendance: function (req, res) {
        const startDate = new Date(req.body.startDate).toISOString();
        const endDate = new Date(req.body.endDate).toISOString();
        var data = {};

        if (parseInt(endDate.substring(0,4)) - parseInt(startDate.substring(0,4)) > 20) {
            res.send({
                error: true,
                message: "Invalid dates provided."
            });
            return;
        }

        const withinDateRange = new Condition(queryTypes.whereBetween);
        withinDateRange.setRange(db.tables.ATTENDANCE_TABLE + "." + attendanceFields.DATE, startDate, endDate);

        db.find(db.tables.ATTENDANCE_TABLE, [withinDateRange], [], "date", function (result) {
            if (result == null || result == undefined || result == []) {
                res.send(data);
            }
            else {
                result.forEach(attendance => {
                    date = new Date(attendance.date).toISOString().split('T')[0];
                    if (typeof(data[date]) == "number")
                        data[date]++
                    else
                        data[date] = 1
                });
                
                var orderedData = Object.keys(data).sort().reduce((obj, key) => {
                    obj[key] = data[key];
                    return obj;
                }, {});

                var bins = binningFunction(orderedData);
                
                res.send(bins);
            }
        });
    }
};

module.exports = attendanceReportController;
