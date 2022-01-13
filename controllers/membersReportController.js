const db = require("../models/db");
const memberFields = require("../models/members");
const { Condition, queryTypes } = require("../models/condition");

const membersReportController = {
    /**
     * This function renders the attendance record main page
     * @param req - the incoming request containing either the query or body
     * @param res - the result to be sent out after processing the request
     */
    getCountPerMemberStatus: function (req, res) {
        const startDate = new Date(req.body.startDate).toISOString();
        const endDate = new Date(req.body.endDate).toISOString();
        var data = {
            Active: 0,
            Inactive: 0,
            Deceased: 0
        };

        if (parseInt(endDate.substring(0,4)) - parseInt(startDate.substring(0,4)) > 20) {
            res.send('ERROR');
            return;
        }

        const withinDateRange = new Condition(queryTypes.whereBetween);
        withinDateRange.setRange(db.tables.MEMBER_TABLE + "." + memberFields.DATE, startDate, endDate);

        db.find(db.tables.MEMBER_TABLE, [withinDateRange], [], "member_status", function (result) {
            if (result == null || result == undefined || result == []) {
                res.send(data);
            }
            else {
                result.forEach(member => {
                    data[member.member_status]++
                });
                res.send(data);
            }
        });
    },
    getCountPerMemberType: function (req, res) {
        const startDate = new Date(req.body.startDate).toISOString();
        const endDate = new Date(req.body.endDate).toISOString();
        var data = {
            'Regular Member (Resident)': 0,
            'Regular Member (Non Resident)': 0,
            'Associate Member': 0,
            'Affiliate Member': 0,
            'Preparatory Member': 0,
            'Honorary Member': 0
        };

        if (parseInt(endDate.substring(0,4)) - parseInt(startDate.substring(0,4)) > 20) {
            res.send('ERROR');
            return;
        }

        const withinDateRange = new Condition(queryTypes.whereBetween);
        withinDateRange.setRange(db.tables.MEMBER_TABLE + "." + memberFields.DATE, startDate, endDate);

        db.find(db.tables.MEMBER_TABLE, [withinDateRange], [], "member_type", function (result) {
            if (result == null || result == undefined || result == []) {
                res.send(data);
            }
            else {
                result.forEach(member => {
                    data[member.member_type]++
                });
                res.send(data);
            }
        });
    }
};

module.exports = membersReportController;
