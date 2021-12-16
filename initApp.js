const knex = require("knex");
const dotenv = require("dotenv");
const mysql = require("mysql2");
const fs = require("fs");
const { dbInfo } = require("./models/dbInfo");
const startIds = dbInfo.startIds;
const bcrypt = require("bcrypt");
const saltRounds = 10;
const data = require("./models/dummyData");
dotenv.config();

let knexClient = {};

function getMySQLInstance() {
    const conn = mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASS,
        database: process.env.DB_NAME,
        ssl: {
            ca: fs.readFileSync("/etc/ssl/cert.pem"),
        },
    });
    conn.connect((err) => {
        if (err) {
            throw new Error("MySQL connection error: " + err.message);
        }
    });

    return conn;
}

function initDatabase() {
    const db = getMySQLInstance();

    // Initialize Knex connection
    knexClient = knex({
        client: "mysql",
        connection: {
            host: process.env.DB_HOST,
            user: process.env.DB_USER,
            password: process.env.DB_PASS,
            database: process.env.DB_NAME,
            ssl: true,
        },
        useNullAsDefault: true,
    });

    startIds.forEach((record) => {
        knexClient()
            .insert({
                name: record.table,
                seq: record.start,
            })
            .catch((err) => {
                console.log(err);
            });
    });

    // execute all statements
    db.connect((err) => {
        if (err) {
            throw new Error("MySQL Failed to connect: " + err.message);
        } else {
            for (const stmt of Object.values(dbInfo.create)) {
                db.query(stmt, (err, results) => {
                    if (err) {
                        throw new Error("Error while initializing database: " + err.message);
                    } else {
                        console.log(results);
                    }
                });
            }
        }
    });
}

function insertAccounts(level1 = "NormandyN7", level2 = "HelloSweng", level3 = "Coffee118") {
    knexClient("accounts")
        .select()
        .then(function (res) {
            if (res.length === 0) {
                bcrypt.hash(level1, saltRounds, (err, hash) => {
                    if (err) {
                        console.log(err);
                    }
                    knexClient("accounts")
                        .insert({
                            level: 1,
                            hashed_password: hash,
                        })
                        .catch(function (err) {
                            console.log(err);
                        });
                });
                bcrypt.hash(level2, saltRounds, (err, hash) => {
                    if (err) {
                        console.log(err);
                    }

                    knexClient("accounts")
                        .insert({
                            level: 2,
                            hashed_password: hash,
                        })
                        .catch(function (err) {
                            console.log(err);
                        });
                });
                bcrypt.hash(level3, saltRounds, (err, hash) => {
                    if (err) {
                        console.log(err);
                    }
                    knexClient("accounts")
                        .insert({
                            level: 3,
                            hashed_password: hash,
                        })
                        .catch(function (err) {
                            console.log(err);
                        });
                });
            }
        });
}

function insertData() {
    // insert accounts
    data.forEach((record) => {
        knexClient("people")
            .insert(record.person)
            .then((person) => {
                if (person) {
                    record.member.person_id = person[0];

                    knexClient("address")
                        .insert(record.address)
                        .then((address) => {
                            if (address) {
                                record.member.address_id = address[0];
                                knexClient("members")
                                    .insert(record.member)
                                    .then((result) => {
                                        if (result) {
                                            knexClient("people")
                                                .where("person_id", "=", record.member.person_id)
                                                .update({
                                                    member_id: result[0],
                                                })
                                                .then((result) => {
                                                    if (result) {
                                                        console.log("Filled up database with dummy data");
                                                    }
                                                });
                                        } else {
                                            console.log(result);
                                        }
                                    });
                            } else {
                                console.log(address);
                            }
                        });
                } else {
                    console.log(person);
                }
            });
    });
}

// Uncomment these to run the database initialization script.
// initDatabase();
// insertAccounts();
// insertData();
