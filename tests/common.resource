*** Settings ***
Documentation       A resource file with reusable keywords and variables
...
...                 Creating system specific keywords from default keywords
...                 from SeleniumLibrary

Library             SeleniumLibrary
Library             String
Library             Collections

*** Keywords ***
Extract Member Name
    [Arguments]    ${member}
    ${name}=    Split String    ${member}    ,${SPACE}
    ${name}=    Get Slice From List    ${name}    2    5
    [Return]    ${name}

Format Date
    [Arguments]    ${raw}
    ${date}=    Split String    ${raw}    -
    ${date}=    Catenate    SEPARATOR=/    ${date[1]}    ${date[2]}    ${date[0]}
    [Return]    ${date}

Scroll To Element
    [Arguments]    ${locator}
    ${x}=    Get Horizontal Position    ${locator}
    ${y}=    Get Vertical Position    ${locator}
    Execute Javascript    window.scrollTo({top: ${y}, left: ${x}, behavior: 'instant'})
