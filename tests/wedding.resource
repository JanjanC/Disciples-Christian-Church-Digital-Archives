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

Navigate to Wedding Page From Forms Main Page
    Click Link    css:#wedding>a

Navigate to Add Wedding Page From Wedding Main Page
    Click Link    id:add-wedding

Navigate to View Wedding Page From Wedding Main Page
    Click Element    class:record

Navigate to Wedding Main Page From View Wedding Page
    Click Element    id:back

Select Non-Member Bride Form
    Scroll To Element    id:bride_non_member
    Click Element    id:bride_non_member

Select Member Bride Form
    Scroll To Element    id:bride_member
    Click Element    id:bride_member

Input Non-Member Bride Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:bride_first_name    ${first}
    Input Text    id:bride_mid_name    ${middle}
    Input Text    id:bride_last_name    ${last}

Select Random Member Bride
    Click Element    css:#bride_member_div .selectize-input
    Click Element    css:#bride_member_div .selectize-dropdown-content>[data-selectable]

Select Non-Member Groom Form
    Scroll To Element    id:groom_non_member
    Click Element    id:groom_non_member

Select Member Groom Form
    Scroll To Element    id:groom_member
    Click Element    id:groom_member

Input Non-Member Groom Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:groom_first_name    ${first}
    Input Text    id:groom_mid_name    ${middle}
    Input Text    groom_last_name    ${last}

Select Random Member Groom
    Click Element    css:#groom_member_div .selectize-input
    Click Element    css:#groom_member_div .selectize-dropdown-content>[data-selectable]

Select Non-Member Bride Mother Form
    Scroll to Element    id:bride_mother_non_member
    Click Element    id:bride_mother_non_member

Select Member Bride Mother Form
    Scroll to Element    id:bride_mother_member
    Click Element    id:bride_mother_member

Select No Bride Mother Form
    Scroll to Element    id:bride_mother_none
    Click Element    id:bride_mother_none

Input Non-Member Bride Mother Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:bride_mother_first_name    ${first}
    Input Text    id:bride_mother_mid_name    ${middle}
    Input Text    id:bride_mother_last_name    ${last}

Select Random Member Bride Mother
    Click Element    css:#bride_mother_member_div .selectize-input
    Click Element    css:#bride_mother_member_div .selectize-dropdown-content>[data-selectable]

Select Non-Member Bride Father Form
    Scroll to Element    id:bride_father_non_member
    Click Element    id:bride_father_non_member

Select Member Bride Father Form
    Scroll to Element    id:bride_father_member
    Click Element    id:bride_father_member

Select No Bride Father Form
    Scroll to Element    id:bride_father_none
    Click Element    id:bride_father_none

Input Non-Member Bride Father Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:bride_father_first_name    ${first}
    Input Text    id:bride_father_mid_name    ${middle}
    Input Text    id:bride_father_last_name    ${last}

Select Random Member Bride Father
    Click Element    css:#bride_father_member_div .selectize-input
    Click Element    css:#bride_father_member_div .selectize-dropdown-content>[data-selectable]

Select Non-Member Groom Mother Form
    Scroll to Element    id:groom_mother_non_member
    Click Element    id:groom_mother_non_member

Select Member Groom Mother Form
    Scroll to Element    id:groom_mother_member
    Click Element    id:groom_mother_member

Select No Groom Mother Form
    Scroll to Element    id:groom_mother_none
    Click Element    id:groom_mother_none

Input Non-Member Groom Mother Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:groom_mother_first_name    ${first}
    Input Text    id:groom_mother_mid_name    ${middle}
    Input Text    id:groom_mother_last_name    ${last}

Select Random Member Groom Mother
    Click Element    css:#groom_mother_member_div .selectize-input
    Click Element    css:#groom_mother_member_div .selectize-dropdown-content>[data-selectable]

Select Non-Member Groom Father Form
    Scroll to Element    id:groom_father_non_member
    Click Element    id:groom_father_non_member

Select Member Groom Father Form
    Scroll to Element    id:groom_father_member
    Click Element    id:groom_father_member

Select No Groom Father Form
    Scroll to Element    id:groom_father_none
    Click Element    id:groom_father_none

Input Non-Member Groom Father Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:groom_father_first_name    ${first}
    Input Text    id:groom_father_mid_name    ${middle}
    Input Text    id:groom_father_last_name    ${last}

Select Random Member Groom Father
    Click Element    css:#groom_father_member_div .selectize-input
    Click Element    css:#groom_father_member_div .selectize-dropdown-content>[data-selectable]

Input Wedding Location
    [Arguments]    ${location}
    Scroll to Element    id:location
    Input Text    id:location    ${location}

Input Wedding Date
    [Arguments]    ${month}    ${day}    ${year}
    Scroll to Element    id:current_date
    Press Keys    id:current_date    ${day}    ARROW_LEFT    ARROW_RIGHT    ${month}    ARROW_RIGHT    ${year}

Input Officiant Details
    [Arguments]    ${officiant}
    Scroll to Element    id:officiant
    Input Text    id:officiant    ${officiant}

Input Solemnizing Officer Details
    [Arguments]    ${solemnizer}
    Scroll to Element    id:solemnizer
    Input Text    id:solemnizer    ${solemnizer}

Input Contract Number
    [Arguments]    ${contract}
    Scroll to Element    id:contract
    Input Text    id:contract    ${contract}

Select Add Godmother Button
    Scroll to Element    id:add_gmother_button
    Click Button    id:add_gmother_button

Select Add Godfather Button
    Scroll to Element    id:add_gfather_button
    Click Button    id:add_gfather_button

Select Non-Member Godmother Form
    Scroll to Element    id:add_gmother_button
    Click Button    id:add_gmother_button
    Sleep    0.5s    Wait for Modal to Open
    Click Button    id:witness_gmother_non_member

Select Member Godmother Form
    Scroll to Element    id:add_gmother_button
    Click Button    id:add_gmother_button
    Sleep    0.5s    Wait for Modal to Open
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
    Scroll to Element    id:add_gfather_button
    Click Button    id:add_gfather_button
    Sleep    0.5s    Wait for Modal to Open
    Click Button    id:witness_gfather_non_member

Select Member Godfather Form
    Scroll to Element    id:add_gfather_button
    Click Button    id:add_gfather_button
    Sleep    0.5s    Wait for Modal to Open
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
    Scroll to Element    class:delGMotherWitnessBtn
    Click Element    class:delGMotherWitnessBtn

Remove Godfather
    Scroll to Element    class:delGFatherWitnessBtn
    Click Element    class:delGFatherWitnessBtn

Submit Wedding Registry
    Scroll to Element    id:create-wedding-registry
    Click Button    id:create-wedding-registry

Delete Wedding Record
    Scroll to Element    id:delete_wedding
    Click Button    id:delete_wedding
    Sleep    0.5s    Wait for Modal to Open
    Click Button    id:confirm_delete
    Sleep    0.5s    Wait for Modal to Close

Bride Error Should Be Shown
    Element Should Contain    id:bride_info_error    Please provide bride name

Groom Error Should Be Shown
    Element Should Contain    id:groom_info_error    Please provide groom name

Bride Mother Error Should Be Shown
    Element Should Contain    id:bride_mother_info_error    Please provide name

Bride Father Error Should Be Shown
    Element Should Contain    id:bride_father_info_error    Please provide name

Groom Mother Error Should Be Shown
    Element Should Contain    id:groom_mother_info_error    Please provide name

Groom Father Error Should Be Shown
    Element Should Contain    id:groom_father_info_error    Please provide name

Wedding Location Error Should Be Shown
    Element Should Contain    id:location_error    Please accomplish

Wedding Date Error Should Be Shown
    Element Should Contain    id:current_date_error    Please accomplish

Officiant Error Should Be Shown
    Element Should Contain    id:officiant_info_error    Please accomplish

Solemnizing Officer Error Should Be Shown
    Element Should Contain    id:solemnizer_info_error    Please accomplish

Contract Error Should Be Shown
    Element Should Contain    id:contract_info_error    Please accomplish

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

Wedding Main Page Should Be Open
    Wait Until Page Contains    Wedding Forms
    Element Should Contain    id:title    Wedding Forms

View Wedding Page Should Be Open
    Wait Until Page Contains    View Wedding Registry
    Element Should Contain    id:title    View Wedding Registry

Add Wedding Page Should Be Open
    Wait Until Page Contains    Add Wedding Registry
    Element Should Contain    id:title    Add Wedding Registry
