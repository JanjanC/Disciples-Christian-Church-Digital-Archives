const path = require("path");

const createBapReg =
    "CREATE TABLE IF NOT EXISTS bap_reg (reg_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, date TEXT, date_created TEXT,location TEXT, officiant INT,person INT);";

const createInfDedication =
    "CREATE TABLE IF NOT EXISTS inf_dedication (dedication_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, person_id INTEGER NOT NULL, parents_id INTEGER, date TEXT, dedication_date TEXT, place TEXT, officiant TEXT);";

const createWitness =
    "CREATE TABLE IF NOT EXISTS witness (witness_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, dedication_id INTEGER,wedding_id INTEGER,type TEXT,person_id INTEGER NOT NULL);";

const createAccounts =
    "CREATE TABLE IF NOT EXISTS accounts (level VARCHAR(10) NOT NULL PRIMARY KEY,hashed_password VARCHAR(50));";

const createPreNuptial =
    "CREATE TABLE IF NOT EXISTS pre_nuptial (record_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,couple_id INTEGER NOT NULL,date TEXT,date_of_wedding TEXT);";

const createWeddingReg =
    "CREATE TABLE IF NOT EXISTS wedding_reg (wedding_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,couple_id INTEGER NOT NULL,date TEXT, date_of_wedding TEXT,bride_parents_id INTEGER,groom_parents_id INTEGER,location TEXT, wedding_officiant TEXT,solemnizing_officer TEXT,contract_no TEXT);";

const createDonationRecord =
    "CREATE TABLE IF NOT EXISTS donations (donation_record_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,member_id INTEGER NOT NULL,type TEXT, amount REAL, date TEXT);";

const createAddress =
    "CREATE TABLE IF NOT EXISTS address (address_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, address_line TEXT, address_line2 TEXT,city TEXT, province TEXT,postal_code TEXT,country TEXT);";

const createMembers =
    "CREATE TABLE IF NOT EXISTS members (member_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,address_id INTEGER,bap_reg_id INTEGER,wedding_reg_id INTEGER,prenup_record_id INTEGER,person_id INTEGER NOT NULL,child_dedication_id INTEGER, member_status TEXT,member_type TEXT,civil_status TEXT,birthday TEXT,occupation TEXT,workplace TEXT,email TEXT,telephone TEXT,mobile TEXT,educ_attainment TEXT,alma_mater TEXT,skills TEXT,date_created TEXT,sex TEXT,family_members TEXT,parents_id INTEGER);";

const createPerson =
    "CREATE TABLE IF NOT EXISTS people(person_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, member_id INTEGER,first_name TEXT,middle_name TEXT,last_name TEXT);";

const createCouple =
    "CREATE TABLE IF NOT EXISTS couples(couple_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, female_id INTEGER,male_id INTEGER);";

const createObservations =
    "CREATE TABLE IF NOT EXISTS observations(observation_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, comment TEXT NOT NULL,observee_id INTEGER NOT NULL,observer TEXT NOT NULL,date TEXT NOT NULL);";

const createAttendance = 
  'CREATE TABLE IF NOT EXISTS attendance (' +
  'attendance_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
  'person_id INTEGER, date TEXT NOT NULL, ' +
  'FOREIGN KEY(person_id) REFERENCES people(person_id))'

const createChurches =
    "CREATE TABLE IF NOT EXISTS churches(church_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,church_name TEXT NOT NULL, member_id INTEGER NOT NULL, address_id INTEGER NOT NULL);";

const fse = require("fs-extra");

const db = {
  create: {
    baptismal: createBapReg,
    dedication: createInfDedication,
    account: createAccounts,
    prenup: createPreNuptial,
    weddings: createWeddingReg,
    donations: createDonationRecord,
    address: createAddress,
    members: createMembers,
    person: createPerson,
    couples: createCouple,
    observations: createObservations,
    churches: createChurches,
    witness: createWitness,
    attendance: createAttendance
  },
  tables: {
    MEMBER_TABLE: 'members',
    ADDRESS_TABLE: 'address',
    ACCOUNT_TABLE: 'accounts',
    PERSON_TABLE: 'people',
    DONATION_TABLE: 'donations',
    BAPTISMAL_TABLE: 'bap_reg',
    WEDDING_TABLE: 'wedding_reg',
    PRENUPTIAL_TABLE: 'pre_nuptial',
    WITNESS_TABLE: 'witness',
    INFANT_TABLE: 'inf_dedication',
    COUPLE_TABLE: 'couples',
    OBSERVATION_TABLE: 'observations',
    CHURCH_TABLE: 'churches',
    ATTENDANCE_TABLE: 'attendance'
  },
  fields: {
        ID: "level",
        PASSWORD: "hashed_password",
        address: {
            ID: "address_id",
            ADDRESS_LINE: "address_line",
            ADDRESS_LINE2: "address_line2",
            CITY: "city",
            PROVINCE: "province",
            POSTAL_CODE: "postal_code",
            COUNTRY: "country",
        },
        bap_reg: {
            ID: "reg_id",
            DATE: "date",
            DATE_CREATED: "date_created",
            LOCATION: "location",
            OFFICIANT: "officiant",
            PERSON: "person",
        },
        churches: {
            ID: "church_id",
            NAME: "church_name",
            MEMBER: "member_id",
            ADDRESS: "address_id",
        },
        couples: {
            ID: "couple_id",
            FEMALE: "female_id",
            MALE: "male_id",
        },
        donations: {
            ID: "income_id",
            PERSON: "person_id",
            TYPE: "type",
            AMT: "amount",
            DATE: "date",
        },
        inf_dedication: {
            ID: "dedication_id",
            PERSON: "person_id",
            DATE: "date",
            DEDICATION_DATE: "dedication_date",
            PLACE: "place",
            OFFICIANT: "officiant",
            PARENTS: "parents_id",
        },
        members: {
            ID: "member_id",
            ADDRESS: "address_id",
            MEMBER_STATUS: "member_status",
            MEMBER_TYPE: "member_type",
            CIVIL_STATUS: "civil_status",
            BIRTHDAY: "birthday",
            OCCUPATION: "occupation",
            WORKPLACE: "workplace",
            EMAIL: "email",
            TELEPHONE: "telephone",
            MOBILE: "mobile",
            EDUCATIONAL_ATTAINMENT: "educ_attainment",
            ALMA_MATER: "alma_mater",
            PERSON: "person_id",
            BAPTISMAL_REG: "bap_reg_id",
            WEDDING_REG: "wedding_reg_id",
            PRENUP_RECORD: "prenup_record_id",
            SKILLS: "skills",
            DATE: "date_created",
            SEX: "sex",
            PARENTS: "parents_id",
            FAMILY: "family_members",
            CHILD_DEDICATION: "child_dedication_id",
        },
        people: {
            ID: "person_id",
            MEMBER: "member_id",
            FIRST_NAME: "first_name",
            MID_NAME: "middle_name",
            LAST_NAME: "last_name",
        },
        observations: {
            ID: "observation_id",
            COMMENT: "comment",
            OBSERVEE: "observee_id",
            OBSERVER: "observer",
            DATE: "date",
        },
        pre_nuptial: {
            ID: "record_id",
            COUPLE: "couple_id",
            DATE: "date",
            DATE_OF_WEDDING: "date_of_wedding",
        },
        wedding_reg: {
            ID: "wedding_id",
            DATE: "date",
            COUPLE: "couple_id",
            DATE_OF_WEDDING: "date_of_wedding",
            BRIDE_PARENTS: "bride_parents_id",
            GROOM_PARENTS: "groom_parents_id",
            WEDDING_OFFICIANT: "wedding_officiant",
            LOCATION: "location",
            SOLEMNIZER: "solemnizing_officer",
            CONTRACT: "contract_no",
        },
        witness: {
            ID: "witness_id",
            PERSON: "person_id",
            TYPE: "type",
            DEDICATION: "dedication_id",
            WEDDING: "wedding_id",
        },
        churches: {
            ID: 'church_id',
            NAME: 'church_name',
            MEMBER: 'member_id',
            ADDRESS: 'address_id'
        },
        couples: {
            ID: 'couple_id',
            FEMALE: 'female_id',
            MALE: 'male_id'
        },
        donations: {
            ID: 'income_id',
            PERSON: 'person_id',
            TYPE: 'type',
            AMT: 'amount',
            DATE: 'date'
        },
        inf_dedication: {
            ID: 'dedication_id',
            PERSON: 'person_id',
            DATE: 'date',
            DEDICATION_DATE: 'dedication_date',
            PLACE: 'place',
            OFFICIANT: 'officiant',
            PARENTS: 'parents_id'
        },
        members: {
            ID: 'member_id',
            ADDRESS: 'address_id',
            MEMBER_STATUS: 'member_status',
            MEMBER_TYPE: 'member_type',
            CIVIL_STATUS: 'civil_status',
            BIRTHDAY: 'birthday',
            OCCUPATION: 'occupation',
            WORKPLACE: 'workplace',
            EMAIL: 'email',
            TELEPHONE: 'telephone',
            MOBILE: 'mobile',
            EDUCATIONAL_ATTAINMENT: 'educ_attainment',
            ALMA_MATER: 'alma_mater',
            PERSON: 'person_id',
            BAPTISMAL_REG: 'bap_reg_id',
            WEDDING_REG: 'wedding_reg_id',
            PRENUP_RECORD: 'prenup_record_id',
            SKILLS: 'skills',
            DATE: 'date_created',
            SEX: 'sex',
            PARENTS: 'parents_id',
            FAMILY: 'family_members',
            CHILD_DEDICATION: 'child_dedication_id'
        },
        people: {
            ID: 'person_id',
            MEMBER: 'member_id',
            FIRST_NAME: 'first_name',
            MID_NAME: 'middle_name',
            LAST_NAME: 'last_name'
        },
        observations: {
            ID: 'observation_id',
            COMMENT: 'comment',
            OBSERVEE: 'observee_id',
            OBSERVER: 'observer',
            DATE: 'date'
        },
        pre_nuptial: {
            ID: 'record_id',
            COUPLE: 'couple_id',
            DATE: 'date',
            DATE_OF_WEDDING: 'date_of_wedding'
        },
        wedding_reg: {
            ID: 'wedding_id',
            DATE: 'date',
            COUPLE: 'couple_id',
            DATE_OF_WEDDING: 'date_of_wedding',
            BRIDE_PARENTS: 'bride_parents_id',
            GROOM_PARENTS: 'groom_parents_id',
            WEDDING_OFFICIANT: 'wedding_officiant',
            LOCATION: 'location',
            SOLEMNIZER: 'solemnizing_officer',
            CONTRACT: 'contract_no'
        },
        witness: {
            ID: 'witness_id',
            PERSON: 'person_id',
            TYPE: 'type',
            DEDICATION: 'dedication_id',
            WEDDING: 'wedding_id'
        },
        attendance: {
            ID: 'attendace_id',
            PERSON: 'person_id',
            DATE: 'date'
        },
    },
    startIds: [
        { table: 'people', start: 13000000 },
        { table: 'members', start: 1000000 },
        { table: 'address', start: 2000000 },
        { table: 'accounts', start: 0 },
        { table: 'bap_reg', start: 3000000 },
        { table: 'pre_nuptial', start: 4000000 },
        { table: 'wedding_reg', start: 5000000 },
        { table: 'witness', start: 6000000 },
        { table: 'inf_dedication', start: 7000000 },
        { table: 'donations', start: 8000000 },
        { table: 'observations', start: 9000000 },
        { table: 'couples', start: 10000000 },
        { table: 'churches', start: 11000000 },
        { table: 'attendance', start: 12000000 }
    ]
}

module.exports = {
    dbInfo: db,
    exportToJSON: function () {
        fse.writeFile(path.join(__dirname, "db.json"), JSON.stringify(db, null, 4), "utf8");
    },
};
