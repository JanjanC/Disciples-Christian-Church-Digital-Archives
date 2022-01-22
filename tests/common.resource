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

Convert Date to String
    [Arguments]    ${raw}
    ${date}=    Split String    ${raw}    -
    ${month}=    Set Variable If
    ...    '${date[1]}'=='01'    January
    ...    '${date[1]}'=='02'    February
    ...    '${date[1]}'=='03'    March
    ...    '${date[1]}'=='04'    April
    ...    '${date[1]}'=='05'    May
    ...    '${date[1]}'=='06'    June
    ...    '${date[1]}'=='07'    July
    ...    '${date[1]}'=='08'    August
    ...    '${date[1]}'=='09'    September
    ...    '${date[1]}'=='10'    October
    ...    '${date[1]}'=='11'    November
    ...    '${date[1]}'=='12'    December
    ${date}=    Catenate    ${month}    ${date[2]},    ${date[0]}
    [Return]    ${date}

Get Child WebElements
    [Arguments]    ${locator}

    ${element}=    Get WebElement    ${locator}
    ${children}=    Call Method
    ...    ${element}
    ...    find_elements
    ...    by=xpath    value=child::*

    [Return]    ${children}
