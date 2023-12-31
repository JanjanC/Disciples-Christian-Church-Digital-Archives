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

Navigate to Prenuptial Page From Forms Main Page
    Click Link    css:#prenuptial>a

Navigate to Add Prenuptial Page From Prenuptial Main Page
    Click Link    id:add-prenup

Navigate to View Prenuptial Page From Prenuptial Main Page
    Click Element    class:record

Navigate to Prenuptial Main Page From View Prenuptial Page
    Click Element    id:back

Navigate to Edit Prenuptial Page From View Prenuptial Page
    Scroll To Element    id:edit_prenup
    Click Button    id:edit_prenup

Select Edit Bride Details
    Scroll To Element    id:edit_bride
    Click Button    id:edit_bride
    Sleep    0.75s    Wait for Modal to Open

Select Edit Groom Details
    Scroll To Element    id:edit_groom
    Click Button    id:edit_groom
    Sleep    0.75s    Wait for Modal to Open

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
    Press Keys    id:current_date    ${month}    ${day}    ${year}

Input Wedding Date
    [Arguments]    ${month}    ${day}    ${year}
    Scroll To Element    id:wedding_date
    Press Keys    id:wedding_date    ${month}    ${day}    ${year}

Submit Prenuptial Form
    Scroll To Element    id:create-prenup
    Click Button    id:create-prenup

Save Bride Detail Changes
    Save Bride Data
    Click Button    id:save_bride_btn
    Sleep    0.75s    Wait for Modal to Close

Save Groom Detail Changes
    Save Groom Data
    Click Button    id:save_groom_btn
    Sleep    0.75s    Wait for Modal to Close

Save Prenuptial Form Changes
    Scroll To Element    id:save_changes
    Click Button    id:save_changes
    Sleep    0.75s    Wait for Modal to Open
    Click Button    id:edit-prenup
    Sleep    0.75s    Wait for Modal to Close

Delete Prenuptial Record
    Scroll To Element    id:delete_prenup
    Click Button    id:delete_prenup
    Sleep    0.75s    Wait for Modal to Open
    Click Button    id:confirm_delete
    Sleep    0.75s    Wait for Modal to Close

Bride Information Error Should Be Shown
    Element Should Contain    id:bride_info_error    Accomplish all fields

Groom Information Error Should Be Shown
    Element Should Contain    id:groom_info_error    Accomplish all fields

Wedding Date Error Should Be Shown
    Element Should Contain    id:wedding_date_error    Wedding date should not be earlier than current date

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

Save Prenuptial Form Data
    #Bride
    Save Bride Data
    #Groom
    Save Groom Data
    #Current Date
    ${current_date}=    Get Value    id:current_date
    ${current_date}=    Format Date    ${current_date}
    Set Test Variable    ${current_date}
    #Wedding Date
    ${wedding_date}=    Get Value    id:wedding_date
    ${wedding_date}=    Format Date    ${wedding_date}
    Set Test Variable    ${wedding_date}

Save Prenuptial Form Data in Edit Prenuptial Page
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
    #Date Created
    ${current_date}=    Get Value    id:date_added
    Set Test Variable    ${current_date}
    #Wedding Date
    ${wedding_date}=    Get Value    id:wedding_date
    ${wedding_date}=    Format Date    ${wedding_date}
    Set Test Variable    ${wedding_date}

View Prenuptial Page Should Match Form Inputs
    #Date Created
    Element Should Contain    id:date_created    ${current_date}
    #Bride
    Element Should Contain    id:bride_first_name    ${bride[0]}
    Element Should Contain    id:bride_mid_name    ${bride[1]}
    Element Should Contain    id:bride_last_name    ${bride[2]}
    #Groom
    Element Should Contain    id:groom_first_name    ${groom[0]}
    Element Should Contain    id:groom_mid_name    ${groom[1]}
    Element Should Contain    id:groom_last_name    ${groom[2]}
    #Wedding Date
    Element Should Contain    id:wedding_date    ${wedding_date}

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
