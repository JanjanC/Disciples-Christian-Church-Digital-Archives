*** Settings ***
Documentation     A test suite with a single test for valid login
...
...               This test follows the example using keywords from
...               the SeleniumLibrary
Resource          login.resource
Resource          prenuptial.resource
Test Teardown     Close Browser

*** Test Cases ***
Complete Non-Member Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open

Complete Non-Member Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open

Complete Non-Member Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
# INCOMPLETE Complete Member Input (Level 1)
#    Open Browser to Login Page
#    Login Level 1 User
#    Main Page Should Be Open
#    Navigate to Prenuptial Page
#    Add Prenuptial Page Should Be Open
#    Select Member Bride Form
#    Select Member Groom Form
#    #TODO: Select Bride and Groom
#    Input Current Date    08    02    2021
#    Input Wedding Date    10    23    2021
#    Submit Prenuptial Form
#    View Prenuptial Page Should Be Open

Blank Non-Member Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Non-Member Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Non-Member Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Member Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Member Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Member Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Incomplete Non-Member Bride Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    ${EMPTY}
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Non-Member Groom Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    ${EMPTY}
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Non-Member Current Date Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Member Wedding Date Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Member Bride Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    ${EMPTY}
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Non-Member Groom Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    ${EMPTY}
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Non-Member Current Date Input (Level 2)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Member Wedding Date Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown
#

Incomplete Non-Member Bride Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    ${EMPTY}
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Non-Member Groom Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    ${EMPTY}
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Non-Member Current Date Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Member Wedding Date Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to Create Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown
