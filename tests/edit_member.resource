*** Settings ***
Documentation       A resource file with reusable keywords and variables
...
...                 Creating system specific keywords from default keywords
...                 from SeleniumLibrary

Library             SeleniumLibrary
Variables           variables.py
Resource            common.resource

*** Keywords ***
Return To Main Menu
    Wait Until Page Contains Element    css:*[data-icon="sign-out-alt"]
    Click Element                       css:*[data-icon="sign-out-alt"]

Has No Access To Edit (Level 1)
    Page Should Contain                 Add Member

Go To Add Members 1
    Wait Until Page Contains Element    css:*[src="../images/people.png"]
    Click Image                         ../images/people.png

Go To Level 3 Home Page
    Wait Until Page Contains Element    id:header
    Click Element                       id:header

Go To Edit Members
    [Arguments]                         ${member}
    Go To Add Members 1
    Wait Until Page Contains Element    css:*[data-href="/member/${member}"]
    Click Element                       css:*[data-href="/member/${member}"]
    Scroll To Element                   css:*[href="/edit_member/${member}"]
    Click Element                       css:*[href="/edit_member/${member}"]

Has No Access To Edit (Level 2)
    [Arguments]                         ${member}
    Go To Add Members 1
    Wait Until Page Contains Element    css:*[data-href="/member/${member}"]
    Click Element                       css:*[data-href="/member/${member}"]
    Page Should Not Contain             Edit Member

Has Access To Edit
    Go To Edit Members                  1
    Page Should Contain                 Edit Member

Change First Name
    [Arguments]                         ${first_name}
    Input Text                          id:first_name               ${first_name}

Change Middle Initial
    [Arguments]                         ${middle_initial}
    Input Text                          id:mid_name                 ${middle_initial}

Change Last Name
    [Arguments]                         ${last_name}
    Input Text                          id:last_name                ${last_name}

Change Membership Status
    [Arguments]                         ${membership_status}
    Select From List By Label           id:membership_status        ${membership_status}

Change Civil Status
    [Arguments]                         ${civil_status}
    Select From List By Label           id:civil_status             ${civil_status}

Change Sex
    [Arguments]                         ${sex}
    Select From List By Label           id:sex                      ${sex}

Change Birthday
    [Arguments]                         ${birthday}
    Input Text                          id:birthday                 ${birthday}

Change Occupation
    [Arguments]                         ${occupation}
    Input Text                          id:occupation               ${occupation}

Change Mobile Number
    [Arguments]                         ${mobile_number}
    Input Text                          id:mobile                   ${mobile_number}
    
Change Telephone Number
    [Arguments]                         ${telephone_number}
    Input Text                          id:telephone                ${telephone_number}

Change Workplace
    [Arguments]                         ${workplace}
    Input Text                          id:workplace                ${workplace}

Change Email
    [Arguments]                         ${email}
    Input Text                          id:email                ${email}

Change Educational Attainment
    [Arguments]                         ${educational_attainment}
    Input Text                          id:educational_attainment                ${educational_attainment}

Change Alma Mater
    [Arguments]                         ${alma_mater}
    Input Text                          id:alma_mater                            ${alma_mater}

Change Family Members
    [Arguments]                         ${family_members}
    Input Text                          id:family_members                        ${family_members}

Change Skills
    [Arguments]                         ${skills}
    Input Text                          id:skills                                ${skills}

Change Address Line 1
    [Arguments]                         ${address_line}
    Input Text                          id:address_line                          ${address_line}

Change Address Line 2
    [Arguments]                         ${address_line2}
    Input Text                          id:address_line2                         ${address_line2}

Change City
    [Arguments]                         ${city}
    Input Text                          id:city                                  ${city}

Change Province
    [Arguments]                         ${province}
    Input Text                          id:province                              ${province}

Change Postal Code
    [Arguments]                         ${postal_code}
    Input Text                          id:postal_code                           ${postal_code}

Change Country
    [Arguments]                         ${country}
    Input Text                          id:country                               ${country}

Check First Name
    [Arguments]                         ${first_name}
    Page Should Contain                 ${first_name}

Check Middle Initial
    [Arguments]                         ${middle_initial}
    Page Should Contain                 ${middle_initial}

Check Last Name
    [Arguments]                         ${last_name}
    Page Should Contain                 ${last_name}

Check Membership Status
    [Arguments]                         ${membership_status}
    Page Should Contain                 ${membership_status}

Check Civil Status
    [Arguments]                         ${civil_status}
    Page Should Contain                 ${civil_status}

Check Sex
    [Arguments]                         ${sex}
    Page Should Contain                 ${sex}

Check Birthday
    [Arguments]                         ${birthday}
    Page Should Contain                 ${birthday}

Check Occupation
    [Arguments]                         ${occupation}
    Page Should Contain                 ${occupation}

Check Mobile Number
    [Arguments]                         ${mobile_number}
    Page Should Contain                 ${mobile_number}
    
Check Telephone Number
    [Arguments]                         ${telephone_number}
    Page Should Contain                 ${telephone_number}

Check Workplace
    [Arguments]                         ${workplace}
    Page Should Contain                 ${workplace}

Check Email
    [Arguments]                         ${email}
    Page Should Contain                 ${email}

Check Educational Attainment
    [Arguments]                         ${educational_attainment}
    Page Should Contain                 ${educational_attainment}

Check Alma Mater
    [Arguments]                         ${alma_mater}
    Page Should Contain                 ${alma_mater}

Check Family Members
    [Arguments]                         ${family_members}
    Page Should Contain                 ${family_members}

Check Skills
    [Arguments]                         ${skills}
    Page Should Contain                 ${skills}

Check Address Line 1
    [Arguments]                         ${address_line}
    Page Should Contain                 ${address_line}

Check Address Line 2
    [Arguments]                         ${address_line2}
    Page Should Contain                 ${address_line2}

Check City
    [Arguments]                         ${city}
    Page Should Contain                 ${city}

Check Province
    [Arguments]                         ${province}
    Page Should Contain                 ${province}

Check Postal Code
    [Arguments]                         ${postal_code}
    Page Should Contain                 ${postal_code}

Check Country
    [Arguments]                         ${country}
    Page Should Contain                 ${country}

Submit Edit
    Wait Until Page Contains Element    id:edit-member
    Scroll To Element                   id:edit-member
    Click Element                       id:edit-member

Edit Member [All Inputs]
    Change First Name                   Jonathan
    Change Middle Initial               N
    Change Last Name                    Starfish
    Change Membership Status            Inactive
    Change Civil Status                 Married
    Change Sex                          Female
    Change Birthday                     02222001
    Change Occupation                   Engineer
    Change Mobile Number                09332224444
    Change Telephone Number             5221234
    Change Workplace                    Taguig
    Change Email                        jonathan@yahoo.com
    Change Educational Attainment       Masters
    Change Alma Mater                   University of Santo Tomas
    Change Family Members               Starfish Family
    Change Skills                       Basketball
    Change Address Line 1               Street 1
    Change Address Line 2               Block 1
    Change City                         Oklahoma
    Change Province                     Cebu
    Change Postal Code                  1000
    Change Country                      Philippines
    Submit Edit
    Wait Until Page Contains            Jonathan
    Check First Name                    Jonathan
    Check Middle Initial                N
    Check Last Name                     Starfish
    Check Membership Status             Inactive
    Check Civil Status                  Married
    Check Birthday                      02/22/2001
    Check Occupation                    Engineer
    Check Mobile Number                 09332224444
    Check Telephone Number              5221234
    Check Workplace                     Taguig
    Check Email                         jonathan@yahoo.com
    Check Educational Attainment        Masters
    Check Alma Mater                    University of Santo Tomas
    Check Family Members                Starfish Family
    Check Skills                        Basketball
    Check Address Line 1                Street 1
    Check Address Line 2                Block 1
    Check City                          Oklahoma
    Check Province                      Cebu
    Check Postal Code                   1000
    Check Country                       Philippines