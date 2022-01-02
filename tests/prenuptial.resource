*** Settings ***
Documentation       A resource file with reusable keywords and variables
...
...                 Creating system specific keywords from default keywords
...                 from SeleniumLibrary

Library             SeleniumLibrary
Library             DateTime
Resource            login.resource
Resource            common.resource
Variables           variables.py

*** Keywords ***
Navigate to Forms Main Page From Main Page
    Click Link    css:#registries>a

Navigate to Prenuptial Page From Forms Main Page
    Click Link    css:#prenuptial>a

Navigate to Add Prenuptial Page From Prenuptial Main Page
    Click Link    id:add-prenup

Navigate to View Prenuptial Page From Prenuptial Main Page
    Click Element    class:record

Navigate to Forms Main Page From View Prenuptial Page
    Click Element    id:back

Navigate to Edit Prenuptial Page
    Click Button    id:edit_prenup

Select Edit Bride Details
    Click Button    edit_bride

Select Edit Groom Details
    Click Button    edit_groom

Select Non-Member Bride Form
    Scroll To Element    id:bride_non_member
    Click Element    id:bride_non_member

Select Member Bride Form
    Scroll To Element    id:bride_member
    Click Element    id:bride_member

Select Non-Member Groom Form
    Scroll To Element    id:groom_non_member
    Click Element    id:groom_non_member

Select Member Groom Form
    Scroll To Element    id:groom_member
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

Select Random Member Bride
    Click Element    css:#bride_member_div .selectize-input
    Click Element    css:#bride_member_div .selectize-dropdown-content>[data-selectable]

Select Random Member Groom
    Click Element    css:#groom_member_div .selectize-input
    Click Element    css:#groom_member_div .selectize-dropdown-content>[data-selectable]

Input Current Date
    [Arguments]    ${month}    ${day}    ${year}
    Scroll To Element    id:current_date
    Press Keys    id:current_date    ${day}    ARROW_LEFT    ARROW_RIGHT    ${month}    ARROW_RIGHT    ${year}

Input Wedding Date
    [Arguments]    ${month}    ${day}    ${year}
    Scroll To Element    id:wedding_date
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

Delete Prenuptial Record
    Scroll To Element    id:delete_prenup
    Click Button    id:delete_prenup
    Sleep    0.5s    Wait for Modal to Open
    Click Button    id:confirm_delete
    Sleep    0.5s    Wait for Modal to Close

Bride Information Error Should Be Shown
    Element Should Contain    id:bride_info_error    Accomplish all fields

Groom Information Error Should Be Shown
    Element Should Contain    id:groom_info_error    Accomplish all fields

Wedding Date Error Should Be Shown
    Element Should Contain    id:wedding_date_error    Wedding date should not be earlier than current date

Forms Main Page Should Be Open
    Wait Until Page Contains    Baptismal Record
    Element Should Contain    id:baptismal    Baptismal Record
    Wait Until Page Contains    Child Dedication
    Element Should Contain    id:dedication    Child Dedication
    Wait Until Page Contains    Prenuptial
    Element Should Contain    id:prenuptial    Prenuptial
    Wait Until Page Contains    Wedding Registry
    Element Should Contain    id:wedding    Wedding Registry

Prenuptial Main Page Should Be Open
    Wait Until Page Contains    Prenuptial Forms
    Element Should Contain    id:title    Prenuptial Forms

View Prenuptial Page Should Be Open
    Wait Until Page Contains    View Prenuptial Record
    Element Should Contain    id:title    View Prenuptial Record

Add Prenuptial Page Should Be Open
    Wait Until Page Contains    Add Prenuptial Form
    Element Should Contain    id:title    Add Prenuptial Form

Edit Prenuptial Page Should Be Open
    Wait Until Page Contains    Edit Prenuptial Form
    Element Should Contain    id:title    Edit Prenuptial Form
