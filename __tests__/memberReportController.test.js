const sinon = require("sinon");
const memberReportController = require("../controllers/membersReportController");
const db = require("../models/db.js");

describe("Member Report Controller", () => {
    let req = {};
    let res = {};

    const sandbox = sinon.createSandbox();
    beforeEach(() => {
        req = {
            body: {
                startDate: "2021-11-11",
                endDate: "2021-12-11"
            }
        };

        res = {
            send: sandbox.spy(),
        };
    });

    afterEach(() => {
        sandbox.restore();
    });

    it("Should be able to successfully yield getCountPerMemberStatus", () => {
        //Arrange
        sandbox.stub(db, "find").yields([
            {
                member_id: 1000001,
                address_id: 2000001,
                bap_reg_id: null,
                wedding_reg_id: null,
                prenup_record_id: null,
                person_id: 12000001,
                child_dedication_id: null,
                member_status: "Active",
                member_type: "Regular Member (Resident)",
                civil_status: "Single",
                birthday: "2000-01-01",
                occupation: "",
                workplace: "",
                email: "johndoe@email.com",
                telephone: "",
                mobile: "09123456789",
                educ_attainment: "",
                alma_mater: "",
                skills: "",
                date_created: "2021-11-28T00:00:00.000Z",
                sex: "Male",
                family_members: "",
                parents_id: null,
                first_name: "John",
                middle_name: "J",
                last_name: "Doe",
            },
            {
                member_id: 1000002,
                address_id: 2000002,
                bap_reg_id: null,
                wedding_reg_id: null,
                prenup_record_id: null,
                person_id: 12000002,
                child_dedication_id: null,
                member_status: "Inactive",
                member_type: "Regular Member (Resident)",
                civil_status: "Single",
                birthday: "2000-01-01",
                occupation: "",
                workplace: "",
                email: "johndoe@email.com",
                telephone: "",
                mobile: "09123456789",
                educ_attainment: "",
                alma_mater: "",
                skills: "",
                date_created: "2021-11-28T00:00:00.000Z",
                sex: "Male",
                family_members: "",
                parents_id: null,
                first_name: "Jane",
                middle_name: "J",
                last_name: "Doe",
            },
            {
                member_id: 1000005,
                address_id: 2000005,
                bap_reg_id: null,
                wedding_reg_id: null,
                prenup_record_id: null,
                person_id: 12000005,
                child_dedication_id: null,
                member_status: "Inactive",
                member_type: "Regular Member (Resident)",
                civil_status: "Single",
                birthday: "2000-01-01",
                occupation: "",
                workplace: "",
                email: "johndoe@email.com",
                telephone: "",
                mobile: "09123456789",
                educ_attainment: "",
                alma_mater: "",
                skills: "",
                date_created: "2021-11-28T00:00:00.000Z",
                sex: "Male",
                family_members: "",
                parents_id: null,
                first_name: "Jeanne",
                middle_name: "J",
                last_name: "Doe",
            },
            {
                member_id: 1000003,
                address_id: 2000003,
                bap_reg_id: null,
                wedding_reg_id: null,
                prenup_record_id: null,
                person_id: 12000003,
                child_dedication_id: null,
                member_status: "Deceased",
                member_type: "Regular Member (Resident)",
                civil_status: "Single",
                birthday: "2000-01-01",
                occupation: "",
                workplace: "",
                email: "johndoe@email.com",
                telephone: "",
                mobile: "09123456789",
                educ_attainment: "",
                alma_mater: "",
                skills: "",
                date_created: "2021-11-28T00:00:00.000Z",
                sex: "Male",
                family_members: "",
                parents_id: null,
                first_name: "Jonnathan",
                middle_name: "J",
                last_name: "Doe",
            },
        ]);

        const expectedResult = {
            'Active': 1,
            'Inactive': 2,
            'Deceased': 1
        };

        //Act
        memberReportController.getCountPerMemberStatus(req, res);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });

    it("Should be able to successfully yield getCountPerMemberStatus", () => {
        //Arrange
        sandbox.stub(db, "find").yields([
            {
                member_id: 1000001,
                address_id: 2000001,
                bap_reg_id: null,
                wedding_reg_id: null,
                prenup_record_id: null,
                person_id: 12000001,
                child_dedication_id: null,
                member_status: "Active",
                member_type: "Regular Member (Resident)",
                civil_status: "Single",
                birthday: "2000-01-01",
                occupation: "",
                workplace: "",
                email: "johndoe@email.com",
                telephone: "",
                mobile: "09123456789",
                educ_attainment: "",
                alma_mater: "",
                skills: "",
                date_created: "2021-11-28T00:00:00.000Z",
                sex: "Male",
                family_members: "",
                parents_id: null,
                first_name: "John",
                middle_name: "J",
                last_name: "Doe",
            },
            {
                member_id: 1000002,
                address_id: 2000002,
                bap_reg_id: null,
                wedding_reg_id: null,
                prenup_record_id: null,
                person_id: 12000002,
                child_dedication_id: null,
                member_status: "Inactive",
                member_type: "Regular Member (Non Resident)",
                civil_status: "Single",
                birthday: "2000-01-01",
                occupation: "",
                workplace: "",
                email: "johndoe@email.com",
                telephone: "",
                mobile: "09123456789",
                educ_attainment: "",
                alma_mater: "",
                skills: "",
                date_created: "2021-11-28T00:00:00.000Z",
                sex: "Male",
                family_members: "",
                parents_id: null,
                first_name: "Jane",
                middle_name: "J",
                last_name: "Doe",
            },
            {
                member_id: 1000005,
                address_id: 2000005,
                bap_reg_id: null,
                wedding_reg_id: null,
                prenup_record_id: null,
                person_id: 12000005,
                child_dedication_id: null,
                member_status: "Inactive",
                member_type: "Affiliate Member",
                civil_status: "Single",
                birthday: "2000-01-01",
                occupation: "",
                workplace: "",
                email: "johndoe@email.com",
                telephone: "",
                mobile: "09123456789",
                educ_attainment: "",
                alma_mater: "",
                skills: "",
                date_created: "2021-11-28T00:00:00.000Z",
                sex: "Male",
                family_members: "",
                parents_id: null,
                first_name: "Jeanne",
                middle_name: "J",
                last_name: "Doe",
            },
            {
                member_id: 1000003,
                address_id: 2000003,
                bap_reg_id: null,
                wedding_reg_id: null,
                prenup_record_id: null,
                person_id: 12000003,
                child_dedication_id: null,
                member_status: "Deceased",
                member_type: "Affiliate Member",
                civil_status: "Single",
                birthday: "2000-01-01",
                occupation: "",
                workplace: "",
                email: "johndoe@email.com",
                telephone: "",
                mobile: "09123456789",
                educ_attainment: "",
                alma_mater: "",
                skills: "",
                date_created: "2021-11-28T00:00:00.000Z",
                sex: "Male",
                family_members: "",
                parents_id: null,
                first_name: "Jonnathan",
                middle_name: "J",
                last_name: "Doe",
            },
        ]);

        const expectedResult = {
            'Regular Member (Resident)': 1,
            'Regular Member (Non Resident)': 1,
            'Associate Member': 0,
            'Affiliate Member': 2,
            'Preparatory Member': 0,
            'Honorary Member': 0
        };

        //Act
        memberReportController.getCountPerMemberType(req, res);

        //Assert
        sinon.assert.calledWith(res.send, expectedResult);
    });
});
