*** Settings ***
Documentation   A resource file with reusable keywords and variables
...
...              Creating system specific keywords from default keywords
...              from SeleniumLibrary
Library          SeleniumLibrary
*** Variables ***
${SERVER}              localhost:8080
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
    Click Image                     ../images/people.png
    Sleep                           2

Go To Add Members 2
    Go To Add Members 1
    Click Element                   css:*[data-icon="plus-square"]
    Sleep                           2

Go To Edit Members
    [Arguments]                     ${member}
    Go To Add Members 1
    Set Focus To Element            css:*[data-href="/member/${member}"]
    Sleep                           2
    Click Element                   css:*[data-href="/member/${member}"]
    Sleep                           2
    Set Focus To Element            css:*[href="/edit_member/${member}"]
    Sleep                           2
    Click Element                   css:*[href="/edit_member/${member}"]
    Sleep                           2

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