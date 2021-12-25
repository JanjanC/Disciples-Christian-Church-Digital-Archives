*** Settings ***
Documentation     A resource file with reusable keywords and variables
...
...               Creating system specific keywords from default keywords
...               from SeleniumLibrary
Library           SeleniumLibrary
Library           DateTime
Resource          login.resource
Variables         variables.py

*** Keywords ***
Navigate to Prenuptial Page
    Click Link    css:#registries > a
    Click Link    css:#prenuptial > a

Navigate to Prenuptial Main Page
    Click Link    css:#registries > a
    Click Link    css:#prenuptial > a

Navigate to Create Prenuptial Page From Prenuptial Main Page
    Click Link    id:add-prenup

Navigate to View Prenuptial Page From Prenuptial Main Page
    Click Element    class:record

Navigate to Edit Prenuptial Page
    Click Button    id:edit_prenup

Select Edit Bride Details
    Click Button    edit_bride

Select Edit Groom Details
    Click Button    edit_groom

Select Non-Member Bride Form
    Click Element    id:bride_non_member

Select Member Bride Form
    Click Element    id:bride_member

Select Non-Member Groom Form
    Click Element    id:groom_non_member

Select Member Groom Form
    Click Element    id:groom_member

Input Non Member Bride Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:bride_first_name    ${first}
    Input Text    id:bride_mid_name    ${middle}
    Input Text    id:bride_last_name    ${last}

Input Non Member Groom Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:groom_first_name    ${first}
    Input Text    id:groom_mid_name    ${middle}
    Input Text    id:groom_last_name    ${last}

Input Current Date
    [Arguments]    ${month}    ${day}    ${year}
    Press Keys    id:current_date    ${day}    ARROW_LEFT    ARROW_RIGHT    ${month}    ARROW_RIGHT    ${year}

Input Wedding Date
    [Arguments]    ${month}    ${day}    ${year}
    Press Keys    id:wedding_date    ${day}    ARROW_LEFT    ARROW_RIGHT    ${month}    ARROW_RIGHT    ${year}

Submit Prenuptial Form
    Click Button    id:create-prenup

Save Bride Detail Changes
    Click Button    id:save_bride_btn

Save Groom Detail Changes
    Click Button    id:save_groom_btn

Save Prenuptial Form Changes
    Click Button    id:save_changes
    Click Button    id:edit-prenup

Bride Information Error Should Be Shown
    Element Should Contain    id:bride_info_error    Accomplish all fields

Groom Information Error Should Be Shown
    Element Should Contain    id:groom_info_error    Accomplish all fields

Wedding Date Error Should Be Shown
    Element Should Contain    id:wedding_date_error    Wedding date should not be earlier than current date

Prenuptial Main Page Should Be Open
    Element Should Contain    id:title    Prenuptial Forms

View Prenuptial Page Should Be Open
    Element Should Contain    id:title    View Prenuptial Record

Add Prenuptial Page Should Be Open
    Element Should Contain    id:title    Add Prenuptial Form

Edit Prenuptial Page Should Be Open
    Element Should Contain    id:title    Edit Prenuptial Form
