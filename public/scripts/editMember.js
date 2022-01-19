$(document).ready(function () {


    if (screen.width <= 1000) {
        triggerResponsiveScreen();
    }

    window.onresize = function () {
        triggerResponsiveScreen();
    }
    
    function triggerResponsiveScreen() {
        if (screen.width <= 1000) {
            $("#name-div").removeClass('row')
            $("#member-status-div").removeClass('row')
            $("#occupation-col-div").removeClass('col')
            $("#workplace-div").removeClass('row')
            $("#education-div").removeClass('row')
            $("#address-line-1").removeClass('row')
            $("#educ-attain-col").css('margin-bottom','10px')
            $("#workplace-col").css('margin-bottom', '10px')
        }
        else {
            $("#name-div").addClass('row')
            $("#member-status-div").addClass('row')
            $("#occupation-col-div").addClass('col')
            $("#workplace-div").addClass('row')
            $("#education-div").addClass('row')
            $("#address-line-1").addClass('row')
            $("#educ-attain-col").css('margin-bottom', '0px')
            $("#workplace-col").css('margin-bottom', '0px')
        }
    }

});