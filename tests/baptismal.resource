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

Navigate to Baptismal Page From Forms Main Page
    Click Link    css:#baptismal>a

Navigate to Add Baptismal Page From Baptismal Main Page
    Click Link    id:add-baptismal

Navigate to View Baptismal Page From Baptismal Main Page
    Click Element    class:record

Navigate to Baptismal Main Page From View Baptismal Page
    Click Element    id:back

Navigate to Edit Baptismal Page From View Baptismal Page
    Scroll To Element    id:edit_baptismal
    Click Button    id:edit_baptismal

Select Edit Member Details
    Scroll To Element    id:edit_member
    Click Button    id:edit_member
    Sleep    0.5s    Wait for Modal to Open

Select Edit Officiant Details
    Scroll To Element    id:edit_officiant
    Click Button    id:edit_officiant
    Sleep    0.5s    Wait for Modal to Open

Select Random Member for Baptism
    Click Element    css:#member_div .selectize-input
    Click Element    css:#member_div .selectize-dropdown-content>[data-selectable]

Input Baptism Location
    [Arguments]    ${location}
    Scroll To Element    id:location
    Input Text    id:location    ${location}

Input Baptism Date
    [Arguments]    ${month}    ${day}    ${year}
    Scroll To Element    id:date
    Press Keys    id:date    ${day}    ARROW_LEFT    ARROW_RIGHT    ${month}    ARROW_RIGHT    ${year}

Select Non-Member Officiant Form
    Scroll To Element    id:officiant_non_member
    Click Element    id:officiant_non_member

Select Member Officiant Form
    Scroll To Element    id:officiant_member
    Click Element    id:officiant_member

Input Non Member Officiant Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:officiant_first_name    ${first}
    Input Text    id:officiant_mid_name    ${middle}
    Input Text    id:officiant_last_name    ${last}

Select Random Member Officiant
    Click Element    css:#officiant_member_div .selectize-input
    Click Element    css:#officiant_member_div .selectize-dropdown-content>[data-selectable]

Submit Baptismal Form
    Scroll To Element    id:create-baptismal
    Click Button    id:create-baptismal

Save Member Detail Changes
    Save Member Data in Edit Baptismal Page
    Click Button    id:save_edit_member
    Sleep    0.5s    Wait for Modal to Close

Save Officiant Detail Changes
    Save Officiant Data in Edit Baptismal Page
    Click Button    id:save_edit_officiant
    Sleep    0.5s    Wait for Modal to Close

Save Baptismal Form Changes
    Scroll To Element    id:edit-baptismal
    Click Button    id:edit-baptismal

Delete Baptismal Record
    Scroll To Element    id:delete-baptismal
    Click Button    id:delete-baptismal
    Sleep    0.5s    Wait for Modal to Open
    Click Button    id:confirm_delete
    Sleep    0.5s    Wait for Modal to Close

Member for Baptism Error Should Be Shown
    Element Should Contain    id:member_error    Please select member

Baptism Location Error Should Be Shown
    Element Should Contain    id:location_error    Please add location

Baptism Date Error Should Be Shown
    Element Should Contain    id:date_error    Please add date

Non-Member Officiant Error Should Be Shown
    Element Should Contain    id:officiant_error    Please fill up all fields

Non-Member Officiant Middle Initial Error Should Be Shown
    Element Should Contain    id:officiant_error    Middle initial should only contain one letter

Member Officiant Error Should Be Shown
    Element Should Contain    id:officiant_error    Please select member

Save Baptismal Form Data
    #Member
    ${member}=    Get Value    id:input_member
    ${member}=    Extract Member Name    ${member}
    Set Test Variable    ${member}
    #Location
    ${location}=    Get Value    id:location
    Set Test Variable    ${location}
    #Date
    ${date}=    Get Value    id:date
    ${date}=    Format Date    ${date}
    Set Test Variable    ${date}
    #Officiant
    ${officiant_visible}=    Run Keyword And Return Status    Element Should Be Visible    id:officiant_member_div
    IF    ${officiant_visible}
        ${officiant}=    Get Value    id:input_officiant_member
        ${officiant}=    Extract Member Name    ${officiant}
    ELSE
        ${officiant_first_name}=    Get Value    id:officiant_first_name
        ${officiant_mid_name}=    Get Value    id:officiant_mid_name
        ${officiant_last_name}=    Get Value    id:officiant_last_name
        ${officiant}=    Create List    ${officiant_first_name}    ${officiant_mid_name}    ${officiant_last_name}
    END
    Set Test Variable    ${officiant}

Save Member Data in Edit Baptismal Page
    ${member}=    Get Value    id:input_member
    ${member}=    Extract Member Name    ${member}
    Set Test Variable    ${member}

Save Officiant Data in Edit Baptismal Page
    ${officiant_visible}=    Run Keyword And Return Status    Element Should Be Visible    id:officiant_member_div
    IF    ${officiant_visible}
        ${officiant}=    Get Value    id:input_officiant_member
        ${officiant}=    Extract Member Name    ${officiant}
    ELSE
        ${officiant_first_name}=    Get Value    id:officiant_first_name
        ${officiant_mid_name}=    Get Value    id:officiant_mid_name
        ${officiant_last_name}=    Get Value    id:officiant_last_name
        ${officiant}=    Create List    ${officiant_first_name}    ${officiant_mid_name}    ${officiant_last_name}
    END
    Set Test Variable    ${officiant}

Save Baptismal Form Data in Edit Baptismal Page
    #Member
    Log To Console    ${member}
    ${member_exists}=    Get Variable Value    ${member}
    IF    ${member_exists} == ${None}
        ${member_first_name}=    Get Text    id:member_first_name_view
        ${member_mid_name}=    Get Text    id:member_mid_name_view
        ${member_last_name}=    Get Text    id:member_last_name_view
        ${member}=    Create List    ${member_first_name}    ${member_mid_name}    ${member_last_name}
        Set Test Variable    ${member}
        Log To Console    Member Var No Exist
        Log To Console    ${member}
    END
    #Location
    ${location}=    Get Value    id:location
    Set Test Variable    ${location}
    #Date
    ${date}=    Get Value    id:date
    ${date}=    Format Date    ${date}
    Set Test Variable    ${date}
    #Officiant
    Log To Console    ${officiant}
    ${officiant_exists}=    Get Variable Value    ${officiant}
    IF    ${officiant_exists} == ${None}
        ${officiant_first_name}=    Get Text    id:officiant_first_name_view
        ${officiant_mid_name}=    Get Text    id:officiant_mid_name_view
        ${officiant_last_name}=    Get Text    id:officiant_last_name_view
        ${officiant}=    Create List    ${officiant_first_name}    ${officiant_mid_name}    ${officiant_last_name}
        Set Test Variable    ${officiant}
        Log To Console    Off Var No Exist
    END

View Baptismal Page Should Match Form Inputs
    #Date
    Element Should Contain    id:date    ${date}
    #Member
    Element Should Contain    id:member_first_name    ${member[0]}
    Element Should Contain    id:member_mid_name    ${member[1]}
    Element Should Contain    id:member_last_name    ${member[2]}
    #Officiant
    Element Should Contain    id:officiant_first_name    ${officiant[0]}
    Element Should Contain    id:officiant_mid_name    ${officiant[1]}
    Element Should Contain    id:officiant_last_name    ${officiant[2]}
    #Location
    Element Should Contain    id:place    ${location}

Forms Main Page Should Be Open
    Wait Until Page Contains    Baptismal Record
    Element Should Contain    id:baptismal    Baptismal Record
    Wait Until Page Contains    Child Dedication
    Element Should Contain    id:dedication    Child Dedication
    Wait Until Page Contains    Prenuptial
    Element Should Contain    id:prenuptial    Prenuptial
    Wait Until Page Contains    Wedding Registry
    Element Should Contain    id:wedding    Wedding Registry

Baptismal Main Page Should Be Open
    Wait Until Page Contains    Baptismal Record
    Element Should Contain    id:title    Baptismal Record

View Baptismal Page Should Be Open
    Wait Until Page Contains    View Baptismal Record
    Element Should Contain    id:title    View Baptismal Record

Add Baptismal Page Should Be Open
    Wait Until Page Contains    Add Baptismal Record
    Element Should Contain    id:title    Add Baptismal Record

Edit Baptismal Page Should Be Open
    Wait Until Page Contains    Edit Baptismal Record
    Element Should Contain    id:title    Edit Baptismal Record
