const binningFunction = require("../helpers/binAttendance");

describe("Given attendance dates, I want to make sure that they are binned properly for data visualization", () => {

    it("If the year difference of the earliest and latest dates are less than a year, dates must be binned by month", () => {
        // Arrange
        const orderedData = {
            '2021-01-22': 2,
            '2021-03-01': 8,
            '2021-04-15': 1,
            '2021-04-21': 6,
            '2021-12-10': 3,
        };
        // Act
        const bins = binningFunction(orderedData);

        // Assert
        expect(bins).toStrictEqual({
            "January": 2,
            "February": 0,
            "March": 8,
            "April": 7,
            "May": 0,
            "June": 0,
            "July": 0,
            "August": 0,
            "September": 0,
            "October": 0,
            "November": 0,
            "December": 3
        });
    });

    it("If the year difference of the earliest and latest dates are greater than a year but less than or equal to 5 years, dates must be binned semi-annually", () => {
        // Arrange
        const orderedData = {
            //2021 FIRST HALF 
            '2021-01-22': 2,
            '2021-03-01': 8,
            '2021-04-15': 1,
            '2021-04-21': 6,
            //2021 SECOND HALF
            '2021-12-10': 3,
            //2022 FIRST HALF
            '2022-01-04': 4,
            '2022-05-12': 2,
            //2022 SECOND HALF -> 0
            //2023 FIRST HALF -> 0
            //2023 SECOND HALF -> 0
            //2024 FIRST HALF
            '2024-01-24': 5,
            //2024 SECOND HALF
            '2024-12-25': 5
        };
        // Act
        const bins = binningFunction(orderedData);

        // Assert
        expect(bins).toStrictEqual({
            "2021 Jan-Jun": 17,
            "2021 Jul-Dec": 3,
            "2022 Jan-Jun": 6,
            "2022 Jul-Dec": 0,
            "2023 Jan-Jun": 0,
            "2023 Jul-Dec": 0,
            "2024 Jan-Jun": 5,
            "2024 Jul-Dec": 5
        });
    });

    it("If the year difference of the earliest and latest dates are greater than 5 years, dates must be binned by year", () => {
        // Arrange
        const orderedData = {
            // 2014
            '2014-01-22': 2,
            '2014-01-20': 9,
            '2014-07-01': 1,
            // 2015
            '2015-03-01': 8,
            // 2017
            '2017-04-10': 1,
            '2017-09-09': 8,
            '2017-12-24': 5,
            // 2019
            '2019-04-21': 6,
            // 2021
            '2021-01-10': 3,
            '2021-02-10': 4,
            '2021-12-10': 5,
        };
        // Act
        const bins = binningFunction(orderedData);

        // Assert
        expect(bins).toStrictEqual({
            '2014': 12,
            '2015': 8,
            '2016': 0,
            '2017': 14,
            '2018': 0,
            '2019': 6,
            '2020': 0,
            '2021': 12
        });
    });
    
    it("If the year difference of the earliest and latest dates is greater than 20, an error must be returned", () => {
        // Arrange
        const orderedData = {
            '2014-01-22': 2,
            '2015-03-01': 8,
            '2017-04-15': 1,
            '2019-04-21': 6,
            '2021-12-10': 3,
            '2035-01-22': 2,
        }

        // Act
        const bins = binningFunction(orderedData);

        // Assert
        expect(bins).toStrictEqual({
            "error": true
        });
    })
});