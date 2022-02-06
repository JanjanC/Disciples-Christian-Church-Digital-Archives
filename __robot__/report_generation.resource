*** Settings ***
Documentation       A resource file with reusable keywords and variables
...
...                 Creating system specific keywords from default keywords
...                 from SeleniumLibrary

Library             SeleniumLibrary
Variables           variables.py

*** Keywords ***
Access Report Generation
    Wait Until Page Contains Element    css:*[src="../images/statistics.png"]
    Click Element    css:*[src="../images/statistics.png"]

Has Access To Report Generation
    Element Should Contain    id:statistics-text    Statistical Reports

Has No Access To Report Generation
    Page Should Contain    ERROR 401
    Page Should Contain    Unauthorized Access

Return To Login Page
    Click Element    css:*[data-icon="sign-out-alt"]

Return To Home Page
    Click Element    id:header

Change Date
    Click Button    id:change-date-btn

Is Valid Date
    Element Should Contain    id:error-msg    ${EMPTY}

Is Invalid Date
    Element Should Contain    id:error-msg    Starting date must precede ending date

Greater Than Twenty Years Report
    Element Should Contain    id:error-msg    The date range should not exceed 20 years

Input Start Date
    [Arguments]    ${date}
    Input Text     id:starting-date    ${date}

Input End Date
    [Arguments]    ${date}
    Input Text     id:ending-date    ${date}