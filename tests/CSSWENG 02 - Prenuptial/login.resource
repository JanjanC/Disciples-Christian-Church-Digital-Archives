*** Settings ***
Documentation     A resource file with reusable keywords and variables
...
...               Creating system specific keywords from default keywords
...               from SeleniumLibrary
Library           SeleniumLibrary
Resource          common.resource
Variables         variables.py

*** Keywords ***
Open Browser to Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

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
    Input Password    password    ${password}

Submit Credentials
    Press Keys    None    RETURN
