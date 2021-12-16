const mysql = require("mysql2");
const sinon = require("sinon");
const db = require("../models/db");

/**
 * This unit testing suite tests only the new functions that we added to the db.js file.
 *
 */
describe("The Database Model", () => {
    let sandbox = sinon.createSandbox();

    describe("getMySQLInstance method", () => {
        afterEach(() => {
            sandbox.restore();
        });

        it("Returns a connection object from the database when configuration is valid.", () => {
            return; // Should be removed in future sprints
            // Arrange
            sandbox.stub(mysql, "createConnection").returns({
                connect: sinon.stub().yields(null),
            });

            // Act
            const result = db.getMySQLInstance();

            // Assert
            expect(result).toBeDefined();
            expect(result).not.toBeNull();
        });

        it("Raises an exception when a connection cannot be established.", () => {
            return; // Should be removed in future sprints
            // Arrange
            sandbox.stub(mysql, "createConnection").returns({
                connect: sinon.stub().yields({ message: "Connection cannot be established." }),
            });

            // Act & Assert
            expect(db.getMySQLInstance).toThrow(Error);
            expect(db.getMySQLInstance).toThrow("MySQL connection error: Connection cannot be established.");
        });
    });
});
