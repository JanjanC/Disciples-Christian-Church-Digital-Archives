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
    Add Member                              John    D    Smith     02      22      2001    Student     Block 1     Manila      Philippines
    Check Added Member                      John    D    Smith     02      22      2001    Student     Block 1     Manila      Philippines
    Delete Member

Register with Level 2 [Required Only]
    Open Browser To Login Page
    Input Pass                      ${LEVEL 2 PASSWORD}
    Submit Credentials
    Menu Page 2 Should Be Open
    Go To Add Members 2
    Add Member                              Liza    G    Morant     06      10      1969    Housewife     Street 10     Makati      Philippines
    Check Added Member                      Liza    G    Morant     06      10      1969    Housewife     Street 10     Makati      Philippines
    Delete Member

Register with Level 3 [Required Only]
    Open Browser To Login Page
    Input Pass                      ${LEVEL 3 PASSWORD}
    Submit Credentials
    Menu Page 3 Should Be Open
    Go To Add Members 2
    Add Member                              Henry    B    Xavier     03      20      1974    IT Consultant     Lot 15     Taguig      Philippines
    Check Added Member                      Henry    B    Xavier     03      20      1974    IT Consultant     Lot 15     Taguig      Philippines
    Delete Member

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
    Go To Add Observation           1
    Add Valid Observation
    Check Observation               Mark     nice

Invalid Observation
    Open Browser To Login Page
    Input Pass                      ${LEVEL 3 PASSWORD}
    Submit Credentials
    Menu Page 3 Should Be Open
    Go To Add Observation           1
    Add Invalid Observation
    Check Invalid Observation

Add Member Skill
    Open Browser To Login Page
    Input Pass                      ${LEVEL 3 PASSWORD}
    Submit Credentials
    Menu Page 3 Should Be Open
    Go To Edit Members              1
    Add Skill
    Check Added Skill

Register with Level 0 [Required Only]
    Open Browser To Login Page
    Go To Level 0 Member Registration
    Add Member                              John    D    Blake     04      11      2001    Student     Block 5     Tarlac      Philippines
    Check Added Member                      John    D    Blake     04      11      2001    Student     Block 5     Tarlac      Philippines
    Delete Member