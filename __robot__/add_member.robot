*** Settings ***
Documentation   A test suite with for the old Register feature created during CSSWENG. 
...
...              This test follows the example using keywords from
...              the SeleniumLibrary
Resource         member.resource
Test Teardown    Close Browser

*** Test Cases ***
Register with Level 1 [Required Only]
    Open Browser To Login Page
    Input Pass                      ${LEVEL 1 PASSWORD}
    Submit Credentials
    Menu Page 1 Should Be Open
    Go To Add Members 1
    Add Member                              John    D    Bainto     02      22      2001    Student     Block 1     Manila      Philippines
    Check Added Member                      John    D    Bainto     02      22      2001    Student     Block 1     Manila      Philippines

Register with Level 2 [Required Only]
    Open Browser To Login Page
    Input Pass                      ${LEVEL 2 PASSWORD}
    Submit Credentials
    Menu Page 2 Should Be Open
    Go To Add Members 2
    Add Member                              Meliza    D    Bainto     03      20      1969    Housewife     Block 1     Manila      Philippines
    Check Added Member                      Meliza    D    Bainto     03      20      1969    Housewife     Block 1     Manila      Philippines

Register with Level 3 [Required Only]
    Open Browser To Login Page
    Input Pass                      ${LEVEL 3 PASSWORD}
    Submit Credentials
    Menu Page 3 Should Be Open
    Go To Add Members 2
    Add Member                              Henry    B    Bainto     03      30      1974    IT Consultant     Block 1     Manila      Philippines
    Check Added Member                      Henry    B    Bainto     03      30      1974    IT Consultant     Block 1     Manila      Philippines

Blank Inputs
    Open Browser To Login Page
    Input Pass                      ${LEVEL 3 PASSWORD}
    Submit Credentials
    Menu Page 3 Should Be Open
    Go To Add Members 2
    Enter Member Information
    Check Blank Input Error

Validate Mobile Number
    Open Browser To Login Page
    Input Pass                      ${LEVEL 1 PASSWORD}
    Submit Credentials
    Menu Page 1 Should Be Open
    Go To Add Members 1
    Input Invalid Mobile Number
    Enter Member Information
    Is Invalid Mobile Number
    Input Valid Mobile Number
    Enter Member Information
    Is Valid Mobile Number

Validate Date
    Open Browser To Login Page
    Input Pass                      ${LEVEL 1 PASSWORD}
    Submit Credentials
    Menu Page 1 Should Be Open
    Go To Add Members 1
    Input Date                      aa      aa      aaaa
    Enter Member Information
    Is Invalid Date
    Input Date                      01      01      2000
    Enter Member Information
    Is Valid Date

Validate Telephone Number
    Open Browser To Login Page
    Input Pass                      ${LEVEL 1 PASSWORD}
    Submit Credentials
    Menu Page 1 Should Be Open
    Go To Add Members 1
    Input Invalid Telephone Number
    Enter Member Information
    Is Invalid Telephone Number
    Input Valid Telephone Number
    Enter Member Information
    Is Valid Telephone number

Validate Email
    Open Browser To Login Page
    Input Pass                      ${LEVEL 1 PASSWORD}
    Submit Credentials
    Menu Page 1 Should Be Open
    Go To Add Members 1
    Input Invalid Email
    Enter Member Information
    Is Invalid Email
    Input Valid Email
    Enter Member Information
    Is Valid Email

Add Observation
    Open Browser To Login Page
    Input Pass                      ${LEVEL 3 PASSWORD}
    Submit Credentials
    Menu Page 3 Should Be Open
    Go To Add Observation           1000001
    Add Valid Observation
    Check Observation               Jay     short

Invalid Observation
    Open Browser To Login Page
    Input Pass                      ${LEVEL 3 PASSWORD}
    Submit Credentials
    Menu Page 3 Should Be Open
    Go To Add Observation           1000002
    Add Invalid Observation
    Check Invalid Observation

Add Member Skill
    Open Browser To Login Page
    Input Pass                      ${LEVEL 3 PASSWORD}
    Submit Credentials
    Menu Page 3 Should Be Open
    Go To Edit Members              1000001
    Add Skill
    Check Added Skill