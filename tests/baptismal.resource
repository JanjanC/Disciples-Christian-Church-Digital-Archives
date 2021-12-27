*** Settings ***
Documentation       A resource file with reusable keywords and variables
...
...                 Creating system specific keywords from default keywords
...                 from SeleniumLibrary

Library             SeleniumLibrary
Library             DateTime
Resource            login.resource
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

Select Member for Baptism
    Click Element    css:#member_div .selectize-input
    Click Element    css:#member_div .selectize-dropdown-content>[data-selectable]

Input Baptism Location
    [Arguments]    ${location}
    Input Text    id:location    ${location}

Input Baptism Date
    [Arguments]    ${month}    ${day}    ${year}
    Press Keys    id:date    ${day}    ARROW_LEFT    ARROW_RIGHT    ${month}    ARROW_RIGHT    ${year}

Select Non-Member Officiant Form
    Click Element    id:officiant_non_member

Select Member Officiant Form
    Click Element    id:officiant_member

Input Non Member Officiant Details
    [Arguments]    ${first}    ${middle}    ${last}
    Input Text    id:officiant_first_name    ${first}
    Input Text    id:officiant_mid_name    ${middle}
    Input Text    id:officiant_last_name    ${last}

Select Member Officiant
    Click Element    css:#officiant_member_div .selectize-input
    Click Element    css:#officiant_member_div .selectize-dropdown-content>[data-selectable]

Submit Baptismal Form
    Click Button    id:create-baptismal

Delete Baptismal Record
    Click Button    id:delete-baptismal
    Click Button    id:confirm_delete

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

Forms Main Page Should Be Open
    Wait Until Page Contains    Baptismal Record
    Element Should Contain    id:baptismal    Baptismal Record
    Wait Until Page Contains    Child Dedication
    Element Should Contain    id:child-dedication    Child Dedication
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
# Edit Baptismal Page Should Be Open
#    Element Should Contain    id:title    Edit Prenuptial Form
