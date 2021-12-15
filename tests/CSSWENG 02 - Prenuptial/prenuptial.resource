*** Settings ***
Documentation     A resource file with reusable keywords and variables
...
...               Creating system specific keywords from default keywords
...               from SeleniumLibrary
Library           SeleniumLibrary
Resource          common.resource
Resource          login.resource
Variables         variables.py

*** Keywords ***
Navigate to Create Prenuptial Main Page
    Click Link    xpath://*[@id="maindiv"]/div/div[2]/a
