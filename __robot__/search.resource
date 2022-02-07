*** Settings ***
Documentation   A resource file with reusable keywords and variables
...
...              Creating system specific keywords from default keywords
...              from SeleniumLibrary
Library          SeleniumLibrary
Resource         common.resource
*** Variables ***
${SERVER}              localhost:3000
${BROWSER}             chrome
${DELAY}               0
${LEVEL 1 PASSWORD}    NormandyN7
${LEVEL 2 PASSWORD}    HelloSweng
${LEVEL 3 PASSWORD}    Coffee118
${INVALID PASSWORD}    invalid
${LOGIN URL}           http://${SERVER}

*** Keywords ***
Open Browser To Login Page
    Open Browser                    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed              ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element     password

Input Pass
    [Arguments]                     ${password}
    Input Password                  password    ${password}

Submit Credentials
    Press Keys                      none    ENTER

Access Advanced Search
    Wait Until Element Is Enabled   css:*[href="/advanced_search"]
    Click Element                   css:*[href="/advanced_search"]

Has No Access To Advanced Search
    Wait Until Page Contains        ERROR 401
    Wait Until Page Contains        401 Unauthorized Access
    Element Should Contain          css:*[style="text-align: center; margin-bottom: 0.5em"]     ERROR 401
    Element Should Contain          css:*[style="text-align: center;"]                          401 Unauthorized Access

Go To Home Page
    Wait Until Element Is Enabled   css:*[href="/main_page"]
    Scroll To Element              css:*[href="/main_page"]
    Click Element                   css:*[href="/main_page"]

Search Prenuptial Record [No Additional Conditions]
    Wait Until Element Is Enabled                       record-type
    Select From List By Value                           record-type     prenup-option
    Set Focus To Element                                prenup-search-submit
    Click Button                                        prenup-search-submit

Check Prenuptial Record [No Additional Condition]
    Page Should Contain Element                         css:*[data-href="/view_prenup/4000001"]
    Page Should Contain Element                         css:*[data-href="/view_prenup/4000002"]
    Page Should Contain Element                         css:*[data-href="/view_prenup/4000003"]
    Go To Home Page

Sort Record
    [Arguments]                     ${Sort}
    Wait Until Element Is Enabled   ${Sort}
    Click Element                   ${Sort}

Record Is Ascending By
    [Arguments]                     ${Ascending_By}
    Element Should Be Visible       ${Ascending_By}

Record Is Descending By
    [Arguments]                     ${Descending_By}
    Element Should Be Visible       ${Descending_By}

Navigate Member
    [Arguments]    ${href_reg_num}
    Search Member [No Additional Conditions]
    Wait Until Element Is Enabled                       css:*[data-href="/member/${href_reg_num}"]
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]

View Linked Prenuptial Record
    [Arguments]    ${href_reg_num}
    Wait Until Element Is Enabled                       css:*[href="/view_prenup/${href_reg_num}"]
    Scroll To Element                                   css:*[href="/view_prenup/${href_reg_num}"]
    Wait Until Element Is Visible                       css:*[href="/view_prenup/${href_reg_num}"]
    Click Element                                       css:*[href="/view_prenup/${href_reg_num}"]
    Go To Home Page

View Linked Wedding Record
    [Arguments]    ${href_reg_num}
    Wait Until Element Is Enabled                       css:*[href="/view_wedding/${href_reg_num}"]
    Scroll To Element                                   css:*[href="/view_wedding/${href_reg_num}"]
    Wait Until Element Is Visible                       css:*[href="/view_wedding/${href_reg_num}"]
    Click Element                                       css:*[href="/view_wedding/${href_reg_num}"]
    Go To Home Page

View Linked Baptismal Record
    [Arguments]    ${href_reg_num}
    Wait Until Element Is Enabled                       css:*[href="/view_baptismal/${href_reg_num}"]
    Scroll To Element                                   css:*[href="/view_baptismal/${href_reg_num}"]
    Wait Until Element Is Visible                       css:*[href="/view_baptismal/${href_reg_num}"]
    Click Element                                       css:*[href="/view_baptismal/${href_reg_num}"]
    Go To Home Page

View Linked Child Dedication Record
    [Arguments]    ${href_reg_num}
    Wait Until Element Is Enabled                       css:*[href="/view_dedication/${href_reg_num}"]
    Scroll To Element                                   css:*[href="/view_dedication/${href_reg_num}"]
    Wait Until Element Is Visible                       css:*[href="/view_dedication/${href_reg_num}"]
    Click Element                                       css:*[href="/view_dedication/${href_reg_num}"]
    Go To Home Page

Search Member [No Additional Conditions]
    Wait Until Element Is Enabled                       record-type
    Select From List By Value                           record-type     member-option
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit

Check Member [No Additional Conditions]
    Wait Until Element Is Enabled                       css:*[data-href="/member/1"]
    Page Should Contain Element                         css:*[data-href="/member/1"]
    Go To Home Page

Search Member [All Conditions]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}
    Wait Until Element Is Enabled                       record-type
    Select From List By Value                           record-type                 member-option
    Input Text                                          member_first_name           ${first_name}
    Input Text                                          member_middle_name          ${middle_initial}
    Input Text                                          member_last_name            ${last_name}
    Select From List By Value                           sex                         ${sex}
    Input Text                                          ageFrom                     ${from_age}
    Input Text                                          ageTo                       ${to_age}
    Select From List By Value                           membership_status           ${membership_status}
    Select From List By Label                           membership_type             ${membership_type}
    Select From List By Value                           civil_status                ${civil_status}
    Input Text                                          city                        ${city}
    Input Text                                          educational_attainment      ${educational_attainment}
    Input Text                                          occupation                  ${occupation}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Member [First Name Condition]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}
    Select From List By Value                           record-type                 member-option
    Input Text                                          member_first_name           ${first_name}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Member [Middle Initial Condition]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}
    Select From List By Value                           record-type                 member-option
    Input Text                                          member_middle_name          ${middle_initial}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Wait Until Element Is Enabled                       css:*[data-href="/member/${href_reg_num}"]
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Member [Last Name Condition]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}
    Select From List By Value                           record-type                 member-option
    Input Text                                          member_last_name            ${last_name}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Wait Until Element Is Enabled                       css:*[data-href="/member/${href_reg_num}"]
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Member [Sex Condition 2]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}
    Select From List By Value                           record-type                 member-option
    Select From List By Value                           sex                         ${sex}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Member [Age Condition]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}
    Select From List By Value                           record-type                 member-option
    Input Text                                          ageFrom                     ${from_age}
    Input Text                                          ageTo                       ${to_age}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Member [Birthday Condition]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}    ${birthday_from}    ${birthday_to}
    Select From List By Value                           record-type                   member-option
    Click Element                                       birthday-checkbox
    Input Text                                          birthdayFrom                  ${birthday_from}
    Input Text                                          birthdayTo                    ${birthday_to}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Member [Membership Status Condition]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}
    Select From List By Value                           record-type                 member-option
    Select From List By Value                           membership_status           ${membership_status}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Member [Civil Status Condition]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}
    Select From List By Value                           record-type                 member-option
    Select From List By Value                           civil_status                ${civil_status}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Member [City Condition]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}
    Select From List By Value                           record-type                 member-option
    Input Text                                          city                        ${city}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Member [Educational Attainment Condition]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}
    Select From List By Value                           record-type                 member-option
    Input Text                                          educational_attainment      ${educational_attainment}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Member [Occupation Condition]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}
    Select From List By Value                           record-type                 member-option
    Input Text                                          occupation                  ${occupation}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Member [Two Or More Conditions]
    [Arguments]    ${first_name}    ${middle_initial}    ${last_name}    ${sex}    ${from_age}    ${to_age}    ${membership_status}    ${membership_type}    ${civil_status}    ${city}    ${educational_attainment}    ${occupation}    ${date_added}    ${href_reg_num}    ${birthday}
    Select From List By Value                           record-type                 member-option
    Input Text                                          member_first_name           ${first_name}
    Input Text                                          member_middle_name          ${middle_initial}
    Input Text                                          member_last_name            ${last_name}
    Input Text                                          ageFrom                     ${from_age}
    Input Text                                          ageTo                       ${to_age}
    Select From List By Value                           membership_status           ${membership_status}
    Select From List By Label                           membership_type             ${membership_type}
    Input Text                                          city                        ${city}
    Scroll To Element                                   member-search-submit
    Wait Until Element Is Visible                       member-search-submit
    Click Button                                        member-search-submit
    Click Element                                       css:*[data-href="/member/${href_reg_num}"]
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${sex}
    Page Should Contain                                 ${birthday}
    Page Should Contain                                 ${membership_status}
    Page Should Contain                                 ${membership_type}
    Page Should Contain                                 ${civil_status}
    Page Should Contain                                 ${city}
    Page Should Contain                                 ${educational_attainment}
    Page Should Contain                                 ${occupation}
    Page Should Contain                                 ${date_added}
    Go To Home Page

Search Child Dedication Record [No Additional Conditions]
    Wait Until Element Is Enabled                       dedication-search-submit
    Select From List By Value                           record-type     dedication-option
    Scroll To Element                                   dedication-search-submit
    Wait Until Element Is Visible                       dedication-search-submit
    Click Button                                        dedication-search-submit

Search Wedding Registry Record [No Additional Conditions]
    Select From List By Value                           record-type     wedding-option
    Wait Until Element Is Enabled                       wedding-search-submit
    Scroll To Element                                   wedding-search-submit
    Wait Until Element Is Visible                       wedding-search-submit
    Click Button                                        wedding-search-submit

Check Wedding Registry Record [No Condition]
    Page Should Contain Element                         css:*[data-href="/view_wedding/2"]
    Go To Home Page

Search Baptismal Record [No Additional Conditions]
    Wait Until Element Is Enabled                       record-type
    Select From List By Value                           record-type     baptismal-option
    Scroll To Element                                   baptismal-search-submit
    Wait Until Element Is Visible                       baptismal-search-submit
    Click Button                                        baptismal-search-submit

Baptismal Record Results
    [Arguments]    ${first_member}    ${second_member}
    Page Should Contain    ${first_member}
    Page Should Contain    ${second_member}
    Go To Home Page

Search Baptismal [All Conditions]
    [Arguments]                                         ${baptized_first}        ${baptized_mid}        ${baptized_last}        ${officiant_first}        ${officiant_mid}        ${officiant_last}        ${from_date}        ${to_date}        ${location}        ${href_reg_num}        ${date_created}        ${baptismal_date}
    Select From List By Value                           record-type     baptismal-option
    Input Text                                          baptism_first_name               ${baptized_first}
    Input Text                                          baptism_middle_name              ${baptized_mid}
    Input Text                                          baptism_last_name                ${baptized_last}
    Input Text                                          baptism_officiant_first_name     ${officiant_first}
    Input Text                                          baptism_officiant_middle_name    ${officiant_mid}
    Input Text                                          baptism_officiant_last_name      ${officiant_last}
    Input Text                                          baptismal_date_from              ${from_date}
    Input Text                                          baptismal_date_to                ${to_date}
    Input Text                                          baptismal_location               ${location}
    Set Focus To Element                                baptismal-search-submit
    Click Button                                        baptismal-search-submit
    Click Element                                       css:*[data-href="/view_baptismal/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${baptismal_date}
    Page Should Contain                                 ${baptized_first}
    Page Should Contain                                 ${baptized_mid}
    Page Should Contain                                 ${baptized_last}
    Page Should Contain                                 ${officiant_first}
    Page Should Contain                                 ${officiant_mid}
    Page Should Contain                                 ${officiant_last}
    Page Should Contain                                 ${location}
    Go To Home Page

Search Member [Sex Condition]
    [Arguments]                                         ${href_reg_num}
    Select From List By Value                           record-type     member-option
    Select From List By Value                           sex             Female
    Set Focus To Element                                member-search-submit
    Click Button                                        member-search-submit
    Page Should Contain                                 ${href_reg_num}
    Go To Home Page

Search Prenuptial Record [All Conditions]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${from_date_created}    ${to_date_created}    ${from_date_wedding}    ${to_date_wedding}    ${date_created}    ${date_wedding}    ${href_reg_num}
    Select From List By Value                           record-type     prenup-option
    Input Text                                          prenup_bride_first_name    ${bride_first}
    Input Text                                          prenup_bride_mid_name      ${bride_mid}
    Input Text                                          prenup_bride_last_name     ${bride_last}
    Input Text                                          prenup_groom_first_name    ${groom_first}
    Input Text                                          prenup_groom_mid_name      ${groom_mid}
    Input Text                                          prenup_groom_last_name     ${groom_last}
    Input Text                                          prenup_date_created_from   ${from_date_created}
    Input Text                                          prenup_date_created_to     ${to_date_created}
    Input Text                                          prenup_date_wedding_from   ${from_date_wedding}
    Input Text                                          prenup_date_wedding_to     ${to_date_wedding}
    Set Focus To Element                                prenup-search-submit
    Click Button                                        prenup-search-submit
    Click Element                                       css:*[data-href="/view_prenup/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${date_wedding}
    Go To Home Page

Search Prenuptial Record [Bride Middle Initial Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${from_date_created}    ${to_date_created}    ${from_date_wedding}    ${to_date_wedding}    ${date_created}    ${date_wedding}    ${href_reg_num}
    Select From List By Value                           record-type     prenup-option
    Input Text                                          prenup_bride_mid_name      ${bride_mid}
    Click Button                                        prenup-search-submit
    Click Element                                       css:*[data-href="/view_prenup/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${date_wedding}
    Go To Home Page

Search Prenuptial Record [Bride Last Name Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${from_date_created}    ${to_date_created}    ${from_date_wedding}    ${to_date_wedding}    ${date_created}    ${date_wedding}    ${href_reg_num}
    Select From List By Value                           record-type     prenup-option
    Input Text                                          prenup_bride_last_name      ${bride_last}
    Click Button                                        prenup-search-submit
    Click Element                                       css:*[data-href="/view_prenup/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${date_wedding}
    Go To Home Page

Search Prenuptial Record [Groom First Name Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${from_date_created}    ${to_date_created}    ${from_date_wedding}    ${to_date_wedding}    ${date_created}    ${date_wedding}    ${href_reg_num}
    Select From List By Value                           record-type     prenup-option
    Input Text                                          prenup_groom_first_name    ${groom_first}
    Set Focus To Element                                prenup-search-submit
    Click Button                                        prenup-search-submit
    Click Element                                       css:*[data-href="/view_prenup/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${date_wedding}
    Go To Home Page

Search Prenuptial Record [Groom Middle Initial Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${from_date_created}    ${to_date_created}    ${from_date_wedding}    ${to_date_wedding}    ${date_created}    ${date_wedding}    ${href_reg_num}
    Select From List By Value                           record-type     prenup-option
    Input Text                                          prenup_groom_mid_name      ${groom_mid}
    Set Focus To Element                                prenup-search-submit
    Click Button                                        prenup-search-submit
    Click Element                                       css:*[data-href="/view_prenup/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${date_wedding}
    Go To Home Page

Search Prenuptial Record [Groom Last Name Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${from_date_created}    ${to_date_created}    ${from_date_wedding}    ${to_date_wedding}    ${date_created}    ${date_wedding}    ${href_reg_num}
    Select From List By Value                           record-type     prenup-option
    Input Text                                          prenup_groom_last_name     ${groom_last}
    Set Focus To Element                                prenup-search-submit
    Click Button                                        prenup-search-submit
    Click Element                                       css:*[data-href="/view_prenup/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${date_wedding}
    Go To Home Page

Search Prenuptial Record [Date Created Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${from_date_created}    ${to_date_created}    ${from_date_wedding}    ${to_date_wedding}    ${date_created}    ${date_wedding}    ${href_reg_num}
    Select From List By Value                           record-type     prenup-option
    Input Text                                          prenup_date_created_from   ${from_date_created}
    Input Text                                          prenup_date_created_to     ${to_date_created}
    Set Focus To Element                                prenup-search-submit
    Click Button                                        prenup-search-submit
    Click Element                                       css:*[data-href="/view_prenup/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${date_wedding}
    Go To Home Page

Search Prenuptial Record [Proposed Date Of Wedding Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${from_date_created}    ${to_date_created}    ${from_date_wedding}    ${to_date_wedding}    ${date_created}    ${date_wedding}    ${href_reg_num}
    Select From List By Value                           record-type     prenup-option
    Input Text                                          prenup_date_wedding_from   ${from_date_wedding}
    Input Text                                          prenup_date_wedding_to     ${to_date_wedding}
    Set Focus To Element                                prenup-search-submit
    Click Button                                        prenup-search-submit
    Click Element                                       css:*[data-href="/view_prenup/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${date_wedding}
    Go To Home Page

Search Prenuptial Record [Two Or More Conditions]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${from_date_created}    ${to_date_created}    ${from_date_wedding}    ${to_date_wedding}    ${date_created}    ${date_wedding}    ${href_reg_num}
    Select From List By Value                           record-type     prenup-option
    Input Text                                          prenup_bride_first_name    ${bride_first}
    Input Text                                          prenup_bride_mid_name      ${bride_mid}
    Input Text                                          prenup_groom_first_name    ${groom_first}
    Input Text                                          prenup_groom_mid_name      ${groom_mid}
    Input Text                                          prenup_date_created_from   ${from_date_created}
    Input Text                                          prenup_date_created_to     ${to_date_created}
    Set Focus To Element                                prenup-search-submit
    Click Button                                        prenup-search-submit
    Click Element                                       css:*[data-href="/view_prenup/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${date_wedding}
    Go To Home Page

Search Prenuptial Record [Bride First Name Condition]
    [Arguments]                                         ${bride_first}        ${bride_mid}        ${bride_last}        ${href_reg_num}        ${date_added}        ${groom_first}        ${groom_mid}        ${groom_last}        ${planned_date}
    Select From List By Value                           record-type     prenup-option
    Input Text                                          prenup_bride_first_name        ${bride_first}
    Set Focus To Element                                prenup-search-submit
    Click Button                                        prenup-search-submit
    Click Element                                       css:*[data-href="/view_prenup/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_added}
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${planned_date}
    Go To Home Page

Search Wedding Record [All Conditions]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_bride_first_name             ${bride_first}
    Input Text                                          wedding_bride_middle_name            ${bride_mid}
    Input Text                                          wedding_bride_last_name              ${bride_last}
    Input Text                                          wedding_groom_first_name             ${groom_first}
    Input Text                                          wedding_groom_middle_name            ${groom_mid}
    Input Text                                          wedding_groom_last_name              ${groom_last}
    Input Text                                          wedding_bride_mother_first_name      ${bride_mother_first}
    Input Text                                          wedding_bride_mother_middle_name     ${bride_mother_mid}
    Input Text                                          wedding_bride_mother_last_name       ${bride_mother_last}
    Input Text                                          wedding_bride_father_first_name      ${bride_father_first}
    Input Text                                          wedding_bride_father_middle_name     ${bride_father_mid}
    Input Text                                          wedding_bride_father_last_name       ${bride_father_last}
    Input Text                                          wedding_groom_mother_first_name      ${groom_mother_first}
    Input Text                                          wedding_groom_mother_middle_name     ${groom_mother_mid}
    Input Text                                          wedding_groom_mother_last_name       ${groom_mother_last}
    Input Text                                          wedding_groom_father_first_name      ${groom_father_first}
    Input Text                                          wedding_groom_father_middle_name     ${groom_father_mid}
    Input Text                                          wedding_groom_father_last_name       ${groom_father_last}
    Input Text                                          wedding_date_from                    ${from_date}
    Input Text                                          wedding_date_to                      ${to_date}
    Input Text                                          wedding_location                     ${location}
    Input Text                                          wedding_officiant                    ${officiant}
    Input Text                                          wedding_officer                      ${solemnizing_officer}
    Input Text                                          reg_num                              ${contract_num}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Bride Name Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_bride_first_name             ${bride_first}
    Input Text                                          wedding_bride_middle_name            ${bride_mid}
    Input Text                                          wedding_bride_last_name              ${bride_last}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Groom Name Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_groom_first_name             ${groom_first}
    Input Text                                          wedding_groom_middle_name            ${groom_mid}
    Input Text                                          wedding_groom_last_name              ${groom_last}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Bride Mother Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_bride_mother_first_name      ${bride_mother_first}
    Input Text                                          wedding_bride_mother_middle_name     ${bride_mother_mid}
    Input Text                                          wedding_bride_mother_last_name       ${bride_mother_last}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Bride Father Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_bride_father_first_name      ${bride_father_first}
    Input Text                                          wedding_bride_father_middle_name     ${bride_father_mid}
    Input Text                                          wedding_bride_father_last_name       ${bride_father_last}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Groom Mother Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_groom_mother_first_name      ${groom_mother_first}
    Input Text                                          wedding_groom_mother_middle_name     ${groom_mother_mid}
    Input Text                                          wedding_groom_mother_last_name       ${groom_mother_last}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Groom Father Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_groom_father_first_name      ${groom_father_first}
    Input Text                                          wedding_groom_father_middle_name     ${groom_father_mid}
    Input Text                                          wedding_groom_father_last_name       ${groom_father_last}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Wedding Date Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_date_from                    ${from_date}
    Input Text                                          wedding_date_to                      ${to_date}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Location Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_location                     ${location}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Officiant Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_officiant                    ${officiant}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Solemnizer Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_officer                      ${solemnizing_officer}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Contract Number Condition]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          reg_num                              ${contract_num}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Two Or More Conditions]
    [Arguments]    ${bride_first}    ${bride_mid}    ${bride_last}    ${groom_first}    ${groom_mid}    ${groom_last}    ${bride_mother_first}    ${bride_mother_mid}    ${bride_mother_last}    ${bride_father_first}    ${bride_father_mid}    ${bride_father_last}    ${groom_mother_first}    ${groom_mother_mid}    ${groom_mother_last}    ${groom_father_first}    ${groom_father_mid}    ${groom_father_last}    ${from_date}    ${to_date}    ${location}    ${officiant}    ${solemnizing_officer}    ${href_reg_num}    ${contract_num}    ${date_created}    ${wedding_date}    ${sponsor_male}    ${sponsor_female}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_bride_middle_name            ${bride_mid}
    Input Text                                          wedding_groom_middle_name            ${groom_mid}
    Input Text                                          wedding_bride_mother_middle_name     ${bride_mother_mid}
    Input Text                                          wedding_bride_father_middle_name     ${bride_father_mid}
    Input Text                                          wedding_groom_mother_middle_name     ${groom_mother_mid}
    Input Text                                          wedding_groom_father_middle_name     ${groom_father_mid}
    Input Text                                          wedding_officiant                    ${officiant}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Page Should Contain                                 ${bride_mother_first}
    Page Should Contain                                 ${bride_mother_mid}
    Page Should Contain                                 ${bride_mother_last}
    Page Should Contain                                 ${bride_father_first}
    Page Should Contain                                 ${bride_father_mid}
    Page Should Contain                                 ${bride_father_last}
    Page Should Contain                                 ${groom_mother_first}
    Page Should Contain                                 ${groom_mother_mid}
    Page Should Contain                                 ${groom_mother_last}
    Page Should Contain                                 ${groom_father_first}
    Page Should Contain                                 ${groom_father_mid}
    Page Should Contain                                 ${groom_father_last}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${solemnizing_officer}
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Wedding Record [Groom Condition]
    [Arguments]                                         ${groom_first}        ${groom_mid}        ${groom_last}        ${href_reg_num}        ${contract_num}        ${date_created}        ${wedding_date}        ${bride_first}        ${bride_mid}        ${bride_last}
    Select From List By Value                           record-type     wedding-option
    Input Text                                          wedding_groom_first_name          ${groom_first}
    Input Text                                          wedding_groom_middle_name         ${groom_mid}
    Input Text                                          wedding_groom_last_name           ${groom_last}
    Set Focus To Element                                wedding-search-submit
    Click Button                                        wedding-search-submit
    Click Element                                       css:*[data-href="/view_wedding/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${contract_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${wedding_date}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${bride_first}
    Page Should Contain                                 ${bride_mid}
    Page Should Contain                                 ${bride_last}
    Page Should Contain                                 ${groom_first}
    Page Should Contain                                 ${groom_mid}
    Page Should Contain                                 ${groom_last}
    Go To Home Page

Check Child Dedication Search Result [No Condition]
    Page Should Contain Element   css:*[data-href="/view_dedication/7000001"]
    Page Should Contain Element   css:*[data-href="/view_dedication/7000002"]
    Page Should Contain Element   css:*[data-href="/view_dedication/7000003"]
    Page Should Contain Element   css:*[data-href="/view_dedication/7000004"]
    Go To Home Page

Search Child Dedication [All Conditions]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${guardian_one_first}        ${guardian_one_mid}        ${guardian_one_last}        ${guardian_two_first}        ${guardian_two_mid}        ${guardian_two_last}        ${officiant}        ${location}        ${date}        ${sponsor_male}        ${sponsor_female}        ${from_date}        ${to_date}        ${date_created}
    Select From List By Value                           record-type     dedication-option
    Input Text                                          dedication_first_name           ${first_name}
    Input Text                                          dedication_middle_name          ${middle_initial}
    Input Text                                          dedication_last_name            ${last_name}
    Input Text                                          dedication_mother_first_name    ${guardian_one_first}
    Input Text                                          dedication_mother_middle_name   ${guardian_one_mid}
    Input Text                                          dedication_mother_last_name     ${guardian_one_last}
    Input Text                                          dedication_father_first_name    ${guardian_two_first}
    Input Text                                          dedication_father_middle_name   ${guardian_two_mid}
    Input Text                                          dedication_father_last_name     ${guardian_two_last}
    Input Text                                          dedication_date_from            ${from_date}
    Input Text                                          dedication_date_to              ${to_date}
    Input Text                                          dedication_location             ${location}
    Input Text                                          dedication_officiant            ${officiant}
    Set Focus To Element                                dedication-search-submit
    Click Button                                        dedication-search-submit
    Click Element                                       css:*[data-href="/view_dedication/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${guardian_one_first}
    Page Should Contain                                 ${guardian_one_mid}
    Page Should Contain                                 ${guardian_one_last}
    Page Should Contain                                 ${guardian_two_first}
    Page Should Contain                                 ${guardian_two_mid}
    Page Should Contain                                 ${guardian_two_last}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Child Dedication [Child Name Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${guardian_one_first}        ${guardian_one_mid}        ${guardian_one_last}        ${guardian_two_first}        ${guardian_two_mid}        ${guardian_two_last}        ${officiant}        ${location}        ${date}        ${sponsor_male}        ${sponsor_female}        ${from_date}        ${to_date}        ${date_created}
    Select From List By Value                           record-type     dedication-option
    Input Text                                          dedication_first_name           ${first_name}
    Input Text                                          dedication_middle_name          ${middle_initial}
    Input Text                                          dedication_last_name            ${last_name}
    Set Focus To Element                                dedication-search-submit
    Click Button                                        dedication-search-submit
    Click Element                                       css:*[data-href="/view_dedication/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${guardian_one_first}
    Page Should Contain                                 ${guardian_one_mid}
    Page Should Contain                                 ${guardian_one_last}
    Page Should Contain                                 ${guardian_two_first}
    Page Should Contain                                 ${guardian_two_mid}
    Page Should Contain                                 ${guardian_two_last}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Child Dedication [Mother Name Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${guardian_one_first}        ${guardian_one_mid}        ${guardian_one_last}        ${guardian_two_first}        ${guardian_two_mid}        ${guardian_two_last}        ${officiant}        ${location}        ${date}        ${sponsor_male}        ${sponsor_female}        ${from_date}        ${to_date}        ${date_created}
    Select From List By Value                           record-type     dedication-option
    Input Text                                          dedication_mother_first_name    ${guardian_one_first}
    Input Text                                          dedication_mother_middle_name   ${guardian_one_mid}
    Input Text                                          dedication_mother_last_name     ${guardian_one_last}
    Set Focus To Element                                dedication-search-submit
    Click Button                                        dedication-search-submit
    Click Element                                       css:*[data-href="/view_dedication/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${guardian_one_first}
    Page Should Contain                                 ${guardian_one_mid}
    Page Should Contain                                 ${guardian_one_last}
    Page Should Contain                                 ${guardian_two_first}
    Page Should Contain                                 ${guardian_two_mid}
    Page Should Contain                                 ${guardian_two_last}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Child Dedication [Father Name Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${guardian_one_first}        ${guardian_one_mid}        ${guardian_one_last}        ${guardian_two_first}        ${guardian_two_mid}        ${guardian_two_last}        ${officiant}        ${location}        ${date}        ${sponsor_male}        ${sponsor_female}        ${from_date}        ${to_date}        ${date_created}
    Select From List By Value                           record-type     dedication-option
    Input Text                                          dedication_father_first_name    ${guardian_two_first}
    Input Text                                          dedication_father_middle_name   ${guardian_two_mid}
    Input Text                                          dedication_father_last_name     ${guardian_two_last}
    Set Focus To Element                                dedication-search-submit
    Click Button                                        dedication-search-submit
    Click Element                                       css:*[data-href="/view_dedication/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${guardian_one_first}
    Page Should Contain                                 ${guardian_one_mid}
    Page Should Contain                                 ${guardian_one_last}
    Page Should Contain                                 ${guardian_two_first}
    Page Should Contain                                 ${guardian_two_mid}
    Page Should Contain                                 ${guardian_two_last}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Child Dedication [Dedication Date Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${guardian_one_first}        ${guardian_one_mid}        ${guardian_one_last}        ${guardian_two_first}        ${guardian_two_mid}        ${guardian_two_last}        ${officiant}        ${location}        ${date}        ${sponsor_male}        ${sponsor_female}        ${from_date}        ${to_date}        ${date_created}
    Select From List By Value                           record-type     dedication-option
    Input Text                                          dedication_date_from            ${from_date}
    Input Text                                          dedication_date_to              ${to_date}
    Set Focus To Element                                dedication-search-submit
    Click Button                                        dedication-search-submit
    Click Element                                       css:*[data-href="/view_dedication/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${guardian_one_first}
    Page Should Contain                                 ${guardian_one_mid}
    Page Should Contain                                 ${guardian_one_last}
    Page Should Contain                                 ${guardian_two_first}
    Page Should Contain                                 ${guardian_two_mid}
    Page Should Contain                                 ${guardian_two_last}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Child Dedication [Officiant Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${guardian_one_first}        ${guardian_one_mid}        ${guardian_one_last}        ${guardian_two_first}        ${guardian_two_mid}        ${guardian_two_last}        ${officiant}        ${location}        ${date}        ${sponsor_male}        ${sponsor_female}        ${from_date}        ${to_date}        ${date_created}
    Select From List By Value                           record-type     dedication-option
    Input Text                                          dedication_officiant            ${officiant}
    Set Focus To Element                                dedication-search-submit
    Click Button                                        dedication-search-submit
    Click Element                                       css:*[data-href="/view_dedication/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${guardian_one_first}
    Page Should Contain                                 ${guardian_one_mid}
    Page Should Contain                                 ${guardian_one_last}
    Page Should Contain                                 ${guardian_two_first}
    Page Should Contain                                 ${guardian_two_mid}
    Page Should Contain                                 ${guardian_two_last}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Child Dedication [Two Or More Conditions]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${guardian_one_first}        ${guardian_one_mid}        ${guardian_one_last}        ${guardian_two_first}        ${guardian_two_mid}        ${guardian_two_last}        ${officiant}        ${location}        ${date}        ${sponsor_male}        ${sponsor_female}        ${from_date}        ${to_date}        ${date_created}
    Select From List By Value                           record-type     dedication-option
    Input Text                                          dedication_first_name           ${first_name}
    Input Text                                          dedication_mother_first_name    ${guardian_one_first}
    Input Text                                          dedication_father_first_name    ${guardian_two_first}
    Input Text                                          dedication_date_from            ${from_date}
    Input Text                                          dedication_date_to              ${to_date}
    Input Text                                          dedication_officiant            ${officiant}
    Set Focus To Element                                dedication-search-submit
    Click Button                                        dedication-search-submit
    Click Element                                       css:*[data-href="/view_dedication/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${date_created}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${guardian_one_first}
    Page Should Contain                                 ${guardian_one_mid}
    Page Should Contain                                 ${guardian_one_last}
    Page Should Contain                                 ${guardian_two_first}
    Page Should Contain                                 ${guardian_two_mid}
    Page Should Contain                                 ${guardian_two_last}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Child Dedication [Location Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${guardian_one_first}        ${guardian_one_mid}        ${guardian_one_last}        ${guardian_two_first}        ${guardian_two_mid}        ${guardian_two_last}        ${officiant}        ${location}        ${date}        ${sponsor_male}        ${sponsor_female}
    Select From List By Value                           record-type     dedication-option
    Input Text                                          dedication_location         ${location}
    Set Focus To Element                                dedication-search-submit
    Click Button                                        dedication-search-submit
    Click Element                                       css:*[data-href="/view_dedication/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${guardian_one_first}
    Page Should Contain                                 ${guardian_one_mid}
    Page Should Contain                                 ${guardian_one_last}
    Page Should Contain                                 ${guardian_two_first}
    Page Should Contain                                 ${guardian_two_mid}
    Page Should Contain                                 ${guardian_two_last}
    Page Should Contain                                 ${officiant}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${location}
    Page Should Contain                                 ${sponsor_male}
    Page Should Contain                                 ${sponsor_female}
    Go To Home Page

Search Baptismal Record [Baptized First Name Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${officiant_first}        ${officiant_mid}        ${officiant_last}        ${date}        ${location}
    Select From List By Value                           record-type     baptismal-option
    Input Text                                          baptism_first_name    ${first_name}
    Set Focus To Element                                baptismal-search-submit
    Click Button                                        baptismal-search-submit
    Click Element                                       css:*[data-href="/view_baptismal/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${officiant_first}
    Page Should Contain                                 ${officiant_mid}
    Page Should Contain                                 ${officiant_last}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${location}
    Go To Home Page

Search Baptismal Record [Baptized Middle Initial Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${officiant_first}        ${officiant_mid}        ${officiant_last}        ${date}        ${location}
    Select From List By Value                           record-type     baptismal-option
    Input Text                                          baptism_middle_name    ${middle_initial}
    Set Focus To Element                                baptismal-search-submit
    Click Button                                        baptismal-search-submit
    Click Element                                       css:*[data-href="/view_baptismal/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${officiant_first}
    Page Should Contain                                 ${officiant_mid}
    Page Should Contain                                 ${officiant_last}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${location}
    Go To Home Page

Search Baptismal Record [Baptized Last Name Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${officiant_first}        ${officiant_mid}        ${officiant_last}        ${date}        ${location}
    Select From List By Value                           record-type     baptismal-option
    Input Text                                          baptism_last_name    ${last_name}
    Set Focus To Element                                baptismal-search-submit
    Click Button                                        baptismal-search-submit
    Click Element                                       css:*[data-href="/view_baptismal/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${officiant_first}
    Page Should Contain                                 ${officiant_mid}
    Page Should Contain                                 ${officiant_last}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${location}
    Go To Home Page

Search Baptismal Record [Date Of Baptism Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${officiant_first}        ${officiant_mid}        ${officiant_last}        ${date}        ${location}    ${from_date}    ${to_date}
    Select From List By Value                           record-type     baptismal-option
    Input Text                                          baptismal_date_from    ${from_date}
    Input Text                                          baptismal_date_to      ${to_date}
    Set Focus To Element                                baptismal-search-submit
    Click Button                                        baptismal-search-submit
    Click Element                                       css:*[data-href="/view_baptismal/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${officiant_first}
    Page Should Contain                                 ${officiant_mid}
    Page Should Contain                                 ${officiant_last}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${location}
    Go To Home Page

Search Baptismal Record [Baptism Location Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${officiant_first}        ${officiant_mid}        ${officiant_last}        ${date}        ${location}
    Select From List By Value                           record-type     baptismal-option
    Input Text                                          baptismal_location    ${location}
    Set Focus To Element                                baptismal-search-submit
    Click Button                                        baptismal-search-submit
    Click Element                                       css:*[data-href="/view_baptismal/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${officiant_first}
    Page Should Contain                                 ${officiant_mid}
    Page Should Contain                                 ${officiant_last}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${location}
    Go To Home Page

Search Baptismal Record [Officiant First Name Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${officiant_first}        ${officiant_mid}        ${officiant_last}        ${date}        ${location}
    Select From List By Value                           record-type     baptismal-option
    Input Text                                          baptism_officiant_first_name    ${officiant_first}
    Set Focus To Element                                baptismal-search-submit
    Click Button                                        baptismal-search-submit
    Click Element                                       css:*[data-href="/view_baptismal/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${officiant_first}
    Page Should Contain                                 ${officiant_mid}
    Page Should Contain                                 ${officiant_last}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${location}
    Go To Home Page

Search Baptismal Record [Officiant Middle Initial Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${officiant_first}        ${officiant_mid}        ${officiant_last}        ${date}        ${location}
    Select From List By Value                           record-type     baptismal-option
    Input Text                                          baptism_officiant_middle_name    ${officiant_mid}
    Set Focus To Element                                baptismal-search-submit
    Click Button                                        baptismal-search-submit
    Click Element                                       css:*[data-href="/view_baptismal/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${officiant_first}
    Page Should Contain                                 ${officiant_mid}
    Page Should Contain                                 ${officiant_last}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${location}
    Go To Home Page

Search Baptismal Record [Officiant Last Name Condition]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${officiant_first}        ${officiant_mid}        ${officiant_last}        ${date}        ${location}
    Select From List By Value                           record-type     baptismal-option
    Input Text                                          baptism_officiant_last_name    ${officiant_last}
    Set Focus To Element                                baptismal-search-submit
    Click Button                                        baptismal-search-submit
    Click Element                                       css:*[data-href="/view_baptismal/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${officiant_first}
    Page Should Contain                                 ${officiant_mid}
    Page Should Contain                                 ${officiant_last}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${location}
    Go To Home Page

Search Baptismal Record [Atleast Two Conditions]
    [Arguments]                                         ${first_name}        ${middle_initial}        ${last_name}        ${href_reg_num}        ${officiant_first}        ${officiant_mid}        ${officiant_last}        ${date}        ${location}
    Select From List By Value                           record-type     baptismal-option
    Input Text                                          baptism_last_name              ${last_name}
    Input Text                                          baptism_officiant_last_name    ${officiant_last}
    Input Text                                          baptismal_location             ${location}
    Set Focus To Element                                baptismal-search-submit
    Click Button                                        baptismal-search-submit
    Click Element                                       css:*[data-href="/view_baptismal/${href_reg_num}"]
    Page Should Contain                                 ${href_reg_num}
    Page Should Contain                                 ${first_name}
    Page Should Contain                                 ${middle_initial}
    Page Should Contain                                 ${last_name}
    Page Should Contain                                 ${officiant_first}
    Page Should Contain                                 ${officiant_mid}
    Page Should Contain                                 ${officiant_last}
    Page Should Contain                                 ${date}
    Page Should Contain                                 ${location}
    Go To Home Page