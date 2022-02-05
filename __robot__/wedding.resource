*** Settings ***
Documentation     A resource file with reusable keywords and variables
...
...               Creating system specific keywords from default keywords
...               from SeleniumLibrary
Library           SeleniumLibrary
Resource          login.resource
Resource          common.resource
Variables         variables.py

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

Navigate to Edit Wedding Page From View Wedding Page
    Scroll To Element    id:edit_wedding
    Click Button    id:edit_wedding

Select Edit Bride Details
    Scroll To Element    id:edit_bride
    Click Button    id:edit_bride
    Sleep    0.75s    Wait for Modal to Open

Select Edit Groom Details
    Scroll To Element    id:edit_groom
    Click Button    id:edit_groom
    Sleep    0.75s    Wait for Modal to Open

Select Edit Bride Mother Details
    Scroll To Element    id:edit_bride_mother
    Click Button    id:edit_bride_mother
    Sleep    0.75s    Wait for Modal to Open

Select Edit Bride Father Details
    Scroll To Element    id:edit_bride_father
    Click Button    id:edit_bride_father
    Sleep    0.75s    Wait for Modal to Open

Select Edit Groom Mother Details
    Scroll To Element    id:edit_groom_mother
    Click Button    id:edit_groom_mother
    Sleep    0.75s    Wait for Modal to Open

Select Edit Groom Father Details
    Scroll To Element    id:edit_groom_father
    Click Button    id:edit_groom_father
    Sleep    0.75s    Wait for Modal to Open

Select Edit Godmother Details
    Scroll To Element    class:edit_female_witness_btn
    Click Button    class:edit_female_witness_btn
    Sleep    0.75s    Wait for Modal to Open

Select Edit Godfather Details
    Scroll To Element    class:edit_male_witness_btn
    Click Button    class:edit_male_witness_btn
    Sleep    0.75s    Wait for Modal to Open

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

Select Non-Member Female Form
    Click Element    id:female_non_member

Select Member Female Form
    Click Element    id:female_member

Select No Female Form
    Click Element    id:female_none

Input Non-Member Female Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:female_first_name    ${first}
    Input Text    id:female_mid_name    ${middle}
    Input Text    id:female_last_name    ${last}

Select Random Member Female
    Click Element    css:#female_member_div .selectize-input
    Click Element    css:#female_member_div .selectize-dropdown-content>[data-selectable]

Select Non-Member Male Form
    Click Element    id:male_non_member

Select Member Male Form
    Click Element    id:male_member

Select No Male Form
    Click Element    id:male_none

Input Non-Member Male Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:male_first_name    ${first}
    Input Text    id:male_mid_name    ${middle}
    Input Text    id:male_last_name    ${last}

Select Random Member Male
    Click Element    css:#male_member_div .selectize-input
    Click Element    css:#male_member_div .selectize-dropdown-content>[data-selectable]

Input Wedding Location
    [Arguments]    ${location}
    Scroll to Element    id:location
    Input Text    id:location    ${location}

Input Wedding Date
    [Arguments]    ${month}    ${day}    ${year}
    Scroll to Element    id:current_date
    Press Keys    id:current_date    ${day}    ARROW_LEFT    ARROW_RIGHT    ${month}    ARROW_RIGHT    ${year}

Input Wedding Date in Edit Wedding Page
    [Arguments]    ${month}    ${day}    ${year}
    Scroll to Element    id:date
    Press Keys    id:date    ${day}    ARROW_LEFT    ARROW_RIGHT    ${month}    ARROW_RIGHT    ${year}

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
    Sleep    0.75s    Wait for Modal to Open

Select Add Godfather Button
    Scroll to Element    id:add_gfather_button
    Click Button    id:add_gfather_button
    Sleep    0.75s    Wait for Modal to Open

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
    Sleep    0.75s    Wait for Modal to Close

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
    Sleep    0.75s    Wait for Modal to Close

Remove Godmother
    Remove From List of Godmothers    0
    Scroll to Element    class:delGMotherWitnessBtn
    Click Element    class:delGMotherWitnessBtn

Remove Godfather
    Remove From List of Godfathers    0
    Scroll to Element    class:delGFatherWitnessBtn
    Click Element    class:delGFatherWitnessBtn

Select Non-Member Godmother Form in Edit Wedding Page
    Click Button    id:female_witness_non_member

Select Member Godmother Form in Edit Wedding Page
    Click Button    id:female_witness_member

Input Non-Member Godmother Details in Edit Wedding Page
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:female_witness_first_name    ${first}
    Input Text    id:female_witness_mid_name    ${middle}
    Input Text    id:female_witness_last_name    ${last}

Select Random Member Godmother in Edit Wedding Page
    Click Element    css:#female_witness_member_div .selectize-input
    Click Element    css:#female_witness_member_div .selectize-dropdown-content>[data-selectable]

Select Non-Member Godfather Form in Edit Wedding Page
    Click Button    id:male_witness_non_member

Select Member Godfather Form in Edit Wedding Page
    Click Button    id:male_witness_member

Input Non-Member Godfather Details in Edit Wedding Page
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:male_witness_first_name    ${first}
    Input Text    id:male_witness_mid_name    ${middle}
    Input Text    id:male_witness_last_name    ${last}

Select Random Member Godfather in Edit Wedding Page
    Click Element    css:#male_witness_member_div .selectize-input
    Click Element    css:#male_witness_member_div .selectize-dropdown-content>[data-selectable]

Remove Godmother in Edit Wedding Page
    Remove From List of Godmothers    0
    Scroll to Element    class:delete_female_witness_btn
    Click Element    class:delete_female_witness_btn
    Sleep    0.75s    Wait for Modal to Open
    Click Element    id:confirm_delete_witness
    Sleep    0.75s    Wait for Modal to Close

Remove Godfather in Edit Wedding Page
    Remove From List of Godfathers    0
    Scroll to Element    class:delete_male_witness_btn
    Click Element    class:delete_male_witness_btn
    Sleep    0.75s    Wait for Modal to Open
    Click Element    id:confirm_delete_witness
    Sleep    0.75s    Wait for Modal to Close

Submit Wedding Registry
    Scroll to Element    id:create-wedding-registry
    Click Button    id:create-wedding-registry

Save Bride Detail Changes
    Save Bride Data
    Click Button    id:save_bride_btn
    Sleep    0.75s    Wait for Modal to Close

Save Groom Detail Changes
    Save Groom Data
    Click Button    id:save_groom_btn
    Sleep    0.75s    Wait for Modal to Close

Save Bride Mother Detail Changes
    ${bride_mother}=    Get Female Data
    Set Test Variable    ${bride_mother}
    Click Button    id:save_female_btn
    Sleep    0.75s    Wait for Modal to Close

Save Bride Father Detail Changes
    ${bride_father}=    Get Male Data
    Set Test Variable    ${bride_father}
    Click Button    id:save_male_btn
    Sleep    0.75s    Wait for Modal to Close

Save Groom Mother Detail Changes
    ${groom_mother}=    Get Female Data
    Set Test Variable    ${groom_mother}
    Click Button    id:save_female_btn
    Sleep    0.75s    Wait for Modal to Close

Save Groom Father Detail Changes
    ${groom_father}=    Get Male Data
    Set Test Variable    ${groom_father}
    Click Button    id:save_male_btn
    Sleep    0.75s    Wait for Modal to Close

Save Godmother Detail Changes
    ${godmother}=    Get Godmother Data in Edit Wedding Page
    Replace in List of Godmothers    0    ${godmother}
    Click Button    id:save_female_witness_btn
    Sleep    0.75s    Wait for Modal to Close

Save Godfather Detail Changes
    ${godfather}=    Get Godfather Data in Edit Wedding Page
    Replace in List of Godfathers    0    ${godfather}
    Click Button    id:save_male_witness_btn
    Sleep    0.75s    Wait for Modal to Close

Confirm Add Godmother in Edit Wedding Page
    ${godmother}=    Get Godmother Data in Edit Wedding Page
    Append to List of Godmothers    ${godmother}
    Click Button    id:save_female_witness_btn
    Sleep    0.75s    Wait for Modal to Close

Confirm Add Godfather in Edit Wedding Page
    ${godfather}=    Get Godfather Data in Edit Wedding Page
    Append to List of Godfathers    ${godfather}
    Click Button    id:save_male_witness_btn
    Sleep    0.75s    Wait for Modal to Close

Save Wedding Form Changes
    Scroll To Element    id:save_changes
    Click Button    id:save_changes

Delete Wedding Record
    Scroll to Element    id:delete_wedding
    Click Button    id:delete_wedding
    Sleep    0.75s    Wait for Modal to Open
    Click Button    id:confirm_delete
    Sleep    0.75s    Wait for Modal to Close

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
#TODO: START

Save Bride Data
    ${bride_member}=    Get Radio Button Status    id:bride_member
    ${bride_non_member}=    Get Radio Button Status    id:bride_non_member
    IF    ${bride_member}
        ${bride}=    Get Value    id:input_bride_member
        ${bride}=    Extract Member Name    ${bride}
    ELSE IF    ${bride_non_member}
        ${bride_first_name}=    Get Value    id:bride_first_name
        ${bride_mid_name}=    Get Value    id:bride_mid_name
        ${bride_last_name}=    Get Value    id:bride_last_name
        ${bride}=    Create List    ${bride_first_name}    ${bride_mid_name}    ${bride_last_name}
    END
    Set Test Variable    ${bride}

Save Groom Data
    ${groom_member}=    Get Radio Button Status    id:groom_member
    ${groom_non_member}=    Get Radio Button Status    id:groom_non_member
    IF    ${groom_member}
        ${groom}=    Get Value    id:input_groom_member
        ${groom}=    Extract Member Name    ${groom}
    ELSE IF    ${groom_non_member}
        ${groom_first_name}=    Get Value    id:groom_first_name
        ${groom_mid_name}=    Get Value    id:groom_mid_name
        ${groom_last_name}=    Get Value    id:groom_last_name
        ${groom}=    Create List    ${groom_first_name}    ${groom_mid_name}    ${groom_last_name}
    END
    Set Test Variable    ${groom}

Save Bride Mother Data
    ${bride_mother_member}=    Get Radio Button Status    id:bride_mother_member
    ${bride_mother_non_member}=    Get Radio Button Status    id:bride_mother_non_member
    ${bride_mother_none}=    Get Radio Button Status    id:bride_mother_none
    IF    ${bride_mother_member}
        ${bride_mother}=    Get Value    id:input_bride_mother_member
        ${bride_mother}=    Extract Member Name    ${bride_mother}
    ELSE IF    ${bride_mother_non_member}
        ${bride_mother_first_name}=    Get Value    id:bride_mother_first_name
        ${bride_mother_mid_name}=    Get Value    id:bride_mother_mid_name
        ${bride_mother_last_name}=    Get Value    id:bride_mother_last_name
        ${bride_mother}=    Create List    ${bride_mother_first_name}    ${bride_mother_mid_name}
        ...    ${bride_mother_last_name}
    ELSE IF    ${bride_mother_none}
        ${bride_mother}=    Create List    N/A    N/A    N/A
    END
    Set Test Variable    ${bride_mother}

Save Bride Father Data
    ${bride_father_member}=    Get Radio Button Status    id:bride_father_member
    ${bride_father_non_member}=    Get Radio Button Status    id:bride_father_non_member
    ${bride_father_none}=    Get Radio Button Status    id:bride_father_none
    IF    ${bride_father_member}
        ${bride_father}=    Get Value    id:input_bride_father_member
        ${bride_father}=    Extract Member Name    ${bride_father}
    ELSE IF    ${bride_father_non_member}
        ${bride_father_first_name}=    Get Value    id:bride_father_first_name
        ${bride_father_mid_name}=    Get Value    id:bride_father_mid_name
        ${bride_father_last_name}=    Get Value    id:bride_father_last_name
        ${bride_father}=    Create List    ${bride_father_first_name}    ${bride_father_mid_name}
        ...    ${bride_father_last_name}
    ELSE IF    ${bride_father_none}
        ${bride_father}=    Create List    'N/A'    'N/A'    'N/A'
    END
    Set Test Variable    ${bride_father}

Save Groom Mother Data
    ${groom_mother_member}=    Get Radio Button Status    id:groom_mother_member
    ${groom_mother_non_member}=    Get Radio Button Status    id:groom_mother_non_member
    ${groom_mother_none}=    Get Radio Button Status    id:groom_mother_none
    IF    ${groom_mother_member}
        ${groom_mother}=    Get Value    id:input_groom_mother_member
        ${groom_mother}=    Extract Member Name    ${groom_mother}
    ELSE IF    ${groom_mother_non_member}
        ${groom_mother_first_name}=    Get Value    id:groom_mother_first_name
        ${groom_mother_mid_name}=    Get Value    id:groom_mother_mid_name
        ${groom_mother_last_name}=    Get Value    id:groom_mother_last_name
        ${groom_mother}=    Create List    ${groom_mother_first_name}    ${groom_mother_mid_name}
        ...    ${groom_mother_last_name}
    ELSE IF    ${groom_mother_none}
        ${groom_mother}=    Create List    'N/A'    'N/A'    'N/A'
    END
    Set Test Variable    ${groom_mother}

Save Groom Father Data
    ${groom_father_member}=    Get Radio Button Status    id:groom_father_member
    ${groom_father_non_member}=    Get Radio Button Status    id:groom_father_non_member
    ${groom_father_none}=    Get Radio Button Status    id:groom_father_none
    IF    ${groom_father_member}
        ${groom_father}=    Get Value    id:input_groom_father_member
        ${groom_father}=    Extract Member Name    ${groom_father}
    ELSE IF    ${groom_father_non_member}
        ${groom_father_first_name}=    Get Value    id:groom_father_first_name
        ${groom_father_mid_name}=    Get Value    id:groom_father_mid_name
        ${groom_father_last_name}=    Get Value    id:groom_father_last_name
        ${groom_father}=    Create List    ${groom_father_first_name}    ${groom_father_mid_name}
        ...    ${groom_father_last_name}
    ELSE IF    ${groom_father_none}
        ${groom_father}=    Create List    'N/A'    'N/A'    'N/A'
    END
    Set Test Variable    ${groom_father}

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

Get Female Data
    ${female_member}=    Get Radio Button Status    id:female_member
    ${female_non_member}=    Get Radio Button Status    id:female_non_member
    ${female_none}=    Get Radio Button Status    id:female_none
    IF    ${female_member}
        ${female}=    Get Value    id:input_female_member
        ${female}=    Extract Member Name    ${female}
    ELSE IF    ${female_non_member}
        ${female_first_name}=    Get Value    id:female_first_name
        ${female_mid_name}=    Get Value    id:female_mid_name
        ${female_last_name}=    Get Value    id:female_last_name
        ${female}=    Create List    ${female_first_name}    ${female_mid_name}
        ...    ${female_last_name}
    ELSE IF    ${female_none}
        ${female}=    Create List    'N/A'    'N/A'    'N/A'
    END
    [Return]    ${female}

Get Male Data
    ${male_member}=    Get Radio Button Status    id:male_member
    ${male_non_member}=    Get Radio Button Status    id:male_non_member
    ${male_none}=    Get Radio Button Status    id:male_none
    IF    ${male_member}
        ${male}=    Get Value    id:input_male_member
        ${male}=    Extract Member Name    ${male}
    ELSE IF    ${male_non_member}
        ${male_first_name}=    Get Value    id:male_first_name
        ${male_mid_name}=    Get Value    id:male_mid_name
        ${male_last_name}=    Get Value    id:male_last_name
        ${male}=    Create List    ${male_first_name}    ${male_mid_name}
        ...    ${male_last_name}
    ELSE IF    ${male_none}
        ${male}=    Create List    'N/A'    'N/A'    'N/A'
    END
    [Return]    ${male}

Get Godmother Data in Edit Wedding Page
    #Current Godmother
    ${godmother_member}=    Get Radio Button Status    id:female_witness_member
    ${godmother_non_member}=    Get Radio Button Status    id:female_witness_non_member
    IF    ${godmother_member}
        ${godmother}=    Get Value    id:input_female_witness_member
        ${godmother}=    Extract Member Name    ${godmother}
    ELSE IF    ${godmother_non_member}
        ${godmother_first_name}=    Get Value    id:female_witness_first_name
        ${godmother_mid_name}=    Get Value    id:female_witness_mid_name
        ${godmother_last_name}=    Get Value    id:female_witness_last_name
        ${godmother}=    Create List    ${godmother_first_name}    ${godmother_mid_name}    ${godmother_last_name}
    END
    [Return]    ${godmother}

Get Godfather Data in Edit Wedding Page
    #Current Godfather
    ${godfather_member}=    Get Radio Button Status    id:male_witness_member
    ${godfather_non_member}=    Get Radio Button Status    id:male_witness_non_member
    IF    ${godfather_member}
        ${godfather}=    Get Value    id:input_male_witness_member
        ${godfather}=    Extract Member Name    ${godfather}
    ELSE IF    ${godfather_non_member}
        ${godfather_first_name}=    Get Value    id:male_witness_first_name
        ${godfather_mid_name}=    Get Value    id:male_witness_mid_name
        ${godfather_last_name}=    Get Value    id:male_witness_last_name
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

Save Wedding Form Data
    #Bride
    Save Bride Data
    #Groom
    Save Groom Data
    #Bride Mother
    Save Bride Mother Data
    #Bride Father
    Save Bride Father Data
    #Groom Mother
    Save Groom Mother Data
    #Groom Father
    Save Groom Father Data
    #Wedding Location
    ${location}=    Get Value    id:location
    Set Test Variable    ${location}
    #Wedding Date
    ${date}=    Get Value    id:current_date
    ${date}=    Format Date    ${date}
    Set Test Variable    ${date}
    #Officiant
    ${officiant}=    Get Value    id:officiant
    Set Test Variable    ${officiant}
    #Solemnizing Officer
    ${solemnizer}=    Get Value    id:solemnizer
    Set Test Variable    ${solemnizer}
    #Contract
    ${contract}=    Get Value    id:contract
    Set Test Variable    ${contract}
    #Witnesses
    Save List of Godmothers
    Save List of Godfathers

Save Wedding Form Data in Edit Wedding Page
    #Date of Dedication
    ${date}=    Get Value    id:date
    ${date}=    Format Date    ${date}
    Set Test Variable    ${date}
    #Contract
    ${contract}=    Get Value    id:contract
    Set Test Variable    ${contract}
    #Bride
    ${bride_exists}=    Get Variable Value    ${bride}
    IF    ${bride_exists} == ${None}
        ${bride_first_name}=    Get Text    id:bride_first_name_view
        ${bride_mid_name}=    Get Text    id:bride_mid_name_view
        ${bride_last_name}=    Get Text    id:bride_last_name_view
        ${bride}=    Create List    ${bride_first_name}    ${bride_mid_name}    ${bride_last_name}
        Set Test Variable    ${bride}
    END
    #Groom
    ${groom_exists}=    Get Variable Value    ${groom}
    IF    ${groom_exists} == ${None}
        ${groom_first_name}=    Get Text    id:groom_first_name_view
        ${groom_mid_name}=    Get Text    id:groom_mid_name_view
        ${groom_last_name}=    Get Text    id:groom_last_name_view
        ${groom}=    Create List    ${groom_first_name}    ${groom_mid_name}    ${groom_last_name}
        Set Test Variable    ${groom}
    END
    #Bride Mother
    ${bride_mother_exists}=    Get Variable Value    ${bride_mother}
    IF    ${bride_mother_exists} == ${None}
        ${bride_mother_first_name}=    Get Text    id:bride_mother_first_name_view
        ${bride_mother_mid_name}=    Get Text    id:bride_mother_mid_name_view
        ${bride_mother_last_name}=    Get Text    id:bride_mother_last_name_view
        ${bride_mother}=    Create List    ${bride_mother_first_name}    ${bride_mother_mid_name}
        ...    ${bride_mother_last_name}
        Set Test Variable    ${bride_mother}
    END
    #Bride Father
    ${bride_father_exists}=    Get Variable Value    ${bride_father}
    IF    ${bride_father_exists} == ${None}
        ${bride_father_first_name}=    Get Text    id:bride_father_first_name_view
        ${bride_father_mid_name}=    Get Text    id:bride_father_mid_name_view
        ${bride_father_last_name}=    Get Text    id:bride_father_last_name_view
        ${bride_father}=    Create List    ${bride_father_first_name}    ${bride_father_mid_name}
        ...    ${bride_father_last_name}
        Set Test Variable    ${bride_father}
    END
    #Groom Mother
    ${groom_mother_exists}=    Get Variable Value    ${groom_mother}
    IF    ${groom_mother_exists} == ${None}
        ${groom_mother_first_name}=    Get Text    id:groom_mother_first_name_view
        ${groom_mother_mid_name}=    Get Text    id:groom_mother_mid_name_view
        ${groom_mother_last_name}=    Get Text    id:groom_mother_last_name_view
        ${groom_mother}=    Create List    ${groom_mother_first_name}    ${groom_mother_mid_name}
        ...    ${groom_mother_last_name}
        Set Test Variable    ${groom_mother}
    END
    #Groom Father
    ${groom_father_exists}=    Get Variable Value    ${groom_father}
    IF    ${groom_father_exists} == ${None}
        ${groom_father_first_name}=    Get Text    id:groom_father_first_name_view
        ${groom_father_mid_name}=    Get Text    id:groom_father_mid_name_view
        ${groom_father_last_name}=    Get Text    id:groom_father_last_name_view
        ${groom_father}=    Create List    ${groom_father_first_name}    ${groom_father_mid_name}
        ...    ${groom_father_last_name}
        Set Test Variable    ${groom_father}
    END
    #Officiant
    ${officiant}=    Get Value    id:officiant
    Set Test Variable    ${officiant}
    #Solemnizing Officer
    ${solemnizer}=    Get Value    id:solemnizer
    Set Test Variable    ${solemnizer}
    #Wedding Location
    ${location}=    Get Value    id:location
    Set Test Variable    ${location}
    #Witnesses
    Save List of Godmothers
    Save List of Godfathers

View Wedding Page Should Match Form Inputs
    #Contract
    Element Should Contain    id:contract    ${contract}
    #Wedding Date
    Element Should Contain    id:wedding_date    ${date}
    #Bride
    Element Should Contain    id:bride_first_name    ${bride[0]}
    Element Should Contain    id:bride_mid_name    ${bride[1]}
    Element Should Contain    id:bride_last_name    ${bride[2]}
    #Groom
    Element Should Contain    id:groom_first_name    ${groom[0]}
    Element Should Contain    id:groom_mid_name    ${groom[1]}
    Element Should Contain    id:groom_last_name    ${groom[2]}
    #Bride Mother
    Element Should Contain    id:bride_mother_first_name    ${bride_mother[0]}
    Element Should Contain    id:bride_mother_mid_name    ${bride_mother[1]}
    Element Should Contain    id:bride_mother_last_name    ${bride_mother[2]}
    #Bride Father
    Element Should Contain    id:bride_father_first_name    ${bride_father[0]}
    Element Should Contain    id:bride_father_mid_name    ${bride_father[1]}
    Element Should Contain    id:bride_father_last_name    ${bride_father[2]}
    #Groom Mother
    Element Should Contain    id:groom_mother_first_name    ${groom_mother[0]}
    Element Should Contain    id:groom_mother_mid_name    ${groom_mother[1]}
    Element Should Contain    id:groom_mother_last_name    ${groom_mother[2]}
    #Groom Father
    Element Should Contain    id:groom_father_first_name    ${groom_father[0]}
    Element Should Contain    id:groom_father_mid_name    ${groom_father[1]}
    Element Should Contain    id:groom_father_last_name    ${groom_father[2]}
    #Officiant
    Element Should Contain    id:officiant    ${officiant}
    #Solemnizing Officer
    Element Should Contain    id:solemnizer    ${solemnizer}
    #Wedding Location
    Element Should Contain    id:location    ${location}
    #Godfather
    ${godfathers_elements}=    Get WebElements    css:#godfathers .witness
    ${godfather_length}=    Get Length    ${godfathers_elements}
    Length Should Be    ${godfather_list}    ${godfather_length}
    ${godfather_section}=    Get WebElements    css:#godfathers
    FOR    ${godfather}    IN    @{godfather_list}
        ${godfather_name}=    Catenate    ${godfather[0]}    ${godfather[1]}.    ${godfather[2]}
        Element Should Contain    ${godfather_section}    ${godfather_name}
    END
    #Godmother
    ${godmothers_elements}=    Get WebElements    css:#godmothers .witness
    ${godmother_length}=    Get Length    ${godmothers_elements}
    Length Should Be    ${godmother_list}    ${godmother_length}
    ${godmother_section}=    Get WebElements    css:#godmothers
    FOR    ${godmother}    IN    @{godmother_list}
        ${godmother_name}=    Catenate    ${godmother[0]}    ${godmother[1]}.    ${godmother[2]}
        Element Should Contain    ${godmother_section}    ${godmother_name}
    END
#TODO: END

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

Edit Wedding Page Should Be Open
    Wait Until Page Contains    Edit Wedding Registry
    Element Should Contain    id:title    Edit Wedding Registry
