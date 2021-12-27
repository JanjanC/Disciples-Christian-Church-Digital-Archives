*** Settings ***
Documentation     A test suite with a single test for valid login
...
...               This test follows the example using keywords from
...               the SeleniumLibrary
Resource          login.resource
Resource          prenuptial.resource
Test Teardown     Close Browser

*** Test Cases ***
Navigate to Add Prenuptial Page (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open

Navigate to Add Prenuptial Page (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open

Navigate to Add Prenuptial Page (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open

#Test Scripts for Non-Member Bride and Non-Member Groom
Complete Non-Members Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Complete Non-Members Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Harley    W    Farmer
    Input Non Member Groom Details    Elroy    B    Spalding
    Input Current Date    08    02    2021
    Input Wedding Date    09    09    2021
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Complete Non-Members Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Leola    R    Matthews
    Input Non Member Groom Details    Clayton    S    Kersey
    Input Current Date    08    02    2021
    Input Wedding Date    05    14    2022
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Blank Non-Members Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Non-Members Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Non-Members Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Incomplete Non-Members - Bride Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    ${EMPTY}
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Non-Members - Groom Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    ${EMPTY}
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Non-Members - Current Date Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Members - Wedding Date Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Members - Bride Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    ${EMPTY}
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Non-Members - Groom Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    ${EMPTY}
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Non-Members - Current Date Input (Level 2)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Members - Wedding Date Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Members - Bride Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    ${EMPTY}
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Non-Members - Groom Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    ${EMPTY}
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Non-Members - Current Date Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Members - Wedding Date Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

#Test Scripts for Member Bride and Member Groom
Complete Members Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Bride
    Select Random Member Groom
    Input Current Date    08    07    2021
    Input Wedding Date    12    11    2021
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Complete Members Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Bride
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    02    22    2023
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Complete Members Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Bride
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    09    25    2021
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Blank Members Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Members Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Members Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Incomplete Members - Bride Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Members - Groom Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Bride
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Members - Current Date Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Bride
    Select Random Member Groom
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Members - Wedding Date Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Bride
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Members - Bride Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Members - Groom Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Bride
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Members - Current Date Input (Level 2)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Bride
    Select Random Member Groom
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Members - Wedding Date Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Bride
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Members - Bride Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Members - Groom Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Bride
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Members - Current Date Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Bride
    Select Random Member Groom
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Members - Wedding Date Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Member Groom Form
    Select Random Member Bride
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

#Test Scripts for Non-Member Bride and Member Groom
Complete Non-Member Bride and Member Groom Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Select Random Member Groom
    Input Current Date    08    07    2021
    Input Wedding Date    07    13    2022
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Complete Non-Member Bride and Member Groom Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Select Random Member Groom
    Input Current Date    08    07    2021
    Input Wedding Date    07    13    2022
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Complete Non-Member Bride and Member Groom Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Anne    M    Rio
    Select Random Member Groom
    Input Current Date    08    07    2021
    Input Wedding Date    09    30    2021
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Blank Non-Member Bride and Member Groom Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Non-Member Bride and Member Groom Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Non-Member Bride and Member Groom Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Incomplete Non-Member Bride and Member Groom - Bride Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    ${EMPTY}
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Non-Member Bride and Member Groom - Groom Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Non-Member Bride and Member Groom - Current Date Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Select Random Member Groom
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Member Bride and Member Groom - Wedding Date Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Member Bride and Member Groom - Bride Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    ${EMPTY}
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Non-Member Bride and Member Groom - Groom Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Non-Member Bride and Member Groom - Current Date Input (Level 2)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
   Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Select Random Member Groom
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Member Bride and Member Groom - Wedding Date Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Member Bride and Member Groom - Bride Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    ${EMPTY}
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Non-Member Bride and Member Groom - Groom Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Non-Member Bride and Member Groom - Current Date Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Select Random Member Groom
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Non-Member Bride and Member Groom - Wedding Date Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Non-Member Bride Form
    Select Member Groom Form
    Input Non Member Bride Details    Gabriela    S    Luna
    Select Random Member Groom
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

#Test Scripts for Member Bride and Non-Member Groom
Complete Member Bride and Non-Member Groom Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Select Random Member Bride
    Input Non Member Groom Details    Juan    A    Dela Cruz
    Input Current Date    08    07    2021
    Input Wedding Date    11    06    2021
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Complete Member Bride and Non-Member Groom Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Select Random Member Bride
    Input Non Member Groom Details    Juan    A    Dela Cruz
    Input Current Date    08    07    2021
    Input Wedding Date    10    31    2021
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Complete Member Bride and Non-Member Groom Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Select Random Member Bride
    Input Non Member Groom Details    Juan    A    Dela Cruz
    Input Current Date    08    07    2021
    Input Wedding Date    04    10    2022
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Blank Member Bride and Non-Member Groom Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Member Bride and Non-Member Groom Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Blank Member Bride and Non-Member Groom Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Submit Prenuptial Form
    Bride Information Error Should Be Shown
    Groom Information Error Should Be Shown
    Wedding Date Error Should Be Shown

Incomplete Member Bride and Non-Member Groom - Bride Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Member Bride and Non-Member Groom - Groom Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Select Random Member Bride
    Input Non Member Groom Details    Francisco    A    ${EMPTY}
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Member Bride and Non-Member Groom - Current Date Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Select Random Member Bride
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Member Bride and Non-Member Groom - Wedding Date Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Select Random Member Bride
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Member Bride and Non-Member Groom - Bride Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Member Bride and Non-Member Groom - Groom Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Select Random Member Bride
    Input Non Member Groom Details    Francisco    A    ${EMPTY}
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Member Bride and Non-Member Groom - Current Date Input (Level 2)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Select Random Member Bride
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Member Bride and Non-Member Groom - Wedding Date Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Select Random Member Bride
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Member Bride and Non-Member Groom - Bride Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Bride Information Error Should Be Shown

Incomplete Member Bride and Non-Member Groom - Groom Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Select Random Member Bride
    Input Non Member Groom Details    Francisco    A    ${EMPTY}
    Input Current Date    08    02    2021
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Groom Information Error Should Be Shown

Incomplete Member Bride and Non-Member Groom - Current Date Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Select Random Member Bride
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Input Wedding Date    10    23    2021
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown

Incomplete Member Bride and Non-Member Groom - Wedding Date Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to Add Prenuptial Page From Prenuptial Main Page
    Add Prenuptial Page Should Be Open
    Select Member Bride Form
    Select Non-Member Groom Form
    Select Random Member Bride
    Input Non Member Groom Details    Francisco    A    Dela Cruz
    Input Current Date    08    02    2021
    Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Submit Prenuptial Form
    Wedding Date Error Should Be Shown