/**
 * Helper function to be used when binning dates in attendanceReportController.js.
 * @param data - an array of objects where each object contains a field called date that is a valid date string
 * @param startDate - the earliest date in the data set
 * @param endDate - the latest date in the data set
 */
function binAttendance(data, startDate, endDate) {
    if (data == null || data == undefined) {
        bins.error = true;
        return bins;
    }

    // Converts array of objects into object, where keys = date and value = count (i.e. {'2021-02-18': 5})
    const temp = {}
    data.forEach(attendance => {
        date = new Date(attendance.date).toISOString().split('T')[0];
        if (typeof(temp[date]) == "number")
            temp[date]++;
        else
            temp[date] = 1;
    });
    data = temp;
    var bins = {}
    // Find year difference of earliest and latest dates
    const dateKeys = Object.keys(data);

    // Obtain only the year from the string
    const earliestDate = new Date(startDate).setDate(1);
    const latestDate = new Date(endDate).setDate(1);
    const difference = Math.floor((latestDate - earliestDate) / (1000 * 60 * 60 * 24));
    //console.log("difference " + difference)
    // Bins: Less than a year
    if (difference <= 365) {
        const months = ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"];

        // Initialize bins
        for (let i = new Date(earliestDate); i <= latestDate; i.setMonth(i.getMonth() + 1))
            bins[months[i.getMonth()] + " " + i.getFullYear()] = 0;
        
        // Transfer each date to its proper bin
        for (const date in data) {
            const curDate = new Date(date);
            bins[months[curDate.getMonth()] + " " + curDate.getFullYear()] += data[date];
        }
    }
    // Bins: Tri annual
    else if (difference <= 365 * 3) {
        // Initialize bins
        for (let i = new Date(earliestDate); i <= latestDate; i.setMonth(i.getMonth() + 4)) {
            let curBin = i.getFullYear()
            if (i.getMonth() <= 3)
                curBin += " Jan-Apr";
            else if (i.getMonth() <= 7)
                curBin += " May-Aug";
            else
                curBin += " Sept-Dec";
            bins[curBin] = 0;
        }
        // Transfer each date to its proper bin
        for (const date in data) {
            const curDate = new Date(date);
            let curBin = curDate.getFullYear()
            if (curDate.getMonth() <= 3)
                curBin += " Jan-Apr";
            else if (curDate.getMonth() <= 7)
                curBin += " May-Aug";
            else
                curBin += " Sept-Dec";
            bins[curBin] += data[date];
        }
    }
    // Bins: Semi Annual
    else if (difference <= 365 * 5) {
        for (let i = new Date(earliestDate); i <= latestDate; i.setMonth(i.getMonth() + 6)) {
            let curBin = i.getFullYear()
            if (i.getMonth() < 6)
                curBin += " Jan-Jun";
            else
                curBin += " Jul-Dec";
            bins[curBin] = 0;
        }
        for (const date in data) {
            const curDate = new Date(date);
            let curBin = curDate.getFullYear()
            if (curDate.getMonth() < 6)
                curBin += " Jan-Jun";
            else
                curBin += " Jul-Dec";
            bins[curBin] += data[date];
        }
    }

    // // Bins: Annual
    // else if (difference <= 365 * 5) {
    //     // Initialize bins
    //     for (let i = 0; earliestDate.getFullYear() + i <= latestDate.getFullYear(); i++)
    //         bins[earliestDate.getFullYear() + i] = 0;
    //     // Transfer each date to its proper bin
    //     for (const date in orderedData) {
    //         const curDate = new Date(date);
    //         bins[curDate.getFullYear()] += orderedData[date];
    //     }
    // }

    // Invalid
    else {
        bins.error = true;
    }

    return bins;
}

module.exports = binAttendance; 