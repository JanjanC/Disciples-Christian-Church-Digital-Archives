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

Navigate to Dedication Page From Forms Main Page
    Click Link    css:#dedication>a

Navigate to Add Dedication Page From Dedication Main Page
    Click Link    id:add-dedication

Navigate to View Dedication Page From Dedication Main Page
    Click Element    class:record

Navigate to Dedication Main Page From View Dedication Page
    Click Element    id:back

Navigate to Edit Dedication Page From View Dedication Page
    Scroll To Element    id:edit_dedication
    Click Button    id:edit_dedication

Select Edit Child Details
    Scroll To Element    id:edit_child
    Click Button    id:edit_child
    Sleep    0.5s    Wait for Modal to Open

Select Edit Parent 1 Details
    Scroll To Element    id:edit_parent_one
    Click Button    id:edit_parent_one
    Sleep    0.5s    Wait for Modal to Open

Select Edit Parent 2 Details
    Scroll To Element    id:edit_parent_two
    Click Button    id:edit_parent_two
    Sleep    0.5s    Wait for Modal to Open

Select Edit Godmother Details
    Scroll To Element    class:edit_female_witness_btn
    Click Button    class:edit_female_witness_btn
    Sleep    0.5s    Wait for Modal to Open

Select Edit Godfather Details
    Scroll To Element    class:edit_male_witness_btn
    Click Button    class:edit_male_witness_btn
    Sleep    0.5s    Wait for Modal to Open

Select Non-Member Child Form
    Scroll To Element    id:child_non_member
    Click Element    id:child_non_member

Select Member Child Form
    Scroll To Element    id:child_member
    Click Element    id:child_member

Input Non-Member Child Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:child_first_name    ${first}
    Input Text    id:child_mid_name    ${middle}
    Input Text    id:child_last_name    ${last}

Select Random Member Child
    Click Element    css:#child_member_div .selectize-input
    Click Element    css:#child_member_div .selectize-dropdown-content>[data-selectable]

Select Non-Member Parent 1 Form
    Scroll To Element    id:parent1_non_member
    Click Element    id:parent1_non_member

Select Member Parent 1 Form
    Scroll To Element    id:parent1_member
    Click Element    id:parent1_member

Input Non-Member Parent 1 Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:parent1_first_name    ${first}
    Input Text    id:parent1_mid_name    ${middle}
    Input Text    id:parent1_last_name    ${last}

Select Random Member Parent 1
    Click Element    css:#parent1_member_div .selectize-input
    Click Element    css:#parent1_member_div .selectize-dropdown-content>[data-selectable]

Select Non-Member Parent 2 Form
    Scroll To Element    id:parent2_non_member
    Click Element    id:parent2_non_member

Select Member Parent 2 Form
    Scroll To Element    id:parent2_member
    Click Element    id:parent2_member

Select No Parent 2 Form
    Scroll To Element    id:parent2_none
    Click Element    id:parent2_none

Input Non-Member Parent 2 Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:parent2_first_name    ${first}
    Input Text    id:parent2_mid_name    ${middle}
    Input Text    id:parent2_last_name    ${last}

Select Random Member Parent 2
    Click Element    css:#parent2_member_div .selectize-input
    Click Element    css:#parent2_member_div .selectize-dropdown-content>[data-selectable]

Input Officiant Details
    [Arguments]    ${officiant}
    Scroll To Element    id:officiant
    Input Text    id:officiant    ${officiant}

Input Address of Dedication
    [Arguments]    ${address}
    Scroll To Element    id:address
    Input Text    id:address    ${address}

Input Date of Dedication
    [Arguments]    ${month}    ${day}    ${year}
    Scroll To Element    id:date
    Press Keys    id:date    ${day}    ARROW_LEFT    ARROW_RIGHT    ${month}    ARROW_RIGHT    ${year}

Select Add Godmother Button
    Scroll To Element    id:add_gmother_button
    Click Button    id:add_gmother_button
    Sleep    0.5s    Wait for Modal to Open

Select Add Godfather Button
    Scroll To Element    id:add_gfather_button
    Click Button    id:add_gfather_button
    Sleep    0.5s    Wait for Modal to Open

Select Non-Member Godmother Form
    Click Button    id:witness_gmother_non_member

Select Member Godmother Form
    Click Button    id:witness_gmother_member

Input Non-Member Godmother Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:witness_gmother_first_name    ${first}
    Input Text    id:witness_gmother_mid_name    ${middle}
    Input Text    id:witness_gmother_last_name    ${last}

Select Random Member Godmother
    Click Element    css:#witness_gmother_member_div .selectize-input
    Click Element    css:#witness_gmother_member_div .selectize-dropdown-content>[data-selectable]

Confirm Add Godmother
    ${godmother}=    Get Godmother Data
    Append to List of Godmothers    ${godmother}
    Click Button    id:add_gmother_witness
    Sleep    0.5s    Wait for Modal to Close

Select Non-Member Godfather Form
    Click Button    id:witness_gfather_non_member

Select Member Godfather Form
    Click Button    id:witness_gfather_member

Input Non-Member Godfather Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:witness_gfather_first_name    ${first}
    Input Text    id:witness_gfather_mid_name    ${middle}
    Input Text    id:witness_gfather_last_name    ${last}

Select Random Member Godfather
    Click Element    css:#witness_gfather_member_div .selectize-input
    Click Element    css:#witness_gfather_member_div .selectize-dropdown-content>[data-selectable]

Confirm Add Godfather
    ${godfather}=    Get Godfather Data
    Append to List of Godfathers    ${godfather}
    Click Button    id:add_gfather_witness
    Sleep    0.5s    Wait for Modal to Close

Remove Godmother
    Remove From List of Godmothers    0
    Scroll To Element    class:delGMotherWitnessBtn
    Click Element    class:delGMotherWitnessBtn

Remove Godfather
    Remove From List of Godfathers    0
    Scroll To Element    class:delGFatherWitnessBtn
    Click Element    class:delGFatherWitnessBtn

Remove Godmother in Edit Dedication Page
    Remove From List of Godmothers    0
    Scroll to Element    class:delete_female_witness_btn
    Click Element    class:delete_female_witness_btn
    Sleep    0.5s    Wait for Modal to Open
    Click Element    id:confirm_delete_witness
    Sleep    0.5s    Wait for Modal to Close

Remove Godfather in Edit Dedication Page
    Remove From List of Godfathers    0
    Scroll to Element    class:delete_male_witness_btn
    Click Element    class:delete_male_witness_btn
    Sleep    0.5s    Wait for Modal to Open
    Click Element    id:confirm_delete_witness
    Sleep    0.5s    Wait for Modal to Close

Submit Dedication Form
    Scroll To Element    id:create-dedication
    Click Button    id:create-dedication

Save Child Detail Changes
    Click Button    id:save_edit_child
    Save Child Data
    Sleep    0.5s    Wait for Modal to Close

Save Parent 1 Detail Changes
    Click Button    id:save_edit_parent_one
    Save Parent 1 Data
    Sleep    0.5s    Wait for Modal to Close

Save Parent 2 Detail Changes
    Click Button    id:save_edit_parent_two
    Save Parent 2 Data
    Sleep    0.5s    Wait for Modal to Close

Save Godmother Detail Changes
    ${godmother}=    Get Godmother Data
    Replace in List of Godmothers    0    ${godmother}
    Click Button    id:add_gmother_witness
    Sleep    0.5s    Wait for Modal to Close

Save Godfather Detail Changes
    ${godfather}=    Get Godfather Data
    Replace in List of Godfathers    0    ${godfather}
    Click Button    id:add_gfather_witness
    Sleep    0.5s    Wait for Modal to Close

Save Dedication Form Changes
    Scroll To Element    id:edit-dedication
    Click Button    id:edit-dedication

Delete Dedication Record
    Scroll To Element    id:delete
    Click Button    id:delete
    Sleep    0.5s    Wait for Modal to Open
    Click Button    id:confirm_delete
    Sleep    0.5s    Wait for Modal to Close

Child Error Should Be Shown
    Element Should Contain    id:child_info_error    Please provide child name

Parent 1 Error Should Be Shown
    Element Should Contain    id:parent1_info_error    Accomplish all fields

Parent 2 Error Should Be Shown
    Element Should Contain    id:parent2_info_error    Accomplish all fields

Officiant Error Should Be Shown
    Element Should Contain    id:officiant_info_error    Please accomplish

Address of Dedication Error Should Be Shown
    Element Should Contain    id:address_info_error    Please accomplish

Date of Dedication Error Should Be Shown
    Element Should Contain    id:date_info_error    Please accomplish

Godmother and Godfather Error Should Be Shown
    Element Should Contain    id:witness_gmother_info_error    There must be at least one godmother or godfather
    Element Should Contain    id:witness_gfather_info_error    There must be at least one godmother or godfather

Godmother Modal Error Should Be Shown
    Element Should Contain    id:witness_gmother_modal_info_error    Please accomplish all fields

Godfather Modal Error Should Be Shown
    Element Should Contain    id:witness_gfather_modal_info_error    Please accomplish all fields

Godmother Maximum Warning Should Be Shown
    Element Should Contain    id:witness_gmother_info_error    You have reached the maximum number of witnesses

Godfather Maximum Warning Should Be Shown
    Element Should Contain    id:witness_gfather_info_error    You have reached the maximum number of witnesses

Save Child Data
    ${child_member}=    Get Radio Button Status    id:child_member
    ${child_non_member}=    Get Radio Button Status    id:child_non_member
    IF    ${child_member}
        ${child}=    Get Value    id:input_child_member
        ${child}=    Extract Member Name    ${child}
    ELSE IF    ${child_non_member}
        ${child_first_name}=    Get Value    id:child_first_name
        ${child_mid_name}=    Get Value    id:child_mid_name
        ${child_last_name}=    Get Value    id:child_last_name
        ${child}=    Create List    ${child_first_name}    ${child_mid_name}    ${child_last_name}
    END
    Set Test Variable    ${child}

Save Parent 1 Data
    ${parent1_member}=    Get Radio Button Status    id:parent1_member
    ${parent1_non_member}=    Get Radio Button Status    id:parent1_non_member
    IF    ${parent1_member}
        ${parent1}=    Get Value    id:input_parent1_member
        ${parent1}=    Extract Member Name    ${parent1}
    ELSE IF    ${parent1_non_member}
        ${parent1_first_name}=    Get Value    id:parent1_first_name
        ${parent1_mid_name}=    Get Value    id:parent1_mid_name
        ${parent1_last_name}=    Get Value    id:parent1_last_name
        ${parent1}=    Create List    ${parent1_first_name}    ${parent1_mid_name}    ${parent1_last_name}
    END
    Set Test Variable    ${parent1}

Save Parent 2 Data
    #Parent 2
    ${parent2_member}=    Get Radio Button Status    id:parent2_member
    ${parent2_non_member}=    Get Radio Button Status    id:parent2_non_member
    ${parent2_none}=    Get Radio Button Status    id:parent2_none
    IF    ${parent2_member}
        ${parent2}=    Get Value    id:input_parent2_member
        ${parent2}=    Extract Member Name    ${parent2}
    ELSE IF    ${parent2_non_member}
        ${parent2_first_name}=    Get Value    id:parent2_first_name
        ${parent2_mid_name}=    Get Value    id:parent2_mid_name
        ${parent2_last_name}=    Get Value    id:parent2_last_name
        ${parent2}=    Create List    ${parent2_first_name}    ${parent2_mid_name}    ${parent2_last_name}
    ELSE IF    ${parent2_none}
        ${parent2}=    Create List    N/A    N/A    N/A
    END
    Set Test Variable    ${parent2}

Get Godmother Data
    #Current Godmother
    ${godmother_member}=    Get Radio Button Status    id:witness_gmother_member
    ${godmother_non_member}=    Get Radio Button Status    id:witness_gmother_non_member
    IF    ${godmother_member}
        ${godmother}=    Get Value    id:input_witness_gmother_member
        ${godmother}=    Extract Member Name    ${godmother}
    ELSE IF    ${godmother_non_member}
        ${godmother_first_name}=    Get Value    id:witness_gmother_first_name
        ${godmother_mid_name}=    Get Value    id:witness_gmother_mid_name
        ${godmother_last_name}=    Get Value    id:witness_gmother_last_name
        ${godmother}=    Create List    ${godmother_first_name}    ${godmother_mid_name}    ${godmother_last_name}
    END
    [Return]    ${godmother}

Get Godfather Data
    #Current Godfather
    ${godfather_member}=    Get Radio Button Status    id:witness_gfather_member
    ${godfather_non_member}=    Get Radio Button Status    id:witness_gfather_non_member
    IF    ${godfather_member}
        ${godfather}=    Get Value    id:input_witness_gfather_member
        ${godfather}=    Extract Member Name    ${godfather}
    ELSE IF    ${godfather_non_member}
        ${godfather_first_name}=    Get Value    id:witness_gfather_first_name
        ${godfather_mid_name}=    Get Value    id:witness_gfather_mid_name
        ${godfather_last_name}=    Get Value    id:witness_gfather_last_name
        ${godfather}=    Create List    ${godfather_first_name}    ${godfather_mid_name}    ${godfather_last_name}
    END
    [Return]    ${godfather}

Replace in List of Godmothers
    [Arguments]    ${index}    ${godmother}
    Save List of Godmothers
    Set List Value    ${godmother_list}    ${index}    ${godmother}

Replace in List of Godfathers
    [Arguments]    ${index}    ${godfather}
    Save List of Godfathers
    Set List Value    ${godfather_list}    ${index}    ${godfather}

Append to List of Godmothers
    [Arguments]    ${godmother}
    Save List of Godmothers
    Append To List    ${godmother_list}    ${godmother}

Append To List of Godfathers
    [Arguments]    ${godfather}
    Save List of Godfathers
    Append To List    ${godfather_list}    ${godfather}

Remove From List of Godmothers
    [Arguments]    ${index}
    Save List of Godmothers
    Remove From List    ${godmother_list}    ${index}

Remove From List of Godfathers
    [Arguments]    ${index}
    Save List of Godfathers
    Remove From List    ${godfather_list}    ${index}

Save List of Godmothers
    #List of Godmothers
    ${godmother_exists}=    Get Variable Value    ${godmother_list}
    IF    ${godmother_exists} == ${None}
        ${godmothers}=    Get WebElements    css:.witness.female
        ${godmother_list}=    Create List
        FOR    ${godmother}    IN    @{godmothers}
            #Locators
            ${godmother_first_name_locator}=    Create List    ${godmother}    class:witness_first_name_view
            ${godmother_mid_name_locator}=    Create List    ${godmother}    class:witness_mid_name_view
            ${godmother_last_name_locator}=    Create List    ${godmother}    class:witness_last_name_view
            #Name
            ${godmother_first_name}=    Get Text    ${godmother_first_name_locator}
            ${godmother_mid_name}=    Get Text    ${godmother_mid_name_locator}
            ${godmother_last_name}=    Get Text    ${godmother_last_name_locator}
            ${godmother}=    Create List    ${godmother_first_name}    ${godmother_mid_name}    ${godmother_last_name}
            Append To List    ${godmother_list}    ${godmother}
        END
        Set Test Variable    ${godmother_list}
    END

Save List of Godfathers
    #List of Godfathers
    ${godfather_exists}=    Get Variable Value    ${godfather_list}
    IF    ${godfather_exists} == ${None}
        ${godfathers}=    Get WebElements    css:.witness.male
        ${godfather_list}=    Create List
        FOR    ${godfather}    IN    @{godfathers}
            #Locators
            ${godfather_first_name_locator}=    Create List    ${godfather}    class:witness_first_name_view
            ${godfather_mid_name_locator}=    Create List    ${godfather}    class:witness_mid_name_view
            ${godfather_last_name_locator}=    Create List    ${godfather}    class:witness_last_name_view
            #Name
            ${godfather_first_name}=    Get Text    ${godfather_first_name_locator}
            ${godfather_mid_name}=    Get Text    ${godfather_mid_name_locator}
            ${godfather_last_name}=    Get Text    ${godfather_last_name_locator}
            ${godfather}=    Create List    ${godfather_first_name}    ${godfather_mid_name}    ${godfather_last_name}
            Append To List    ${godfather_list}    ${godfather}
        END
        Set Test Variable    ${godfather_list}
    END

Save Dedication Form Data
    #Child
    Save Child Data
    #Parent 1
    Save Parent 1 Data
    #Parent 2
    Save Parent 2 Data
    #Officiant
    ${officiant}=    Get Value    id:officiant
    Set Test Variable    ${officiant}
    #Address of Dedication
    ${address}=    Get Value    id:address
    Set Test Variable    ${address}
    #Date of Dedication
    ${date}=    Get Value    id:date
    ${date}=    Format Date    ${date}
    Set Test Variable    ${date}
    #Witnesses
    Save List of Godmothers
    Save List of Godfathers

Save Dedication Form Data in Edit Dedication Page
    #Date of Dedication
    ${date}=    Get Value    id:date
    ${date}=    Format Date    ${date}
    Set Test Variable    ${date}
    #Child
    ${child_exists}=    Get Variable Value    ${child}
    IF    ${child_exists} == ${None}
        ${child_first_name}=    Get Text    id:child_first_name_view
        ${child_mid_name}=    Get Text    id:child_mid_name_view
        ${child_last_name}=    Get Text    id:child_last_name_view
        ${child}=    Create List    ${child_first_name}    ${child_mid_name}    ${child_last_name}
        Set Test Variable    ${child}
    END
    #Parent 1
    ${parent1_exists}=    Get Variable Value    ${parent1}
    IF    ${parent1_exists} == ${None}
        ${parent1_first_name}=    Get Text    id:parent1_first_name_view
        ${parent1_mid_name}=    Get Text    id:parent1_mid_name_view
        ${parent1_last_name}=    Get Text    id:parent1_last_name_view
        ${parent1}=    Create List    ${parent1_first_name}    ${parent1_mid_name}    ${parent1_last_name}
        Set Test Variable    ${parent1}
    END
    #Parent 2
    ${parent2_exists}=    Get Variable Value    ${parent2}
    IF    ${parent2_exists} == ${None}
        ${parent2_first_name}=    Get Text    id:parent2_first_name_view
        ${parent2_mid_name}=    Get Text    id:parent2_mid_name_view
        ${parent2_last_name}=    Get Text    id:parent2_last_name_view
        ${parent2}=    Create List    ${parent2_first_name}    ${parent2_mid_name}    ${parent2_last_name}
        Set Test Variable    ${parent2}
    END
    #Officiant
    ${officiant}=    Get Value    id:officiant
    Set Test Variable    ${officiant}
    #Address of Dedication
    ${address}=    Get Value    id:address
    Set Test Variable    ${address}
    #Witnesses
    Save List of Godmothers
    Save List of Godfathers

View Dedication Page Should Match Form Inputs
    #Date of Dedication
    Element Should Contain    id:dedication_date    ${date}
    #Child
    Element Should Contain    id:child_first_name    ${child[0]}
    Element Should Contain    id:child_mid_name    ${child[1]}
    Element Should Contain    id:child_last_name    ${child[2]}
    #Parent 1
    Element Should Contain    id:parent1_first_name    ${parent1[0]}
    Element Should Contain    id:parent1_mid_name    ${parent1[1]}
    Element Should Contain    id:parent1_last_name    ${parent1[2]}
    #Parent 2
    Element Should Contain    id:parent2_first_name    ${parent2[0]}
    Element Should Contain    id:parent2_mid_name    ${parent2[1]}
    Element Should Contain    id:parent2_last_name    ${parent2[2]}
    #Officiant
    Element Should Contain    id:officiant    ${officiant}
    #Address
    Element Should Contain    id:address    ${address}
    #Godfather
    ${godfather_ctr}=    Set Variable    ${0}
    ${godfathers_elements}=    Get WebElements    css:#godfathers .witness
    ${godfather_length}=    Get Length    ${godfathers_elements}
    Length Should Be    ${godfather_list}    ${godfather_length}
    FOR    ${godfather}    IN    @{godfather_list}
        ${godfather_name}=    Catenate    ${godfather[0]}    ${godfather[1]}.    ${godfather[2]}
        Element Should Contain    ${godfathers_elements[${godfather_ctr}]}    ${godfather_name}
        ${godfather_ctr}=    Evaluate    ${godfather_ctr} + 1
    END
    #Godmother
    ${godmother_ctr}=    Set Variable    ${0}
    ${godmothers_elements}=    Get WebElements    css:#godmothers .witness
    ${godmother_length}=    Get Length    ${godmothers_elements}
    Length Should Be    ${godmother_list}    ${godmother_length}
    FOR    ${godmother}    IN    @{godmother_list}
        ${godmother_name}=    Catenate    ${godmother[0]}    ${godmother[1]}.    ${godmother[2]}
        Element Should Contain    ${godmothers_elements[${godmother_ctr}]}    ${godmother_name}
        ${godmother_ctr}=    Evaluate    ${godmother_ctr} + 1
    END

Forms Main Page Should Be Open
    Wait Until Page Contains    Baptismal Record
    Element Should Contain    id:baptismal    Baptismal Record
    Wait Until Page Contains    Child Dedication
    Element Should Contain    id:dedication    Child Dedication
    Wait Until Page Contains    Prenuptial
    Element Should Contain    id:prenuptial    Prenuptial
    Wait Until Page Contains    Wedding Registry
    Element Should Contain    id:wedding    Wedding Registry

Dedication Main Page Should Be Open
    Wait Until Page Contains    Child Dedication Forms
    Element Should Contain    id:title    Child Dedication Forms

View Dedication Page Should Be Open
    Wait Until Page Contains    View Child Dedication Record
    Element Should Contain    id:title    View Child Dedication Record

Add Dedication Page Should Be Open
    Wait Until Page Contains    Add Child Dedication Form
    Element Should Contain    id:title    Add Child Dedication Form

Edit Dedication Page Should Be Open
    Wait Until Page Contains    Edit Child Dedication Form
    Element Should Contain    id:title    Edit Child Dedication Form
