/**
 * Helper function to be used when binning dates in attendanceReportController.js.
 * @param orderedData - an object with key-value pairs, where keys are sorted dates in YYYY-mm-dddd format
 */
function binAttendance(orderedData) {
    var bins = {}
    console.log("ORDERED DATE IS " + JSON.stringify(orderedData))
    if (orderedData == null || orderedData == undefined || Object.keys(orderedData).length === 0) {
        bins.error = true;
        return bins;
    }
    // Find year difference of earliest and latest dates
    const dateKeys = Object.keys(orderedData);
    const nKeys = dateKeys.length

    // Obtain only the year from the string
    const earliestYear = parseInt(dateKeys[0].substring(0, 4));
    const latestYear = parseInt(dateKeys[nKeys - 1].substring(0, 4));
    const difference = latestYear - earliestYear;

    

    // Bins: Less than a year
    if (difference == 0) {
        bins = {
            "January": 0,
            "February": 0,
            "March": 0,
            "April": 0,
            "May": 0,
            "June": 0,
            "July": 0,
            "August": 0,
            "September": 0,
            "October": 0,
            "November": 0,
            "December": 0
        };

        // Transfer each date to its proper bin
        let curBinIndex = 0;
        for (const date in orderedData) {
            const curDate = new Date(date);
            if (curDate.getMonth() > curBinIndex) { }
            curBinIndex = curDate.getMonth()
            let curBin = Object.keys(bins)[curBinIndex];
            bins[curBin] += orderedData[date];
        }
    }
    
    // Bins: Semi annual
    else if (difference > 1 && difference <= 5) {
        for (let i = 0; i <= difference; i++) {
            bins[(earliestYear + i) + " Jan-Jun"] = 0;
            bins[(earliestYear + i) + " Jul-Dec"] = 0;
        }
        let curBin = Object.keys(bins)[0];
        for (const date in orderedData) {
            const curDate = new Date(date);
            
            console.log('1st cond: ' + curDate.getFullYear() > parseInt(curBin.split(" ")[0]));
            console.log('2nd cond: ' + curDate.getMonth() >= 6 && curBin.split(" ")[1] == "Jan-Jun");
            console.log('both: ' + curDate.getFullYear() > parseInt(curBin.split(" ")[0]) || (curDate.getMonth() >= 6 && curBin.split(" ")[1] == "Jan-Jun"));

            if (curDate.getFullYear() > parseInt(curBin.split(" ")[0]) || (curDate.getMonth() >= 6 && curBin.split(" ")[1] == "Jan-Jun"))
                curBin = curDate.getFullYear() + ((curDate.getMonth() < 6) ? " Jan-Jun" : " Jul-Dec");

            console.log('curBin: ' + curBin);
            bins[curBin] += orderedData[date];
        }
    }

    // Bins: Annual
    else if (difference > 5 && difference <= 20) {
        for (let i = 0; i <= difference; i++)
            bins[earliestYear + i] = 0;
        let curBin = Object.keys(bins)[0];
        for (const date in orderedData) {
            const curDate = new Date(date);
            if (curDate.getFullYear() > parseInt(curBin.split(" ")[0]))
                curBin = curDate.getFullYear() + "";
            bins[curBin] += orderedData[date];
        }
    }

    // Invalid
    else {
        bins.error = true;
    }

    return bins;
}

module.exports = binAttendance; 