const db = require("../models/db.js");
const { promisify } = require("util");
const personFields = require("../models/person");
const coupleFields = require("../models/couple");
const weddingRegFields = require("../models/weddingRegistry");
const witnessFields = require("../models/witness");
const memberFields = require("../models/members");
const { Condition, queryTypes } = require("../models/condition");
const { sendError } = require("../controllers/errorController");
const { tables } = require("../models/db.js");
const {
    updateMemberToMember,
    updateMemberToNonMember,
    updateNonMemberToMember,
    updateNonMemberToNonMember,
    updateNoneToMember,
    updateNoneToNonMember,
    updateMemberToNone,
    updateNonMemberToNone,
} = require("./updateController.js");

const weddingController = {
    /**
     * This function renders the add wedding page
     * @param req - the incoming request containing either the query or body
     * @param res - the result to be sent out after processing the request
     */
    getAddWeddingPage: function (req, res) {
        if (req.session.level === null || req.session.level === undefined || req.session.level === 0) {
            res.render("error", {
                title: "401 Unauthorized Access",
                css: ["global", "error"],
                backLink: "/forms_main_page",
                status: {
                    code: "401",
                    message: "Unauthorized access",
                },
            });
        } else {
            const joinTables = [
                {
                    tableName: db.tables.PERSON_TABLE,
                    sourceCol: db.tables.MEMBER_TABLE + "." + memberFields.PERSON,
                    destCol: db.tables.PERSON_TABLE + "." + personFields.ID,
                },
            ];
            db.find(db.tables.MEMBER_TABLE, [], joinTables, "*", function (result) {
                if (result) {
                    const data = {};
                    data.members = result;
                    data.styles = ["forms"];
                    data.scripts = ["addWedding"];
                    data.backLink = parseInt(req.session.level) >= 2 ? "/wedding_main_page" : "/forms_main_page";
                    data.males = data.members.filter((element) => {
                        return element[memberFields.SEX] === "Male";
                    });
                    data.females = data.members.filter((element) => {
                        return element[memberFields.SEX] === "Female";
                    });
                    data.singleMales = data.males.filter((element) => {
                        return element[memberFields.WEDDING_REG] === null;
                    });
                    data.singleFemales = data.females.filter((element) => {
                        return element[memberFields.WEDDING_REG] === null;
                    });
                    res.render("add-wedding-registry", data);
                }
            });
        }
    },
    /**
     * This function renders the view of a specific wedding record
     * @param req - the incoming request containing either the query or body
     * @param res - the result to be sent out after processing the request
     */
    getViewWeddingPage: function (req, res) {
        // function execution starts here
        const weddingId = parseInt(req.params.wedding_id);
        if (parseInt(req.session.level) >= 2 || parseInt(req.session.editId) === weddingId) {
            /*
        FROM wedding_reg
        JOIN couples ON couples.couple_id = wedding_reg.couple_id
        JOIN people ON people.person_id = couples.
      */
            const joinTables = [
                // joins wedding_reg.couple_id = couples.couple_id
                {
                    tableName: db.tables.COUPLE_TABLE,
                    sourceCol: db.tables.WEDDING_TABLE + "." + weddingRegFields.COUPLE,
                    destCol: db.tables.COUPLE_TABLE + "." + coupleFields.ID,
                },
                // joins bride's person record
                {
                    tableName: { bride: db.tables.PERSON_TABLE },
                    sourceCol: db.tables.COUPLE_TABLE + "." + coupleFields.FEMALE,
                    destCol: "bride." + personFields.ID,
                },
                // joins groom's person record
                {
                    tableName: { groom: db.tables.PERSON_TABLE },
                    sourceCol: db.tables.COUPLE_TABLE + "." + coupleFields.MALE,
                    destCol: "groom." + personFields.ID,
                },
                // left join that catches if bride has a member record
                {
                    type: "leftJoin",
                    tableName: { bride_member: db.tables.MEMBER_TABLE },
                    sourceCol: "bride." + personFields.MEMBER,
                    destCol: "bride_member." + memberFields.ID,
                },
                // left join that catches if groom has a member record
                {
                    type: "leftJoin",
                    tableName: { groom_member: db.tables.MEMBER_TABLE },
                    sourceCol: "groom." + personFields.MEMBER,
                    destCol: "groom_member." + memberFields.ID,
                },
                // join bride parents
                {
                    type: "leftJoin",
                    tableName: { bride_parents: db.tables.COUPLE_TABLE },
                    sourceCol: db.tables.WEDDING_TABLE + "." + weddingRegFields.BRIDE_PARENTS,
                    destCol: "bride_parents." + coupleFields.ID,
                },
                // join groom parents
                {
                    type: "leftJoin",
                    tableName: { groom_parents: db.tables.COUPLE_TABLE },
                    sourceCol: db.tables.WEDDING_TABLE + "." + weddingRegFields.GROOM_PARENTS,
                    destCol: "groom_parents." + coupleFields.ID,
                },
                // bride_parents (mother)
                {
                    type: "leftJoin",
                    tableName: { bride_mother: db.tables.PERSON_TABLE },
                    sourceCol: "bride_parents." + coupleFields.FEMALE,
                    destCol: "bride_mother." + personFields.ID,
                },
                // bride_parents (father)
                {
                    type: "leftJoin",
                    tableName: { bride_father: db.tables.PERSON_TABLE },
                    sourceCol: "bride_parents." + coupleFields.MALE,
                    destCol: "bride_father." + personFields.ID,
                },
                // left join that catches if the bride's mother is a member
                {
                    type: "leftJoin",
                    tableName: { bride_mother_member: db.tables.MEMBER_TABLE },
                    sourceCol: "bride_mother." + personFields.MEMBER,
                    destCol: "bride_mother_member." + memberFields.ID,
                },
                // left join that catches if the bride's father is a member
                {
                    type: "leftJoin",
                    tableName: { bride_father_member: db.tables.MEMBER_TABLE },
                    sourceCol: "bride_father." + personFields.MEMBER,
                    destCol: "bride_father_member." + memberFields.ID,
                },
                // groom_parents (mother)
                {
                    type: "leftJoin",
                    tableName: { groom_mother: db.tables.PERSON_TABLE },
                    sourceCol: "groom_parents." + coupleFields.FEMALE,
                    destCol: "groom_mother." + personFields.ID,
                },
                // groom_parents (father)
                {
                    type: "leftJoin",
                    tableName: { groom_father: db.tables.PERSON_TABLE },
                    sourceCol: "groom_parents." + coupleFields.MALE,
                    destCol: "groom_father." + personFields.ID,
                },
                // left join that catches if the groom's mother is a member
                {
                    type: "leftJoin",
                    tableName: { groom_mother_member: db.tables.MEMBER_TABLE },
                    sourceCol: "groom_mother." + personFields.MEMBER,
                    destCol: "groom_mother_member." + memberFields.ID,
                },
                // left join that catches if the bride's father is a member
                {
                    type: "leftJoin",
                    tableName: { groom_father_member: db.tables.MEMBER_TABLE },
                    sourceCol: "groom_father." + personFields.MEMBER,
                    destCol: "groom_father_member." + memberFields.ID,
                },
            ];
            // columns to be retrieved
            const columns = [
                db.tables.WEDDING_TABLE + "." + weddingRegFields.ID + " as wedding_id",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.COUPLE + " as couple_id",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.DATE + " as date",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.DATE_OF_WEDDING + " as wedding_date",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.BRIDE_PARENTS + " as bride_parents_id",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.GROOM_PARENTS + " as groom_parents_id",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.LOCATION + " as location",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.SOLEMNIZER + " as solemnizer",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.WEDDING_OFFICIANT + " as officiant",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.CONTRACT + " as contract_no",
                // bride's name
                "bride." + personFields.FIRST_NAME + " as bride_first_name",
                "bride." + personFields.MID_NAME + " as bride_mid_name",
                "bride." + personFields.LAST_NAME + " as bride_last_name",
                "bride." + personFields.MEMBER + " as bride_member_id",
                "bride." + personFields.ID + " as bride_person_id",
                // groom's name
                "groom." + personFields.FIRST_NAME + " as groom_first_name",
                "groom." + personFields.MID_NAME + " as groom_mid_name",
                "groom." + personFields.LAST_NAME + " as groom_last_name",
                "groom." + personFields.MEMBER + " as groom_member_id",
                "groom." + personFields.ID + " as groom_person_id",
                // name of the bride's mother
                "bride_mother." + personFields.FIRST_NAME + " as bride_mother_first_name",
                "bride_mother." + personFields.MID_NAME + " as bride_mother_mid_name",
                "bride_mother." + personFields.LAST_NAME + " as bride_mother_last_name",
                "bride_mother." + personFields.MEMBER + " as bride_mother_member_id",
                "bride_mother." + personFields.ID + " as bride_mother_person_id",
                // name of the bride's father
                "bride_father." + personFields.FIRST_NAME + " as bride_father_first_name",
                "bride_father." + personFields.MID_NAME + " as bride_father_mid_name",
                "bride_father." + personFields.LAST_NAME + " as bride_father_last_name",
                "bride_father." + personFields.MEMBER + " as bride_father_member_id",
                "bride_father." + personFields.ID + " as bride_father_person_id",
                // name of the groom's mother
                "groom_mother." + personFields.FIRST_NAME + " as groom_mother_first_name",
                "groom_mother." + personFields.MID_NAME + " as groom_mother_mid_name",
                "groom_mother." + personFields.LAST_NAME + " as groom_mother_last_name",
                "groom_mother." + personFields.MEMBER + " as groom_mother_member_id",
                "groom_mother." + personFields.ID + " as groom_mother_person_id",
                // name of the groom's father
                "groom_father." + personFields.FIRST_NAME + " as groom_father_first_name",
                "groom_father." + personFields.MID_NAME + " as groom_father_mid_name",
                "groom_father." + personFields.LAST_NAME + " as groom_father_last_name",
                "groom_father." + personFields.MEMBER + " as groom_father_member_id",
                "groom_father." + personFields.ID + " as groom_father_person_id",
            ];
            // set the WHERE condition: wedding_id = <weddingId>
            const cond = new Condition(queryTypes.where);
            cond.setKeyValue(db.tables.WEDDING_TABLE + "." + weddingRegFields.ID, weddingId);

            const witnessJoin = [
                {
                    tableName: db.tables.PERSON_TABLE,
                    sourceCol: db.tables.WITNESS_TABLE + "." + witnessFields.PERSON,
                    destCol: db.tables.PERSON_TABLE + "." + personFields.ID,
                },
            ];
            const witnessColumns = [
                db.tables.WITNESS_TABLE + "." + witnessFields.DEDICATION + " as dedication_id",
                db.tables.WITNESS_TABLE + "." + witnessFields.PERSON + " as witness_person_id",
                db.tables.WITNESS_TABLE + "." + witnessFields.ID + " as witness_id",
                db.tables.PERSON_TABLE + "." + personFields.MEMBER + " as witness_member_id",
                db.tables.PERSON_TABLE + "." + personFields.FIRST_NAME + " as witness_first_name",
                db.tables.PERSON_TABLE + "." + personFields.MID_NAME + " as witness_mid_name",
                db.tables.PERSON_TABLE + "." + personFields.LAST_NAME + " as witness_last_name",
                db.tables.WITNESS_TABLE + "." + witnessFields.TYPE + " as type",
            ];

            // set the WHERE condition: wedding_id = <weddingId>
            const witnessCond = new Condition(queryTypes.where);
            witnessCond.setKeyValue(db.tables.WITNESS_TABLE + "." + witnessFields.WEDDING, weddingId);

            // find them
            db.find(db.tables.WEDDING_TABLE, cond, joinTables, columns, function (result) {
                // store to data
                if (result !== null && result.length > 0) {
                    const data = {
                        ...result[0],
                    };
                    data.canSee =
                        parseInt(req.session.weddingId) === parseInt(weddingId) || parseInt(req.session.level) >= 2;
                    if (parseInt(req.session.level) <= 2) {
                        data.canSee = false;
                    }
                    data.scripts = ["deleteWedding"];
                    data.styles = ["view"];
                    // data.scripts = ['']
                    data.backLink = parseInt(req.session.level) >= 2 ? "/wedding_main_page" : "/forms_main_page";
                    data.canSee = parseInt(req.session.level) >= 2 || parseInt(req.session.editId) === weddingId;
                    db.find(db.tables.WITNESS_TABLE, witnessCond, witnessJoin, witnessColumns, function (result) {
                        if (result) {
                            data.witnesses = result;
                            // Filters all Godfathers
                            data.witnessMale = data.witnesses.filter((witness) => {
                                return witness.type === "Godfather";
                            });
                            // Filters all Godmothers
                            data.witnessFemale = data.witnesses.filter((witness) => {
                                return witness.type === "Godmother";
                            });
                            res.render("view-wedding", data);
                        }
                    });
                } else {
                    sendError(req, res, 404, "404 Wedding Record Not Found");
                }
            });
        } else {
            sendError(req, res, 401);
        }
    },

    getEditWedding: function (req, res) {
        const weddingId = parseInt(req.params.wedding_id);
        if (parseInt(req.session.level) === 3 || parseInt(req.session.editId) === weddingId) {
            /*
        FROM wedding_reg
        JOIN couples ON couples.couple_id = wedding_reg.couple_id
        JOIN people ON people.person_id = couples.
      */
            const joinTables = [
                // joins wedding_reg.couple_id = couples.couple_id
                {
                    tableName: db.tables.COUPLE_TABLE,
                    sourceCol: db.tables.WEDDING_TABLE + "." + weddingRegFields.COUPLE,
                    destCol: db.tables.COUPLE_TABLE + "." + coupleFields.ID,
                },
                // joins bride's person record
                {
                    tableName: { bride: db.tables.PERSON_TABLE },
                    sourceCol: db.tables.COUPLE_TABLE + "." + coupleFields.FEMALE,
                    destCol: "bride." + personFields.ID,
                },
                // joins groom's person record
                {
                    tableName: { groom: db.tables.PERSON_TABLE },
                    sourceCol: db.tables.COUPLE_TABLE + "." + coupleFields.MALE,
                    destCol: "groom." + personFields.ID,
                },
                // left join that catches if bride has a member record
                {
                    type: "leftJoin",
                    tableName: { bride_member: db.tables.MEMBER_TABLE },
                    sourceCol: "bride." + personFields.MEMBER,
                    destCol: "bride_member." + memberFields.ID,
                },
                // left join that catches if groom has a member record
                {
                    type: "leftJoin",
                    tableName: { groom_member: db.tables.MEMBER_TABLE },
                    sourceCol: "groom." + personFields.MEMBER,
                    destCol: "groom_member." + memberFields.ID,
                },
                // join bride parents
                {
                    type: "leftJoin",
                    tableName: { bride_parents: db.tables.COUPLE_TABLE },
                    sourceCol: db.tables.WEDDING_TABLE + "." + weddingRegFields.BRIDE_PARENTS,
                    destCol: "bride_parents." + coupleFields.ID,
                },
                // join groom parents
                {
                    type: "leftJoin",
                    tableName: { groom_parents: db.tables.COUPLE_TABLE },
                    sourceCol: db.tables.WEDDING_TABLE + "." + weddingRegFields.GROOM_PARENTS,
                    destCol: "groom_parents." + coupleFields.ID,
                },
                // bride_parents (mother)
                {
                    type: "leftJoin",
                    tableName: { bride_mother: db.tables.PERSON_TABLE },
                    sourceCol: "bride_parents." + coupleFields.FEMALE,
                    destCol: "bride_mother." + personFields.ID,
                },
                // bride_parents (father)
                {
                    type: "leftJoin",
                    tableName: { bride_father: db.tables.PERSON_TABLE },
                    sourceCol: "bride_parents." + coupleFields.MALE,
                    destCol: "bride_father." + personFields.ID,
                },
                // left join that catches if the bride's mother is a member
                {
                    type: "leftJoin",
                    tableName: { bride_mother_member: db.tables.MEMBER_TABLE },
                    sourceCol: "bride_mother." + personFields.MEMBER,
                    destCol: "bride_mother_member." + memberFields.ID,
                },
                // left join that catches if the bride's father is a member
                {
                    type: "leftJoin",
                    tableName: { bride_father_member: db.tables.MEMBER_TABLE },
                    sourceCol: "bride_father." + personFields.MEMBER,
                    destCol: "bride_father_member." + memberFields.ID,
                },
                // groom_parents (mother)
                {
                    type: "leftJoin",
                    tableName: { groom_mother: db.tables.PERSON_TABLE },
                    sourceCol: "groom_parents." + coupleFields.FEMALE,
                    destCol: "groom_mother." + personFields.ID,
                },
                // groom_parents (father)
                {
                    type: "leftJoin",
                    tableName: { groom_father: db.tables.PERSON_TABLE },
                    sourceCol: "groom_parents." + coupleFields.MALE,
                    destCol: "groom_father." + personFields.ID,
                },
                // left join that catches if the groom's mother is a member
                {
                    type: "leftJoin",
                    tableName: { groom_mother_member: db.tables.MEMBER_TABLE },
                    sourceCol: "groom_mother." + personFields.MEMBER,
                    destCol: "groom_mother_member." + memberFields.ID,
                },
                // left join that catches if the bride's father is a member
                {
                    type: "leftJoin",
                    tableName: { groom_father_member: db.tables.MEMBER_TABLE },
                    sourceCol: "groom_father." + personFields.MEMBER,
                    destCol: "groom_father_member." + memberFields.ID,
                },
            ];
            // columns to be retrieved
            const columns = [
                db.tables.WEDDING_TABLE + "." + weddingRegFields.ID + " as wedding_id",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.COUPLE + " as couple_id",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.DATE + " as date",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.DATE_OF_WEDDING + " as wedding_date",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.BRIDE_PARENTS + " as bride_parents_id",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.GROOM_PARENTS + " as groom_parents_id",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.LOCATION + " as location",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.SOLEMNIZER + " as solemnizer",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.WEDDING_OFFICIANT + " as officiant",
                db.tables.WEDDING_TABLE + "." + weddingRegFields.CONTRACT + " as contract_no",
                // bride's name
                "bride." + personFields.FIRST_NAME + " as bride_first_name",
                "bride." + personFields.MID_NAME + " as bride_mid_name",
                "bride." + personFields.LAST_NAME + " as bride_last_name",
                "bride." + personFields.MEMBER + " as bride_member_id",
                "bride." + personFields.ID + " as bride_person_id",
                // groom's name
                "groom." + personFields.FIRST_NAME + " as groom_first_name",
                "groom." + personFields.MID_NAME + " as groom_mid_name",
                "groom." + personFields.LAST_NAME + " as groom_last_name",
                "groom." + personFields.MEMBER + " as groom_member_id",
                "groom." + personFields.ID + " as groom_person_id",
                // name of the bride's mother
                "bride_mother." + personFields.FIRST_NAME + " as bride_mother_first_name",
                "bride_mother." + personFields.MID_NAME + " as bride_mother_mid_name",
                "bride_mother." + personFields.LAST_NAME + " as bride_mother_last_name",
                "bride_mother." + personFields.MEMBER + " as bride_mother_member_id",
                "bride_mother." + personFields.ID + " as bride_mother_person_id",
                // name of the bride's father
                "bride_father." + personFields.FIRST_NAME + " as bride_father_first_name",
                "bride_father." + personFields.MID_NAME + " as bride_father_mid_name",
                "bride_father." + personFields.LAST_NAME + " as bride_father_last_name",
                "bride_father." + personFields.MEMBER + " as bride_father_member_id",
                "bride_father." + personFields.ID + " as bride_father_person_id",
                // name of the groom's mother
                "groom_mother." + personFields.FIRST_NAME + " as groom_mother_first_name",
                "groom_mother." + personFields.MID_NAME + " as groom_mother_mid_name",
                "groom_mother." + personFields.LAST_NAME + " as groom_mother_last_name",
                "groom_mother." + personFields.MEMBER + " as groom_mother_member_id",
                "groom_mother." + personFields.ID + " as groom_mother_person_id",
                // name of the groom's father
                "groom_father." + personFields.FIRST_NAME + " as groom_father_first_name",
                "groom_father." + personFields.MID_NAME + " as groom_father_mid_name",
                "groom_father." + personFields.LAST_NAME + " as groom_father_last_name",
                "groom_father." + personFields.MEMBER + " as groom_father_member_id",
                "groom_father." + personFields.ID + " as groom_father_person_id",
            ];
            // set the WHERE condition: wedding_id = <weddingId>
            const cond = new Condition(queryTypes.where);
            cond.setKeyValue(db.tables.WEDDING_TABLE + "." + weddingRegFields.ID, weddingId);

            const witnessJoin = [
                {
                    tableName: db.tables.PERSON_TABLE,
                    sourceCol: db.tables.WITNESS_TABLE + "." + witnessFields.PERSON,
                    destCol: db.tables.PERSON_TABLE + "." + personFields.ID,
                },
            ];
            const witnessColumns = [
                db.tables.WITNESS_TABLE + "." + witnessFields.DEDICATION + " as dedication_id",
                db.tables.WITNESS_TABLE + "." + witnessFields.PERSON + " as witness_person_id",
                db.tables.WITNESS_TABLE + "." + witnessFields.ID + " as witness_id",
                db.tables.PERSON_TABLE + "." + personFields.MEMBER + " as witness_member_id",
                db.tables.PERSON_TABLE + "." + personFields.FIRST_NAME + " as witness_first_name",
                db.tables.PERSON_TABLE + "." + personFields.MID_NAME + " as witness_mid_name",
                db.tables.PERSON_TABLE + "." + personFields.LAST_NAME + " as witness_last_name",
                db.tables.WITNESS_TABLE + "." + witnessFields.TYPE + " as type",
            ];

            // set the WHERE condition: wedding_id = <weddingId>
            const witnessCond = new Condition(queryTypes.where);
            witnessCond.setKeyValue(db.tables.WITNESS_TABLE + "." + witnessFields.WEDDING, weddingId);

            // find them
            db.find(db.tables.WEDDING_TABLE, cond, joinTables, columns, function (result) {
                // store to data
                if (result !== null && result.length > 0) {
                    const data = {
                        ...result[0],
                    };
                    data.canSee =
                        parseInt(req.session.weddingId) === parseInt(weddingId) || parseInt(req.session.level) >= 2;
                    if (parseInt(req.session.level) <= 2) {
                        data.canSee = false;
                    }
                    data.styles = ["forms"];
                    data.scripts = ["editWedding", "edit"];
                    data.backLink = parseInt(req.session.level) >= 2 ? "/wedding_main_page" : "/forms_main_page";
                    db.find(db.tables.WITNESS_TABLE, witnessCond, witnessJoin, witnessColumns, function (result) {
                        if (result) {
                            data.witnesses = result;
                            // Filters all Godfathers
                            data.witnessMale = data.witnesses.filter((witness) => {
                                return witness.type === "Godfather";
                            });
                            // Filters all Godmothers
                            data.witnessFemale = data.witnesses.filter((witness) => {
                                return witness.type === "Godmother";
                            });
                            db.find(
                                db.tables.MEMBER_TABLE,
                                [],
                                {
                                    tableName: tables.PERSON_TABLE,
                                    sourceCol: tables.PERSON_TABLE + "." + personFields.ID,
                                    destCol: tables.MEMBER_TABLE + "." + memberFields.PERSON,
                                },
                                "*",
                                function (result) {
                                    if (result) {
                                        data.males = result.filter((elem) => elem[memberFields.SEX] === "Male");
                                        data.singleMales = data.males.filter(
                                            (elem) =>
                                                elem[memberFields.WEDDING_REG] === null ||
                                                elem[memberFields.ID] === data.groom_member_id
                                        );
                                        data.females = result.filter((elem) => elem[memberFields.SEX] === "Female");
                                        data.singleFemales = data.females.filter(
                                            (elem) =>
                                                elem[memberFields.WEDDING_REG] === null ||
                                                elem[memberFields.ID] === data.bride_member_id
                                        );
                                        res.render("edit-wedding", data);
                                    } else {
                                        sendError(req, res, 404, "404 Wedding Record Not Found");
                                    }
                                }
                            );
                        }
                    });
                } else {
                    sendError(req, res, 404, "404 Wedding Record Not Found");
                }
            });
        } else {
            sendError(req, res, 401);
        }
    },

    /**
     * This function inserts a new row in the wedding table
     * @param req - the incoming request containing either the query or body
     * @param res - the result to be sent out after processing the request
     */
    postAddWedding: async function (req, res) {
        try {
            // Parse the body fields into the data object.
            const weddingData = {};

            const bodyKeys = Object.keys(req.body);
            bodyKeys.forEach((key) => {
                if (
                    !(
                        key === "officiant" ||
                        key === "solemnizer" ||
                        key === "location" ||
                        key === "contract" ||
                        key === "weddingDate" ||
                        key === "date"
                    )
                ) {
                    weddingData[key] = JSON.parse(req.body[key]);
                } else {
                    weddingData[key] = req.body[key];
                }
                if (key === "weddingDate" || key === "date") weddingData[key] = new Date(req.body[key]);
            });

            // Remove after debugging
            // console.log(weddingData);

            // Pre-promisify wrappers
            const wrapDbFind = (table, conditions = null, join = null, projection = "*", callback, rawSelect = []) => {
                db.find(
                    table,
                    conditions,
                    join,
                    projection,
                    (result) => {
                        if (result === false) {
                            callback("[DBFind Wrapper] Error occurred for FIND.", null);
                        } else {
                            callback(null, result);
                        }
                    },
                    rawSelect
                );
            };
            const wrapDbInsert = (table, data, callback) => {
                db.insert(table, data, (result) => {
                    if (result === false) {
                        callback("[DBInsert Wrapper] Error occurred for INSERT.", null);
                    } else {
                        callback(null, result);
                    }
                });
            };
            const wrapDbUpdate = (table, data, conditions, callback) => {
                db.update(table, data, conditions, (result) => {
                    if (result === false) {
                        callback("[DBInsert Wrapper] Error occured for UPDATE.", null);
                    } else {
                        callback(null, result);
                    }
                });
            };

            // Promisified Methods
            const dbInsert = promisify(wrapDbInsert);
            const dbFind = promisify(wrapDbFind);
            const dbUpdate = promisify(wrapDbUpdate);

            // Check if the couple is/are members
            // If not, create a people entry for them.
            // console.log("Checking if groom is member. Insert person entry if groom is not member.");
            if (!weddingData.groom.isMember) {
                const result = await dbInsert(db.tables.PERSON_TABLE, {
                    first_name: weddingData.groom.first_name,
                    middle_name: weddingData.groom.mid_name,
                    last_name: weddingData.groom.last_name,
                });

                if (result === false) {
                    return res.send(false);
                }

                weddingData.groom.person_id = result[0];
            }

            // console.log("Checking if bride is member. Insert person entry if bride is not member.");
            if (!weddingData.bride.isMember) {
                const result = await dbInsert(db.tables.PERSON_TABLE, {
                    first_name: weddingData.bride.first_name,
                    middle_name: weddingData.bride.mid_name,
                    last_name: weddingData.bride.last_name,
                });

                if (result === false) {
                    return res.send(false);
                }

                weddingData.bride.person_id = result[0];
            }

            // console.log("If bride's mother is not null, check if member. If not member, create a person record.");
            if (weddingData.brideMother && !weddingData.brideMother.isMember) {
                const result = await dbInsert(db.tables.PERSON_TABLE, {
                    first_name: weddingData.brideMother.first_name,
                    middle_name: weddingData.brideMother.mid_name,
                    last_name: weddingData.brideMother.last_name,
                });

                if (result === false) {
                    return res.send(false);
                }

                weddingData.brideMother.person_id = result[0];
            }

            // console.log("If bride's father is not null, check if member. If not member, create a person record.");
            if (weddingData.brideFather && !weddingData.brideFather.isMember) {
                const result = await dbInsert(db.tables.PERSON_TABLE, {
                    first_name: weddingData.brideFather.first_name,
                    middle_name: weddingData.brideFather.mid_name,
                    last_name: weddingData.brideFather.last_name,
                });

                if (result === false) {
                    return res.send(false);
                }

                weddingData.brideFather.person_id = result[0];
            }

            // console.log("If groom's mother is not null, check if member. If not member, create a person record.");
            if (weddingData.groomMother && !weddingData.groomMother.isMember) {
                const result = await dbInsert(db.tables.PERSON_TABLE, {
                    first_name: weddingData.groomMother.first_name,
                    middle_name: weddingData.groomMother.mid_name,
                    last_name: weddingData.groomMother.last_name,
                });

                if (result === false) {
                    return res.send(false);
                }

                weddingData.groomMother.person_id = result[0];
            }

            // console.log("If groom's father is not null, check if member. If not member, create a person record.");
            if (weddingData.groomFather && !weddingData.groomFather.isMember) {
                const result = await dbInsert(db.tables.PERSON_TABLE, {
                    first_name: weddingData.groomFather.first_name,
                    middle_name: weddingData.groomFather.mid_name,
                    last_name: weddingData.groomFather.last_name,
                });

                if (result === false) {
                    return res.send(false);
                }

                weddingData.groomFather.person_id = result[0];
            }

            // At this point, we are now sure that all entries have a person_id
            // Double check the person ids
            if (!(weddingData.groom.person_id && weddingData.bride.person_id)) {
                console.error("Groom or bride person_id somewhere");
                return res.send(false);
            }

            // Insert the couple id whenever appropriate
            // First, for each couple, check if they already have a couple entry. If not, create one.

            const coupleIds = {
                groomBride: null,
                groomParents: null,
                brideParents: null,
            };

            // Bride & Groom
            // console.log("Checking for existing couple ID for groom & bride. If one does not exist, create one.");
            const brideCondition = new Condition(queryTypes.where);
            const groomCondition = new Condition(queryTypes.where);
            brideCondition.setKeyValue(coupleFields.FEMALE, weddingData.bride.person_id);
            groomCondition.setKeyValue(coupleFields.MALE, weddingData.groom.person_id);
            const brideGroomCoupleId = await dbFind(
                db.tables.COUPLE_TABLE,
                [brideCondition, groomCondition],
                null,
                coupleFields.ID
            );
            if (brideGroomCoupleId.length > 0) {
                coupleIds.groomBride = brideGroomCoupleId[0].couple_id;
            } else {
                // Insert couple to table
                const coupleInsertResult = await dbInsert(db.tables.COUPLE_TABLE, {
                    female_id: weddingData.bride.person_id,
                    male_id: weddingData.groom.person_id,
                });

                if (coupleInsertResult === false) {
                    console.error("Error inserting bride & groom couple entry");
                    return res.send(false);
                }

                coupleIds.groomBride = coupleInsertResult[0];
            }

            // Bride's Parents
            // console.log("Checking for existing couple ID for the bride's parents. If one does not exist, create one.");
            if (weddingData.brideMother || weddingData.brideFather) {
                const brideParentsConditions = [];
                const brideMotherCondition = new Condition(queryTypes.where);
                const brideFatherCondition = new Condition(queryTypes.where);
                if (weddingData.brideMother) {
                    brideMotherCondition.setKeyValue(coupleFields.FEMALE, weddingData.brideMother.person_id);
                    brideParentsConditions.push(brideMotherCondition);
                } else {
                    brideMotherCondition.setKeyValue(coupleFields.FEMALE, null);
                    brideParentsConditions.push(brideMotherCondition);
                }
                if (weddingData.brideFather) {
                    brideFatherCondition.setKeyValue(coupleFields.MALE, weddingData.brideFather.person_id);
                    brideParentsConditions.push(brideFatherCondition);
                } else {
                    brideFatherCondition.setKeyValue(coupleFields.MALE, null);
                    brideParentsConditions.push(brideFatherCondition);
                }
                const brideParentsCoupleId = await dbFind(
                    db.tables.COUPLE_TABLE,
                    brideParentsConditions,
                    null,
                    coupleFields.ID
                );
                if (brideParentsCoupleId.length > 0) {
                    coupleIds.brideParents = brideParentsCoupleId[0];
                } else {
                    // Insert couple to table
                    const coupleInsertResult = await dbInsert(db.tables.COUPLE_TABLE, {
                        female_id: weddingData.brideMother ? weddingData.brideMother.person_id : null,
                        male_id: weddingData.brideFather ? weddingData.brideFather.person_id : null,
                    });

                    if (coupleInsertResult === false) {
                        console.error("Error inserting bride's parents' couple entry");
                        return res.send(false);
                    }

                    coupleIds.brideParents = coupleInsertResult[0];
                }
            } else {
                // Create an empty couple entry
                const coupleInsertResult = await dbInsert(db.tables.COUPLE_TABLE, {
                    female_id: null,
                    male_id: null,
                });

                if (coupleInsertResult === false) {
                    console.error("Error inserting bride's parents' couple entry");
                    return res.send(false);
                }

                coupleIds.brideParents = coupleInsertResult[0];
            }

            // Groom's Parents
            // console.log("Checking for existing couple ID for the groom's parents. If one does not exist, create one.");
            if (weddingData.groomMother || weddingData.groomFather) {
                const groomParentsConditions = [];
                const groomMotherCondition = new Condition(queryTypes.where);
                const groomFatherCondition = new Condition(queryTypes.where);
                if (weddingData.groomMother) {
                    groomMotherCondition.setKeyValue(coupleFields.FEMALE, weddingData.groomMother.person_id);
                    groomParentsConditions.push(groomMotherCondition);
                } else {
                    groomMotherCondition.setKeyValue(coupleFields.FEMALE, null);
                    groomParentsConditions.push(groomMotherCondition);
                }
                if (weddingData.groomFather) {
                    groomFatherCondition.setKeyValue(coupleFields.MALE, weddingData.groomFather.person_id);
                    groomParentsConditions.push(groomFatherCondition);
                } else {
                    groomFatherCondition.setKeyValue(coupleFields.MALE, null);
                    groomParentsConditions.push(groomFatherCondition);
                }
                const groomParentsCoupleId = await dbFind(
                    db.tables.COUPLE_TABLE,
                    groomParentsConditions,
                    null,
                    coupleFields.ID
                );
                if (groomParentsCoupleId.length > 0) {
                    coupleIds.groomParents = groomParentsCoupleId[0].couple_id;
                } else {
                    // Insert couple to table
                    const coupleInsertResult = await dbInsert(db.tables.COUPLE_TABLE, {
                        female_id: weddingData.groomMother ? weddingData.groomMother.person_id : null,
                        male_id: weddingData.groomFather ? weddingData.groomFather.person_id : null,
                    });

                    if (coupleInsertResult === false) {
                        console.error("Error inserting groom's parents' couple entry");
                        return res.send(false);
                    }

                    coupleIds.groomParents = coupleInsertResult[0];
                }
            } else {
                const coupleInsertResult = await dbInsert(db.tables.COUPLE_TABLE, {
                    female_id: null,
                    male_id: null,
                });

                if (coupleInsertResult === false) {
                    console.error("Error inserting groom's parents' couple entry");
                    return res.send(false);
                }

                coupleIds.groomParents = coupleInsertResult[0];
            }

            // Finally, time to insert to wedding table
            // console.log("Insert data into the wedding table.");
            const insertWeddingData = {};
            insertWeddingData[weddingRegFields.BRIDE_PARENTS] = coupleIds.brideParents;
            insertWeddingData[weddingRegFields.GROOM_PARENTS] = coupleIds.groomParents;
            insertWeddingData[weddingRegFields.COUPLE] = coupleIds.groomBride;
            insertWeddingData[weddingRegFields.CONTRACT] = weddingData.contract;
            insertWeddingData[weddingRegFields.DATE] = weddingData.date;
            insertWeddingData[weddingRegFields.DATE_OF_WEDDING] = weddingData.weddingDate;
            insertWeddingData[weddingRegFields.LOCATION] = weddingData.location;
            insertWeddingData[weddingRegFields.SOLEMNIZER] = weddingData.solemnizer;
            insertWeddingData[weddingRegFields.WEDDING_OFFICIANT] = weddingData.officiant;

            // console.log("insert wedding data:");
            // console.log(insertWeddingData);

            // Insert the wedding data
            const weddingInsertResult = await dbInsert(db.tables.WEDDING_TABLE, insertWeddingData);
            const weddingId = weddingInsertResult[0];

            // Add the wedding ID to the wedding_reg field on the member table for the couple if they are members
            // Bride
            if (weddingData.bride.isMember) {
                const brideMemberFindCondition = new Condition(queryTypes.where);
                brideMemberFindCondition.setKeyValue(memberFields.ID, weddingData.bride.member_id);
                const updateData = {};
                updateData[memberFields.WEDDING_REG] = weddingId;
                await dbUpdate(db.tables.MEMBER_TABLE, updateData, [brideMemberFindCondition]);
            }

            // Groom
            if (weddingData.groom.isMember) {
                const groomMemberFindCondition = new Condition(queryTypes.where);
                groomMemberFindCondition.setKeyValue(memberFields.ID, weddingData.groom.member_id);
                const updateData = {};
                updateData[memberFields.WEDDING_REG] = weddingId;
                await dbUpdate(db.tables.MEMBER_TABLE, updateData, [groomMemberFindCondition]);
            }

            // Process the witnesses
            // Male witnesses
            // console.log("Check if each male witness is a member. If not a member, create a person record for them.");
            await Promise.all(
                weddingData.witnessMale.map(async (witness, i) => {
                    // Execute if not member
                    if (!witness.isMember) {
                        // Find a person record for this person. Match via first name, middle name, and last name.
                        const witnessFirstNameCondition = new Condition(queryTypes.where);
                        const witnessMiddleNameCondition = new Condition(queryTypes.where);
                        const witnessLastNameCondition = new Condition(queryTypes.where);
                        witnessFirstNameCondition.setKeyValue(personFields.FIRST_NAME, witness.first_name);
                        witnessMiddleNameCondition.setKeyValue(personFields.MID_NAME, witness.mid_name);
                        witnessLastNameCondition.setKeyValue(personFields.LAST_NAME, witness.last_name);
                        const witnessPersonLookupResult = await dbFind(
                            db.tables.PERSON_TABLE,
                            [witnessFirstNameCondition, witnessMiddleNameCondition, witnessLastNameCondition],
                            null,
                            personFields.ID
                        );
                        if (witnessPersonLookupResult.length === 0) {
                            // Create new record for this person
                            const insertData = {};
                            insertData[personFields.FIRST_NAME] = witness.first_name;
                            insertData[personFields.MID_NAME] = witness.mid_name;
                            insertData[personFields.LAST_NAME] = witness.last_name;
                            const witnessPersonInsertResult = await dbInsert(db.tables.PERSON_TABLE, insertData);
                            if (witnessPersonInsertResult.length > 0) {
                                // Save the person id to the witness
                                weddingData.witnessMale[i].person_id = witnessPersonInsertResult[0];
                            } else {
                                console.error("Unable to insert male witnesses");
                                return res.send(false);
                            }
                        } else {
                            weddingData.witnessMale[i].person_id = witnessPersonLookupResult[0].couple_id;
                        }
                    }
                    // Insert the witness to the witness table
                    const witnessInsertionResult = await dbInsert(db.tables.WITNESS_TABLE, {
                        wedding_id: weddingId,
                        type: "Godfather",
                        person_id: weddingData.witnessMale[i].person_id,
                    });
                    if (witnessInsertionResult.length === 0) {
                        console.error("Unable to insert male witness into witness table");
                    }
                })
            );

            // Female witnesses
            // console.log("Check if each female witness is a member. If not a member, create a person record for them.");
            await Promise.all(
                weddingData.witnessFemale.map(async (witness, i) => {
                    // Execute if not member
                    if (!witness.isMember) {
                        // Find a person record for this person. Match via first name, middle name, and last name.
                        const witnessFirstNameCondition = new Condition(queryTypes.where);
                        const witnessMiddleNameCondition = new Condition(queryTypes.where);
                        const witnessLastNameCondition = new Condition(queryTypes.where);
                        witnessFirstNameCondition.setKeyValue(personFields.FIRST_NAME, witness.first_name);
                        witnessMiddleNameCondition.setKeyValue(personFields.MID_NAME, witness.mid_name);
                        witnessLastNameCondition.setKeyValue(personFields.LAST_NAME, witness.last_name);
                        const witnessPersonLookupResult = await dbFind(
                            db.tables.PERSON_TABLE,
                            [witnessFirstNameCondition, witnessMiddleNameCondition, witnessLastNameCondition],
                            null,
                            personFields.ID
                        );
                        if (witnessPersonLookupResult.length === 0) {
                            // Create new record for this person
                            const insertData = {};
                            insertData[personFields.FIRST_NAME] = witness.first_name;
                            insertData[personFields.MID_NAME] = witness.mid_name;
                            insertData[personFields.LAST_NAME] = witness.last_name;
                            const witnessPersonInsertResult = await dbInsert(db.tables.PERSON_TABLE, insertData);
                            if (witnessPersonInsertResult.length > 0) {
                                // Save the person id to the witness
                                weddingData.witnessFemale[i].person_id = witnessPersonInsertResult[0];
                            } else {
                                console.error("Unable to insert female witnesses");
                                return res.send(false);
                            }
                        } else {
                            weddingData.witnessFemale[i].person_id = witnessPersonLookupResult[0].couple_id;
                        }
                    }
                    // Insert the witness to the witness table
                    const witnessInsertionResult = await dbInsert(db.tables.WITNESS_TABLE, {
                        wedding_id: weddingId,
                        type: "Godmother",
                        person_id: weddingData.witnessFemale[i].person_id,
                    });
                    if (witnessInsertionResult.length === 0) {
                        console.error("Unable to insert female witness into witness table");
                    }
                })
            );

            return res.json(weddingId);
        } catch (err) {
            console.error("[WedingController] Error occured while creating new wedding registry record.");
            console.error(err);
            return res.send(false);
        }
    },

    /**
     * This function updates a row in the wedding table
     * @param req - the incoming request containing either the query or body
     * @param res - the result to be sent out after processing the request
     */
    putUpdateWedding: function (req, res) {
        const officiant = req.body.officiant;
        const location = req.body.location;
        const solemnizer = req.body.solemnizer;
        const date = req.body.date;
        const contract = req.body.contract;

        const dataInfo = {};
        dataInfo[weddingRegFields.WEDDING_OFFICIANT] = officiant;
        dataInfo[weddingRegFields.LOCATION] = location;
        dataInfo[weddingRegFields.SOLEMNIZER] = solemnizer;
        dataInfo[weddingRegFields.DATE_OF_WEDDING] = date;
        dataInfo[weddingRegFields.CONTRACT] = contract;

        const updateCond = new Condition(queryTypes.where);
        updateCond.setKeyValue(weddingRegFields.ID, req.body.recordId);

        db.update(tables.WEDDING_TABLE, dataInfo, updateCond, function (result) {
            if (result === 0) {
                result = true;
            }

            if (result) {
                res.send(true);
            } else {
                res.send(false);
            }
        });
    },
    /**
     * This function deletes a row in the wedding table
     * @param req - the incoming request containing either the query or body
     * @param res - the result to be sent out after processing the request
     */
    deleteWedding: function (req, res) {
        const nonMembers = JSON.parse(req.body.nonMembers);
        const couples = JSON.parse(req.body.couples);
        const witnesses = JSON.parse(req.body.witnesses);
        const recordId = req.body.recordId;

        const nonMembersCond = new Condition(queryTypes.whereIn);
        nonMembersCond.setArray(personFields.ID, nonMembers);

        const couplesCond = new Condition(queryTypes.whereIn);
        couplesCond.setArray(coupleFields.ID, couples);

        const witnessesCond = new Condition(queryTypes.whereIn);
        witnessesCond.setArray(witnessFields.ID, witnesses);

        const recordCond = new Condition(queryTypes.where);
        recordCond.setKeyValue(weddingRegFields.ID, recordId);

        const memberCond = new Condition(queryTypes.where);
        memberCond.setKeyValue(memberFields.WEDDING_REG, recordId);

        db.update(db.tables.MEMBER_TABLE, { wedding_reg_id: null }, memberCond, function (result) {
            if (result || result === 0) {
                // Delete Witnesses
                db.delete(tables.WITNESS_TABLE, witnessesCond, function (result) {
                    if (result === 0) {
                        result = true;
                    }
                    if (result) {
                        db.delete(tables.COUPLE_TABLE, couplesCond, function (result) {
                            if (result) {
                                db.delete(tables.PERSON_TABLE, nonMembersCond, function (result) {
                                    if (nonMembers.length === 0 || result) {
                                        db.delete(tables.WEDDING_TABLE, recordCond, function (result) {
                                            if (result || result === 0) {
                                                // Wedding record should be deleted because of FK constraint
                                                res.send(true);
                                            } else {
                                                res.send(false);
                                            }
                                        });
                                    } else {
                                        res.send(false);
                                    }
                                });
                            } else {
                                res.send(false);
                            }
                        });
                    } else {
                        res.send(false);
                    }
                });
            }
        });
    },

    putUpdateCouple: function (req, res) {
        console.log(req.body);
        const isFemale = req.body.isFemale === "true";
        const isOldMember = req.body.isOldMember === "true";
        const isParent = req.body.isParent === "true";
        const person = JSON.parse(req.body.person);
        const isNewMember = person === null ? false : person.isMember;
        const isNewNone = person === null;
        const isOldNone = !req.body.oldPersonId && !req.body.oldMemberId;
        const ids = {
            recordId: req.body.coupleId,
            oldPersonId: req.body.oldPersonId,
            newPersonId: person ? person.personId : null,
            updateRecordId: req.body.recordId,
        };
        const memberRecordField = isParent ? null : memberFields.WEDDING_REG; // No field edited in member if parent
        const fields = {
            recordId: coupleFields.ID,
            memberRecordField: memberRecordField,
            recordPersonField: isFemale ? coupleFields.FEMALE : coupleFields.MALE,
        };

        if (isOldNone && !isNewNone && isNewMember) {
            updateNoneToMember(ids, fields, tables.COUPLE_TABLE, sendReply);
        } else if (isOldNone && !isNewNone && !isNewMember) {
            updateNoneToNonMember(person, ids, fields, tables.COUPLE_TABLE, sendReply);
        } else if (isOldMember && isNewNone) {
            updateMemberToNone(ids, fields, tables.COUPLE_TABLE, sendReply);
        } else if (!isOldMember && isNewNone) {
            updateNonMemberToNone(ids, fields, tables.COUPLE_TABLE, sendReply);
        } else if (isOldMember && isNewMember) {
            // From member to member
            updateMemberToMember(ids, fields, tables.COUPLE_TABLE, sendReply);
        } else if (isOldMember && !isNewMember) {
            // From member to non member
            updateMemberToNonMember(person, ids, fields, tables.COUPLE_TABLE, sendReply);
        } else if (!isOldMember && isNewMember) {
            // From non member to member
            updateNonMemberToMember(ids, fields, tables.COUPLE_TABLE, sendReply);
        } else {
            person.personId = ids.oldPersonId;
            updateNonMemberToNonMember(person, sendReply);
        }

        function sendReply(result) {
            if (result) {
                res.send(JSON.stringify(result));
            } else {
                res.send(false);
            }
        }
    },

    putUpdateWitness: function (req, res) {
        const isOldMember = req.body.isOldMember === "true";
        const person = JSON.parse(req.body.person);
        const isNewMember = person.isMember;
        const ids = {
            recordId: req.body.witnessId,
            oldPersonId: req.body.oldPersonId,
            newPersonId: person.personId,
        };
        const fields = {
            recordId: witnessFields.ID,
            memberRecordField: null, // No need to edit in witness
            recordPersonField: witnessFields.PERSON,
        };

        if (isOldMember && isNewMember) {
            // From member to member
            updateMemberToMember(ids, fields, tables.WITNESS_TABLE, sendReply);
        } else if (isOldMember && !isNewMember) {
            // From member to non member
            updateMemberToNonMember(person, ids, fields, tables.WITNESS_TABLE, sendReply);
        } else if (!isOldMember && isNewMember) {
            // From non member to member
            updateNonMemberToMember(ids, fields, tables.WITNESS_TABLE, sendReply);
        } else {
            person.personId = ids.oldPersonId;
            updateNonMemberToNonMember(person, sendReply);
        }

        function sendReply(result) {
            if (result) {
                res.send(JSON.stringify(result));
            } else {
                res.send(false);
            }
        }
    },

    putAddWitness: function (req, res) {
        const recordId = req.body.recordId;
        const isFemale = req.body.isFemale === "true";
        const person = JSON.parse(req.body.person);

        const witnessData = {};
        witnessData[witnessFields.WEDDING] = recordId;
        witnessData[witnessFields.TYPE] = isFemale ? "Godmother" : "Godfather";
        witnessData[witnessFields.PERSON] = person.personId;

        const personInfo = [];

        if (!person.isMember) {
            const personData = {};
            personData[personFields.FIRST_NAME] = person.firstName;
            personData[personFields.MID_NAME] = person.midName;
            personData[personFields.LAST_NAME] = person.lastName;

            personInfo.push(personData);
        }

        db.insert(db.tables.PERSON_TABLE, personInfo, function (result) {
            if (result) {
                if (!person.isMember) {
                    witnessData[witnessFields.PERSON] = result[0];
                }

                db.insert(db.tables.WITNESS_TABLE, witnessData, function (result) {
                    if (result) {
                        const data = {
                            layout: false,
                            type: isFemale ? "female" : "male",
                            witness_id: result[0],
                            witness_person_id: witnessData[witnessFields.PERSON],
                            witness_member_id: person.memberId,
                            witness_first_name: person.firstName,
                            witness_mid_name: person.midName,
                            witness_last_name: person.lastName,
                        };

                        res.render("partials/edit-witness", data, function (err, html) {
                            if (err) {
                                res.send(false);
                            } else {
                                res.send(html);
                            }
                        });
                    } else {
                        res.send(false);
                    }
                });
            } else {
                res.send(false);
            }
        });
    },

    delWitness: function (req, res) {
        const recordId = req.body.recordId;
        const person = JSON.parse(req.body.person);

        const condition = new Condition(queryTypes.where);
        condition.setKeyValue(witnessFields.ID, recordId);

        let personCondition = null;

        if (!person.memberId) {
            personCondition = new Condition(queryTypes.where);
            personCondition.setKeyValue(personFields.ID, person.personId);
        } else {
            personCondition = new Condition(queryTypes.whereNull);
            personCondition.setField(personFields.ID);
        }

        db.delete(tables.WITNESS_TABLE, condition, function (result) {
            if (result) {
                db.delete(tables.PERSON_TABLE, personCondition, function (result) {
                    if (person.memberId && result === 0) {
                        result = true;
                    }
                    if (result) {
                        res.send(true);
                    } else {
                        res.send(false);
                    }
                });
            } else {
                res.send(false);
            }
        });
    },
};

module.exports = weddingController;
