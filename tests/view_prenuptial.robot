*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            prenuptial.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to View Prenuptial Page (Level 1):
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
    Save Prenuptial Form Data
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    View Prenuptial Page Should Match Form Inputs
    Navigate to Prenuptial Main Page From View Prenuptial Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open

Navigate to View Prenuptial Page (Level 2):
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
    Save Prenuptial Form Data
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    View Prenuptial Page Should Match Form Inputs
    Navigate to Prenuptial Main Page From View Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to View Prenuptial Page From Prenuptial Main Page
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record

Navigate to View Prenuptial Page (Level 3):
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
    Save Prenuptial Form Data
    Submit Prenuptial Form
    View Prenuptial Page Should Be Open
    View Prenuptial Page Should Match Form Inputs
    Navigate to Prenuptial Main Page From View Prenuptial Page
    Prenuptial Main Page Should Be Open
    Navigate to View Prenuptial Page From Prenuptial Main Page
    View Prenuptial Page Should Be Open
    Delete Prenuptial Record
