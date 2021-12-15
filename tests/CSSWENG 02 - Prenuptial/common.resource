*** Settings ***
Documentation     A resource file with reusable keywords and variables
...
...               Creating system specific keywords from default keywords
...               from SeleniumLibrary
Library           SeleniumLibrary
Variables         variables.py

*** Keywords ***
Login Page Should Be Open
    Page Should Contain Element    password

Main Page Should Be Open
    Wait Until Page Contains Element    xpath://*[@id="maindiv"]/div/div[1]/a/div/div/h5
    Element Text Should Be    xpath://*[@id="maindiv"]/div/div[1]/a/div/div/h5    Members
    Wait Until Page Contains Element    xpath://*[@id="maindiv"]/div/div[2]/a/div/div/h5
    Element Text Should Be    xpath://*[@id="maindiv"]/div/div[2]/a/div/div/h5    Registries
    Wait Until Page Contains Element    xpath://*[@id="maindiv"]/div/div[3]/a/div/div/h5
    Element Text Should Be    xpath://*[@id="maindiv"]/div/div[3]/a/div/div/h5    Service attendance

Prenuptial Page Should Be Open

Error Modal Shown
    Element Should Be Enabled    errorModal
