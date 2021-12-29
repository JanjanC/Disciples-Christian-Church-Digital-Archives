*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            prenuptial.resource

Test Teardown       Close Browser

*** Test Cases ***
Edit Prenuptial Record (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Add Prenuptial Page Should Be Open

Edit Prenuptial Record (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to View Prenuptial Page From Prenuptial Main Page
    View Prenuptial Page Should Be Open
    Navigate to Edit Prenuptial Page
    Unauthorized Access Error Should Be Shown

Edit Prenuptial Record (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Prenuptial Page From Forms Main Page
    Prenuptial Main Page Should Be Open
    Navigate to View Prenuptial Page From Prenuptial Main Page
    View Prenuptial Page Should Be Open
    Navigate to Edit Prenuptial Page
    Edit Prenuptial Page Should Be Open
    Select Edit Groom Details
    Select Non-Member Groom Form
    Input Non Member Groom Details    Jonathan Jr.    A    Dela Cruz
    Save Groom Detail Changes
    Input Wedding Date    01    15    2022
    Save Prenuptial Form Changes
    View Prenuptial Page Should Be Open
