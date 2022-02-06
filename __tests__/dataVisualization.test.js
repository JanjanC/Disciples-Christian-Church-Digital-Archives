const binningFunction = require("../helpers/binningFunction");

describe("Given attendance dates, I want to make sure that they are binned properly for data visualization", () => {

    it("If the year difference of the earliest and latest dates are less than a year, dates must be binned by month", () => {
        // Arrange
        const data = [
            // 2 results on '2021-01-22'
            {date: '2021-01-22'}, {date: '2021-01-22'},
            // 8 results on '2021-03-01'
            {date: '2021-03-01'}, {date: '2021-03-01'}, {date: '2021-03-01'}, {date: '2021-03-01'},
            {date: '2021-03-01'}, {date: '2021-03-01'}, {date: '2021-03-01'}, {date: '2021-03-01'},
            // 1 result on '2021-04-15'
            {date: '2021-04-15'},
            // 6 results on '2021-04-21'
            {date: '2021-04-21'}, {date: '2021-04-21'}, {date: '2021-04-21'},
            {date: '2021-04-21'}, {date: '2021-04-21'}, {date: '2021-04-21'},
            // 3 results on '2021-12-10'
            {date: '2021-12-10'}, {date: '2021-12-10'}, {date: '2021-12-10'}
        ];
        // Act
        const bins = binningFunction(data, '2021-01-22', '2021-12-10');

        // Assert
        expect(bins).toStrictEqual({
            "January 2021": 2,
            "February 2021": 0,
            "March 2021": 8,
            "April 2021": 7,
            "May 2021": 0,
            "June 2021": 0,
            "July 2021": 0,
            "August 2021": 0,
            "September 2021": 0,
            "October 2021": 0,
            "November 2021": 0,
            "December 2021": 3
        });
    });

    it("If the year difference of the earliest and latest dates are greater than a year but less than or equal to 3 years, dates must be binned tri-annually", () => {
        // Arrange
        const data = [
            //2021 FIRST HALF
            // 2 results on '2021-01-22'
            {date: '2021-01-22'}, {date: '2021-01-22'},
            // 8 results on '2021-03-01'
            {date: '2021-03-01'}, {date: '2021-03-01'}, {date: '2021-03-01'}, {date: '2021-03-01'},
            {date: '2021-03-01'}, {date: '2021-03-01'}, {date: '2021-03-01'}, {date: '2021-03-01'},
            // 1 result on '2021-04-15'
            {date: '2021-04-15'},
            // 6 results on '2021-04-21'
            {date: '2021-04-21'}, {date: '2021-04-21'}, {date: '2021-04-21'},
            {date: '2021-04-21'}, {date: '2021-04-21'}, {date: '2021-04-21'},
            //2021 SECOND HALF -> 0
            //2021 THIRD HALF
            // 3 results on '2021-12-10'
            {date: '2021-12-10'}, {date: '2021-12-10'}, {date: '2021-12-10'},
            //2022 FIRST HALF
            // 4 results on '2022-01-04'
            {date: '2022-01-04'}, {date: '2022-01-04'}, {date: '2022-01-04'}, {date: '2022-01-04'},
            //2022 SECOND HALF
            //2 results on '2022-05-12'
            {date: '2022-05-12'}, {date: '2022-05-12'},
            //2022 THIRD HALF -> 0
            //2023 FIRST HALF
            // 3 results on '2023-01-12'
            {date: '2023-01-12'}, {date: '2023-01-12'},  {date: '2023-01-12'},
        ];
        // Act
        const bins = binningFunction(data, '2021-01-22', '2023-01-12');

        // Assert
        expect(bins).toStrictEqual({
            "2021 Jan-Apr": 17,
            "2021 May-Aug": 0,
            "2021 Sept-Dec": 3,
            "2022 Jan-Apr": 4,
            "2022 May-Aug": 2,
            "2022 Sept-Dec": 0,
            "2023 Jan-Apr": 3,
        });
    });

    it("If the year difference of the earliest and latest dates are greater than 3 years but less than or equal to 5 years, dates must be binned by semi annually", () => {
        // Arrange
        const orderedData = {
            // 2015 SECOND HALF -> 0
            // 2016 FIRST HALF -> 0
            // 2016 SECOND HALF -> 0
            // 2017 FIRST HALF
            '2017-04-10': 1,
        };
        const data = [
            //2014 FIRST HALF
            // 2 results on '2014-01-22'
            {date: '2014-01-22'}, {date: '2014-01-22'},
            // 9 results on '2014-01-20'
            {date: '2014-01-20'}, {date: '2014-01-20'}, {date: '2014-01-20'}, {date: '2014-01-20'},
            {date: '2014-01-20'}, {date: '2014-01-20'}, {date: '2014-01-20'}, {date: '2014-01-20'},
            {date: '2014-01-20'},
            // 2014 SECOND HALF
            // 1 result on '2014-07-01'
            {date: '2014-07-01'},
            // 2015 FIRST HALF
            // 8 results on '2021-04-21'
            {date: '2015-03-01'}, {date: '2015-03-01'}, {date: '2015-03-01'}, {date: '2015-03-01'}, 
            {date: '2015-03-01'}, {date: '2015-03-01'}, {date: '2015-03-01'}, {date: '2015-03-01'}, 
            // 2015 SECOND HALF -> 0
            // 2016 FIRST HALF -> 0
            // 2016 SECOND HALF -> 0
            // 2017 FIRST HALF
            // 1 result on '2017-04-10'
            {date: '2017-04-10'},
            //2017 SECOND HALF -> 8 + 5 = 13
            {date: '2017-09-09'}, {date: '2017-09-09'}, {date: '2017-09-09'}, {date: '2017-09-09'}, 
            {date: '2017-09-09'}, {date: '2017-09-09'}, {date: '2017-09-09'}, {date: '2017-09-09'},
            {date: '2017-12-24'}, {date: '2017-12-24'}, {date: '2017-12-24'}, {date: '2017-12-24'}, {date: '2017-12-24'},
            //2018 FIRST HALF -> 6
            {date: '2018-01-21'}, {date: '2018-01-21'},  {date: '2018-01-21'},
            {date: '2018-01-21'}, {date: '2018-01-21'},  {date: '2018-01-12'}
        ];
        // Act
        const bins = binningFunction(data, '2014-01-22', '2018-01-21');

        // Assert
        expect(bins).toStrictEqual({
            "2014 Jan-Jun": 11,
            "2014 Jul-Dec": 1,
            "2015 Jan-Jun": 8,
            "2015 Jul-Dec": 0,
            "2016 Jan-Jun": 0,
            "2016 Jul-Dec": 0,
            "2017 Jan-Jun": 1,
            "2017 Jul-Dec": 13,
            "2018 Jan-Jun": 6
        });
    });
    
    it("If the year difference of the earliest and latest dates is greater than 5 years, an error must be returned", () => {
        // Arrange
        const data = [
            {date: '2014-01-22'},
            {date: '2035-01-22'}
        ]

        // Act
        const bins = binningFunction(data, '2014-01-22', '2035-01-22');

        // Assert
        expect(bins).toStrictEqual({
            "error": true
        });
    })
});