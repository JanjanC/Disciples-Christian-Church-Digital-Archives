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
    Click Button    id:add_gmother_witness
    Sleep    0.5s    Wait for Modal to Close

Select Random Member Godmother
    Click Element    css:#witness_gmother_member_div .selectize-input
    Click Element    css:#witness_gmother_member_div .selectize-dropdown-content>[data-selectable]
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
    Click Button    id:add_gfather_witness
    Sleep    0.5s    Wait for Modal to Close

Select Random Member Godfather
    Click Element    css:#witness_gfather_member_div .selectize-input
    Click Element    css:#witness_gfather_member_div .selectize-dropdown-content>[data-selectable]
    Click Button    id:add_gfather_witness
    Sleep    0.5s    Wait for Modal to Close

Remove Godmother
    Scroll To Element    class:delGMotherWitnessBtn
    Click Element    class:delGMotherWitnessBtn

Remove Godfather
    Scroll To Element    class:delGFatherWitnessBtn
    Click Element    class:delGFatherWitnessBtn

Remove Godmother in Edit Dedication Page
    Scroll to Element    class:delete_female_witness_btn
    Click Element    class:delete_female_witness_btn
    Sleep    0.5s    Wait for Modal to Open
    Click Element    id:confirm_delete_witness
    Sleep    0.5s    Wait for Modal to Close

Remove Godfather in Edit Dedication Page
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
    Sleep    0.5s    Wait for Modal to Close

Save Parent 1 Detail Changes
    Click Button    id:save_edit_parent_one
    Sleep    0.5s    Wait for Modal to Close

Save Parent 2 Detail Changes
    Click Button    id:save_edit_parent_two
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
