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
Navigate to Attendance Main Page From Main Page
    Click Link    css:#attendance>a

Navigate to View Attendance Page From Attendance Main Page
    Click Link    css:#view-attendance>a

Navigate to Add Attendance Page From Attendance Main Page
    Click Link    css:#add-attendance>a

Navigate to Edit Attendance Page From Attendance Main Page
    Click Link    css:#edit-attendance>a

Navigate to Attendance Main Page From View Attendance Page
    Click Element    id:back

Attendance Main Page Should Be Open
    Wait Until Page Contains    View Attendance
    Element Should Contain    id:view-attendance    View Attendance
    Wait Until Page Contains    Add Attendance
    Element Should Contain    id:add-attendance    Add Attendance
    Wait Until Page Contains    Edit Attendance
    Element Should Contain    id:edit-attendance    Edit Attendance

Input Date of Service
    [Arguments]    ${month}    ${day}    ${year}
    Scroll to Element    id:date
    Press Keys    id:date    ${day}    ARROW_LEFT    ARROW_RIGHT    ${month}    ARROW_RIGHT    ${year}

Select Add Non-Member Button
    Scroll To Element    id:add_non_member_button
    Click Button    id:add_non_member_button
    Sleep    0.5s    Wait for Modal to Open

Select Add Member Button
    Scroll To Element    id:add_member_button
    Click Button    id:add_member_button
    Sleep    0.5s    Wait for Modal to Open

Input Non-Member Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:non_member_first_name    ${first}
    Input Text    id:non_member_mid_name    ${middle}
    Input Text    id:non_member_last_name    ${last}
    Click Button    id:add_non_member
    Sleep    0.5s    Wait for Modal to Close

Select Random Member
    Click Element    css:#display_member_div .selectize-input
    Click Element    css:#display_member_div .selectize-dropdown-content>[data-selectable]
    Click Button    id:add_member
    Sleep    0.5s    Wait for Modal to Close

Remove Non-Member
    Scroll To Element    css:#member_row .delGMotherWitnessBtn
    Click Element    css:#member_row .delGMotherWitnessBtn

Remove Member
    Scroll To Element    css:#gfather_witness_row .delGMotherWitnessBtn
    Click Element    css:#gfather_witness_row .delGMotherWitnessBtn

Submit Service Attendance Record
    Scroll to Element    id:create-attendance
    Click Button    id:create-attendance

Input Date of Service to Edit
    [Arguments]    ${month}    ${day}    ${year}
    Sleep    0.5s    Wait for Modal to Open
    Press Keys    id:edit-date    ${year}    ARROW_LEFT    ${month}    ARROW_LEFT    ${day}
    Click Button    id:change-date-btn
    Sleep    0.5s    Wait for Modal to Close

Delete Service Attendance Record
    Scroll To Element    id:delete-button
    Click Element    id:delete-button
    Sleep    0.5s    Wait for Modal to Open
    Click Button    id:delete-attendance-btn
    Sleep    0.5s    Wait for Modal to Close4

Incomplete Non-Member Information Error Should Be Shown
    Element Should Contain    id:empty_names_error    Please accomplish all required fields

Date Exists Error Should Be Shown
    Element Should Contain    id:date-exists-error    This date already exists, please choose a new date.

View Attendance Page Should Be Open
    Wait Until Page Contains    Service Attendance Record
    Element Should Contain    id:title    Service Attendance Record

Add Attendance Page Should Be Open
    Wait Until Page Contains    Add Service Attendance Form
    Element Should Contain    id:title    Add Service Attendance Form

Edit Attendance Page Should Be Open
    Wait Until Page Contains    Edit Service Attendance Form
    Element Should Contain    id:title    Edit Service Attendance Form
