*** Settings ***
Documentation     A resource file with reusable keywords and variables
...
...               Creating system specific keywords from default keywords
...               from SeleniumLibrary
Library           SeleniumLibrary
Variables         variables.py

*** Keywords ***
Login Page Should Be Open
    Page Should Contain Element    id: password

Login Level 1 User
    Input Credentials    ${LEVEL_1_PASSWORD}
    Submit Credentials

Login Level 2 User
    Input Credentials    ${LEVEL_2_PASSWORD}
    Submit Credentials

Login Level 3 User
    Input Credentials    ${LEVEL_3_PASSWORD}
    Submit Credentials

Login Invalid User
    Input Credentials    ${INVALID_PASSWORD}
    Submit Credentials

Login Empty User
    Submit Credentials

Input Credentials
    [Arguments]    ${password}
    Input Password    id:password    ${password}

Submit Credentials
    Press Keys    None    RETURN

Open Browser to Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Main Page Should Be Open
    Wait Until Page Contains Element    id:members
    Element Should Be Visible    id:members
    Wait Until Page Contains Element    id:registries
    Element Should Be Visible    id:registries
    #TODO: Add checking of service attendance

Forms Main Page Should Be Open
    Comment
    #TODO: Add code

Error Modal Should Be Shown
    Element Should Be Enabled    errorModal
    #TODO: Implement proper checking of error modal

Unauthorized Access Error Should Be Shown
    Page Should Contain    ERROR 401
    Page Should Contain    Unauthorized Access
