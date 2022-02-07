*** Settings ***
Documentation     A resource file with reusable keywords and variables
...
...               Creating system specific keywords from default keywords
...               from SeleniumLibrary
Library           SeleniumLibrary
Library           DateTime
Resource          login.resource
Resource          common.resource
Variables         variables.py

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
    Press Keys    id:date    ${month}    ${day}    ${year}

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

Select Random Member
    Click Element    css:#display_member_div .selectize-input
    Click Element    css:#display_member_div .selectize-dropdown-content>[data-selectable]

Confirm Add Non-Member
    ${non_member}=    Get Non-Member Data
    Append To List of Non-Members    ${non_member}
    Click Button    id:add_non_member
    Sleep    0.5s    Wait for Modal to Close

Confirm Add Member
    ${member}=    Get Member Data
    Append To List of Members    ${member}
    Click Button    id:add_member
    Sleep    0.5s    Wait for Modal to Close

Remove Non-Member
    Remove From List of Non-Members    0
    Scroll To Element    css:#non_member_row .delNonMemberBtn
    Click Element    css:#non_member_row .delNonMemberBtn

Remove Member
    Remove From List of Members    0
    Scroll To Element    css:#member_row .delMemberBtn
    Click Element    css:#member_row .delMemberBtn

Submit Service Attendance Record
    Scroll to Element    id:create-attendance
    Click Button    id:create-attendance

Input Date of Service to Edit
    [Arguments]    ${month}    ${day}    ${year}
    Sleep    0.5s    Wait for Modal to Open
    Press Keys    id:edit-date    ${year}    ARROW_LEFT    ${day}    ARROW_LEFT    ARROW_LEFT    ${month}
    Click Button    id:change-date-btn
    Sleep    0.5s    Wait for Modal to Close

Delete Service Attendance Record
    Scroll To Element    id:delete-button
    Click Element    id:delete-button
    Sleep    0.5s    Wait for Modal to Open
    Click Button    id:delete-attendance-btn
    Sleep    0.5s    Wait for Modal to Close

Incomplete Non-Member Information Error Should Be Shown
    Element Should Contain    id:empty_names_error    Please accomplish all required fields

Date Exists Error Should Be Shown
    Element Should Contain    id:date-exists-error    This date already exists, please choose a new date.

Get Non-Member Data
    ${non_member_first_name}=    Get Value    id:non_member_first_name
    ${non_member_mid_name}=    Get Value    id:non_member_mid_name
    ${non_member_last_name}=    Get Value    id:non_member_last_name
    ${non_member}=    Create List    ${non_member_first_name}    ${non_member_mid_name}    ${non_member_last_name}
    [Return]    ${non_member}

Get Member Data
    ${member}=    Get Value    id:input_member
    ${member}=    Extract Member Name    ${member}
    [Return]    ${member}

Append To List of Non-Members
    [Arguments]    ${non_member}
    Save List of Non-Members
    Append To List    ${non_member_list}    ${non_member}

Append to List of Members
    [Arguments]    ${member}
    Save List of Members
    Append To List    ${member_list}    ${member}

Remove From List of Non-Members
    [Arguments]    ${index}
    Save List of Non-Members
    Remove From List    ${non_member_list}    ${index}
    Log To Console    Non-Members List Haha
    Log To Console    ${non_member_list}

Remove From List of Members
    [Arguments]    ${index}
    Save List of Members
    Remove From List    ${member_list}    ${index}
    Log To Console    Members List Haha
    Log To Console    ${member_list}

Save List of Non-Members
    #List of Non-Members
    ${non_member_exists}=    Get Variable Value    ${non_member_list}
    IF    ${non_member_exists} == ${None}
        ${non_members}=    Get WebElements    class:non-member
        ${non_member_list}=    Create List
        FOR    ${non_member}    IN    @{non_members}
            #Locators
            ${non_member_first_name_locator}=    Create List    ${non_member}    class:first_name
            ${non_member_mid_name_locator}=    Create List    ${non_member}    class:mid_name
            ${non_member_last_name_locator}=    Create List    ${non_member}    class:last_name
            #Name
            ${non_member_first_name}=    Get Text    ${non_member_first_name_locator}
            ${non_member_mid_name}=    Get Text    ${non_member_mid_name_locator}
            ${non_member_last_name}=    Get Text    ${non_member_last_name_locator}
            ${non_member}=    Create List    ${non_member_first_name}    ${non_member_mid_name}
            ...    ${non_member_last_name}
            Log To Console    ${non_member}
            Append To List    ${non_member_list}    ${non_member}
        END
        Log To Console    ${non_member_list}
        Set Test Variable    ${non_member_list}
    END

Save List of Members
    #List of Members
    ${member_exists}=    Get Variable Value    ${member_list}
    IF    ${member_exists} == ${None}
        ${members}=    Get WebElements    class:member
        ${member_list}=    Create List
        FOR    ${member}    IN    @{members}
            #Locators
            ${member_first_name_locator}=    Create List    ${member}    class:first_name
            ${member_mid_name_locator}=    Create List    ${member}    class:mid_name
            ${member_last_name_locator}=    Create List    ${member}    class:last_name
            #Name
            ${member_first_name}=    Get Text    ${member_first_name_locator}
            ${member_mid_name}=    Get Text    ${member_mid_name_locator}
            ${member_last_name}=    Get Text    ${member_last_name_locator}
            ${member}=    Create List    ${member_first_name}    ${member_mid_name}    ${member_last_name}
            Log To Console    ${member}
            Append To List    ${member_list}    ${member}
        END
        Log To Console    ${member_list}
        Set Test Variable    ${member_list}
    END

Save Attendance Form Data
    #Date of Service
    ${date}=    Get Value    id:date
    ${date}=    Convert Date to String    ${date}
    Set Test Variable    ${date}
    #Members
    Save List of Members
    #Non-Members
    Save List of Non-Members

Save Attendance Form Data in Edit Attendance Page
    #Date of Service
    ${date}=    Get Value    id:date
    ${date}=    Convert Date to String    ${date}
    Set Test Variable    ${date}
    Log To Console    ${date}
    #Witnesses
    Save List of Members
    Save List of Non-Members

View Attendance Page Should Match Form Inputs
    #Date of Service
    Element Should Contain    id:curr_date    ${date}
    #Member
    ${member_ctr}=    Set Variable    ${0}
    ${members_elements}=    Get WebElements    class:member
    Log To Console    ${members_elements}
    ${member_length}=    Get Length    ${members_elements}
    Length Should Be    ${member_list}    ${member_length}
    FOR    ${member}    IN    @{member_list}
        ${member_name}=    Catenate    ${member[0]}    ${member[2]}
        Element Should Contain    ${members_elements[${member_ctr}]}    ${member_name}
        ${member_ctr}=    Evaluate    ${member_ctr} + 1
        Log To Console    ${member_name}
    END
    #Non Member
    ${non_member_ctr}=    Set Variable    ${0}
    ${non_members_elements}=    Get WebElements    class:non-member
    ${non_member_length}=    Get Length    ${non_members_elements}
    Length Should Be    ${non_member_list}    ${non_member_length}
    FOR    ${non_member}    IN    @{non_member_list}
        ${non_member_name}=    Catenate    ${non_member[0]}    ${non_member[2]}
        Element Should Contain    ${non_members_elements[${non_member_ctr}]}    ${non_member_name}
        ${non_member_ctr}=    Evaluate    ${non_member_ctr} + 1
        Log To Console    ${non_member_name}
    END

View Attendance Page Should Be Open
    Wait Until Page Contains    Service Attendance Record
    Element Should Contain    id:title    Service Attendance Record

Add Attendance Page Should Be Open
    Wait Until Page Contains    Add Service Attendance Form
    Element Should Contain    id:title    Add Service Attendance Form

Edit Attendance Page Should Be Open
    Wait Until Page Contains    Edit Service Attendance Form
    Element Should Contain    id:title    Edit Service Attendance Form
