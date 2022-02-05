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

Menu Page 1 Should Be Open
    Element Text Should Be          id:header    Disciple Christian Church | Level 1
    Sleep                           2

Menu Page 2 Should Be Open
    Element Text Should Be          id:header    Disciple Christian Church | Level 2
    Sleep                           2

Menu Page 3 Should Be Open
    Element Text Should Be          id:header    Disciple Christian Church | Level 3
    Sleep                           2

Input Pass
    [Arguments]                     ${password}
    Input Password                  password    ${password}

Submit Credentials
    Press Keys                      none    ENTER
    Sleep                           2

Go To Add Members 1
    Wait Until Page Contains Element    css:*[src="../images/people.png"]
    Click Image                         ../images/people.png

Go To Add Members 2
    Go To Add Members 1
    Wait Until Page Contains Element    css:*[data-icon="plus-square"]
    Click Element                       css:*[data-icon="plus-square"]

Go To Edit Members
    [Arguments]                         ${member}
    Go To Add Members 1
    Wait Until Page Contains Element    css:*[data-href="/member/${member}"]
    Click Element                       css:*[data-href="/member/${member}"]
    Wait Until Page Contains Element    css:*[href="/edit_member/${member}"]
    Click Element                       css:*[href="/edit_member/${member}"]

Enter Member Information
    Set Focus To Element            create-member
    Sleep                           2
    Press Keys                      create-member    ENTER
    Sleep                           2

Enter Edited Information
    Set Focus To Element            edit-member
    Sleep                           2
    Press Keys                      edit-member    ENTER
    Sleep                           2

Add Member
    [Arguments]                     ${first name}   ${middle initial}   ${last name}    ${month}     ${day}      ${year}     ${occupation}       ${address}      ${city}     ${country}
    Input Text                      first_name      ${first name}
    Input Text                      mid_name        ${middle initial}
    Input Text                      last_name       ${last name}
    Input Text                      birthday        ${month}${day}${year}
    Input Text                      occupation      ${occupation}
    Input Text                      address_line    ${address}
    Input Text                      city            ${city}
    Input Text                      country         ${country}
    Enter Member Information

Edit Member
    [Arguments]                     ${first name}   ${middle initial}   ${last name}    ${month}     ${day}      ${year}     ${occupation}       ${address}      ${city}     ${country}
    Input Text                      first_name      ${first name}
    Input Text                      mid_name        ${middle initial}
    Input Text                      last_name       ${last name}
    Input Text                      birthday        ${month}${day}${year}
    Input Text                      occupation      ${occupation}
    Input Text                      address_line    ${address}
    Input Text                      city            ${city}
    Input Text                      country         ${country}
    Enter Edited Information

Check Added Member
    [Arguments]                     ${first name}   ${middle initial}   ${last name}    ${month}     ${day}      ${year}     ${occupation}       ${address}      ${city}     ${country}
    Page Should Contain             ${first name}
    Page Should Contain             ${middle initial}
    Page Should Contain             ${last name}
    Page Should Contain             ${month}/${day}/${year}
    Page Should Contain             ${occupation}
    Page Should Contain             ${address}
    Page Should Contain             ${city}
    Page Should Contain             ${country}
    Sleep                           2

Check Edited Member
    [Arguments]                     ${first name}   ${middle initial}   ${last name}    ${month}     ${day}      ${year}     ${occupation}       ${address}      ${city}     ${country}
    Page Should Contain             ${first name}
    Page Should Contain             ${middle initial}
    Page Should Contain             ${last name}
    Page Should Contain             ${month}/${day}/${year}
    Page Should Contain             ${occupation}
    Page Should Contain             ${address}
    Page Should Contain             ${city}
    Page Should Contain             ${country}
    Sleep                           2

Input Invalid Mobile Number
    Input Text                      mobile          1234abcd

Input Valid Mobile Number
    Input Text                      mobile          09213997777

Is Invalid Mobile Number
    Element Should Contain          mobile_error    Enter valid mobile number

Is Valid Mobile Number
    Element Should Contain          mobile_error    ${EMPTY}

Input Invalid Telephone Number
    Input Text                      telephone          1234abcd

Input Valid Telephone Number
    Input Text                      telephone          09213997777

Is Invalid Telephone Number
    Element Should Contain          telephone_error    Enter valid telephone number

Is Valid Telephone Number
    Element Should Contain          telephone_error    ${EMPTY}

Input Invalid Email
    Input Text                      email          a

Input Valid Email
    Input Text                      email          a@gmail.com

Is Invalid Email
    Element Should Contain          email_error    Enter valid email

Is Valid Email
    Element Should Contain          email_error    ${EMPTY}

Input Date
    [Arguments]                     ${month}        ${day}      ${year}
    Input Text                      birthday        ${month}${day}${year}

Is Invalid Date
    Element Should Contain          birthday_error  Required

Is Valid Date
    Element Should Contain          birthday_error  ${EMPTY}

Check Blank Input Error
    Element Should Contain      first_name_error        Required
    Element Should Contain      first_name_error        Required
    Element Should Contain      first_name_error        Required
    Element Should Contain      first_name_error        Required
    Element Should Contain      first_name_error        Required
    Element Should Contain      first_name_error        Required
    Element Should Contain      first_name_error        Required
    Element Should Contain      first_name_error        Required

Error Message Shown
    [Arguments]    ${error}
    Element Text Should Be          class:modal-body    ${error}
    Sleep                           2

Go To Add Observation
    [Arguments]                     ${member}
    Go To Edit Members              ${member}
    Set Focus To Element            addObservationBtn
    Sleep                           2
    Press Keys                      addObservationBtn    ENTER
    Sleep                           2

Add Valid Observation
    Input Text                      commenter           Jay
    Input Text                      comment             short
    Set Focus To Element            saveObservationBtn
    Sleep                           2
    Press Keys                      saveObservationBtn    ENTER
    Sleep                           2

Check Observation
    [Arguments]                     ${commenter}        ${comment}
    Element Should Contain          css:*[class="card-text observer"]       ${commenter}
    Element Should Contain          css:*[class="comment"]                  ${comment}

Add Invalid Observation
    Input Text                      commenter           ${EMPTY}
    Input Text                      comment             ${EMPTY}
    Set Focus To Element            saveObservationBtn
    Sleep                           2
    Press Keys                      saveObservationBtn    ENTER
    Sleep                           2

Check Invalid Observation
    Element Should Contain          commenter_error     Enter commenter
    Element Should Contain          comment_error       Enter comment

Add Skill
    Input Text                      skills              golfing
    Enter Edited Information

Check Added Skill
    Page Should Contain             golfing

Go To Member
    [Arguments]                     ${member}
    Go To Add Members 1
    Set Focus To Element            css:*[data-href="/member/${member}"]
    Sleep                           2
    Click Element                   css:*[data-href="/member/${member}"]
    Sleep                           2
    Page Should Not Contain         Edit Member

Go To Edit Observation
    [Arguments]                     ${member}
    Go To Edit Members              ${member}
    Assign Id To Element            css:*[data-icon="edit"]       edit
    Press Keys                      edit        ENTER
    Sleep                           2

Edit Observation
    Input Text                      comment             tall
    Set Focus To Element            saveObservationBtn
    Sleep                           2
    Press Keys                      saveObservationBtn    ENTER
    Sleep                           2

Return To Main Menu
    Wait Until Page Contains Element    css:*[data-icon="sign-out-alt"]
    Click Element                       css:*[data-icon="sign-out-alt"]

Has No Access To Edit (Level 1)
    Page Should Contain                 Add Member

Go To Level 3 Home Page
    Wait Until Page Contains Element    id:header
    Click Element                       id:header

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

Go To Level 0 Member Registration
    Wait Until Element Is Visible       id:member-reg-btn
    Click Element                       id:member-reg-btn