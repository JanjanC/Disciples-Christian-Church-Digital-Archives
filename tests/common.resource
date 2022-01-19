*** Settings ***
Documentation       A resource file with reusable keywords and variables
...
...                 Creating system specific keywords from default keywords
...                 from SeleniumLibrary

Library             SeleniumLibrary
Library             String
Library             Collections

*** Keywords ***
Scroll To Element
    [Arguments]    ${locator}
    ${x}=    Get Horizontal Position    ${locator}
    ${y}=    Get Vertical Position    ${locator}
    Execute Javascript    window.scrollTo({top: ${y}, left: ${x}, behavior: 'instant'})

Get Radio Button Status
    [Arguments]    ${locator}
    ${checked}=    Get Element Attribute    ${locator}    checked
    ${checked}=    Set Variable If
    ...    '${checked}'=='true'    ${True}
    ...    ${checked}==${None}    ${False}
    [Return]    ${checked}

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

Get Child WebElements
    [Arguments]    ${locator}

    ${element}=    Get WebElement    ${locator}
    ${children}=    Call Method
    ...    ${element}
    ...    find_elements
    ...    by=xpath    value=child::*

    [Return]    ${children}
