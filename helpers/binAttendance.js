/**
 * Helper function to be used when binning dates in attendanceReportController.js.
 * @param orderedData - an object with key-value pairs, where keys are sorted dates in YYYY-mm-dddd format
 */
function binAttendance(orderedData) {
    var bins = {}
    if (orderedData == null || orderedData == undefined || Object.keys(orderedData).length === 0) {
        bins.error = true;
        return bins;
    }
    // Find year difference of earliest and latest dates
    const dateKeys = Object.keys(orderedData);

    // Obtain only the year from the string
    const earliestDate = new Date(dateKeys[0]);
    const latestDate = new Date(dateKeys.slice(-1));
    const difference = Math.floor((latestDate - earliestDate) / (1000 * 60 * 60 * 24));

    // Bins: Less than a year
    if (difference <= 365) {
        const months = ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"];

        // Initialize bins
        let ctr = earliestDate;
        ctr.setDate(1);
        let last = latestDate;
        last.setDate(1);
        for (; ctr <= last; ctr.setMonth(ctr.getMonth() + 1))
            bins[months[ctr.getMonth()] + " " + ctr.getFullYear()] = 0;
        
        // Transfer each date to its proper bin
        for (const date in orderedData) {
            const curDate = new Date(date);
            bins[months[curDate.getMonth()] + " " + curDate.getFullYear()] += orderedData[date];
        }
    }
    // Bins: Semi annual
    else if (difference <= 365 * 5) {
        // Initialize bins
        for (let i = 0; earliestDate.getFullYear() + i <= latestDate.getFullYear(); i++) {
            bins[(earliestDate.getFullYear() + i) + " Jan-Jun"] = 0;
            bins[(earliestDate.getFullYear() + i) + " Jul-Dec"] = 0;
        }
        // Transfer each date to its proper bin
        for (const date in orderedData) {
            const curDate = new Date(date);
            let curBin = curDate.getFullYear() + ((curDate.getMonth() < 6) ? " Jan-Jun" : " Jul-Dec");
            bins[curBin] += orderedData[date];
        }
    }

    // Bins: Annual
    else if (difference <= 365 * 5) {
        // Initialize bins
        for (let i = 0; earliestDate.getFullYear() + i <= latestDate.getFullYear(); i++)
            bins[earliestDate.getFullYear() + i] = 0;
        // Transfer each date to its proper bin
        for (const date in orderedData) {
            const curDate = new Date(date);
            bins[curDate.getFullYear()] += orderedData[date];
        }
    }

    // Invalid
    else {
        bins.error = true;
    }

    return bins;
}

module.exports = binAttendance; 