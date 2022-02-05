/**
 * This script initializes a MySQL database.
 */

// Dependencies
const mysql = require("mysql2");
const prompt = require("prompt");
const { dbInfo } = require("./models/dbInfo");
const dummyData = require("./models/dummyData");
const { promisify } = require("util");
require("dotenv").config();

// Initialization
prompt.start();

async function script() {
    // Grab MySQL server details
    let connectionDetails = {};
    let includeDummyData = false;
    let useEnv = false;
    try {
        const envQuestion = await prompt.get([
            {
                name: "Use environment variables for database connection info? (Y/N)",
                validator: /Y|y|N|n/,
            },
        ]);
        if (
            envQuestion["Use environment variables for database connection info? (Y/N)"] === "n" ||
            envQuestion["Use environment variables for database connection info? (Y/N)"] === "N"
        ) {
            console.log("Enter database details:");
            connectionDetails = await prompt.get([
                "Host_Address",
                "Database_User",
                { name: "Database_Password", hidden: true },
                "Database_Name",
                { name: "Port", validator: /^[0-9]+$/, warning: "Must only be numbers." },
            ]);
        } else {
            useEnv = true;
        }
        const includeDummyDataQuestion = await prompt.get([
            { name: "Include_dummy_data? (Y/N)", validator: /Y|y|N|n/ },
        ]);
        if (
            includeDummyDataQuestion["Include_dummy_data? (Y/N)"] === "Y" ||
            includeDummyDataQuestion["Include_dummy_data? (Y/N)"] === "y"
        ) {
            includeDummyData = true;
        }
    } catch (inputError) {
        console.error(inputError);
    }

    // Create Connection Object
    const connection = mysql.createConnection({
        host: useEnv ? process.env.DB_HOST : connectionDetails["Host_Address"],
        user: useEnv ? process.env.DB_USER : connectionDetails["Database_User"],
        password: useEnv ? process.env.DB_PASS : connectionDetails["Database_Password"],
        database: useEnv ? process.env.DB_NAME : connectionDetails["Database_Name"],
        port: useEnv ? process.env.DB_PORT : connectionDetails["Port"],
        ssl: {
            rejectUnauthorized: false,
        },
    });

    // Promisify Connection
    const dbQuery = promisify(connection.query).bind(connection);

    // Create the tables
    console.log("========== Creating tables... ==========");
    await Promise.all(
        Object.values(dbInfo.create).map(async (createTableStatement) => {
            await dbQuery(createTableStatement)
                .then(() => {
                    console.log("SUCCESS: " + createTableStatement);
                })
                .catch((err) => {
                    console.log("FAILED: " + createTableStatement);
                    console.error(err);
                });
        })
    );

    // Insert user accounts
    console.log("========== Inserting user accounts... ==========");
    await Promise.all(
        dummyData.accounts.map(async (account) => {
            await dbQuery(
                `INSERT INTO accounts (level, hashed_password) VALUES (${account.level}, "${account.hashed_password}");`
            )
                .then(() => {
                    console.log("SUCCESS: Level " + account.level);
                })
                .catch((err) => {
                    console.log("FAILED: Level " + account.level);
                    console.error(err);
                });
        })
    );

    // Insert dummy data
    if (includeDummyData) {
        console.log("========== Inserting dummy members & people data... ==========");
        await Promise.all(
            dummyData.membersAndPersons.map(async (data) => {
                try {
                    // Person Entry
                    const peopleInsertResult = await dbQuery(
                        `INSERT INTO people (first_name, middle_name, last_name) VALUES ("${data.person.first_name}", "${data.person.middle_name}", "${data.person.last_name}");`
                    );
                    // Address Entry
                    const addressInsertResult = await dbQuery(
                        `INSERT INTO address (address_line, city, province, country) VALUES ("${data.address.address_line}", "${data.address.city}", "${data.address.province}", "${data.address.country}");`
                    );
                    // Member Entry
                    const memberInsertResult = await dbQuery(
                        `
                        INSERT INTO members (address_id, person_id, member_status, civil_status, birthday, occupation, workplace, email, telephone, mobile, educ_attainment, alma_mater, sex) 
                        VALUES (${addressInsertResult.insertId}, ${peopleInsertResult.insertId}, "${data.member.member_status}", "${data.member.civil_status}", "${data.member.birthday}",
                        "${data.member.occupation}", "${data.member.workplace}", "${data.member.email}", "${data.member.telephone}", "${data.member.mobile}", "${data.member.educ_attainment}", "${data.member.alma_mater}", "${data.member.sex}");
                        `
                    );
                    // Update Person Entry
                    await dbQuery(
                        `UPDATE people SET member_id = ${memberInsertResult.insertId} WHERE person_id = ${peopleInsertResult.insertId};`
                    );
                    console.log("SUCCESS: " + data.person.first_name + " " + data.person.last_name);
                } catch (dummyInsertError) {
                    console.log("Dummy person not inserted: " + data.person.first_name + " " + data.person.last_name);
                    console.error(dummyInsertError);
                }
            })
        );
    }
}

// Run script
script()
    .then(() => {
        console.log("========== Done! ==========");
        process.exit(0);
    })
    .catch((err) => {
        console.error(err);
    });
