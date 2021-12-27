*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            baptismal.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to View Baptismal Page (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Select Member for Baptism
    Input Baptism Location    Pasay
    Input Baptism Date    02    21    2017
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Loren    O    Odonell
    Submit Baptismal Form
    View Baptismal Page Should Be Open
    Navigate to Baptismal Main Page From View Baptismal Page
    Forms Main Page Should Be Open

Navigate to View Baptismal Page (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to Add Baptismal Page From Baptismal Main Page
    Add Baptismal Page Should Be Open
    Select Member for Baptism
    Input Baptism Location    Pasay
    Input Baptism Date    02    21    2017
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Loren    O    Odonell
    Submit Baptismal Form
    View Baptismal Page Should Be Open
    Navigate to Baptismal Main Page From View Baptismal Page
    Baptismal Main Page Should Be Open
    Navigate to View Baptismal Page From Baptismal Main Page
    View Baptismal Page Should Be Open
    Delete Baptismal Record

Navigate to View Baptismal Page (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to Add Baptismal Page From Baptismal Main Page
    Add Baptismal Page Should Be Open
    Select Member for Baptism
    Input Baptism Location    Malabon
    Input Baptism Date    02    03    2022
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Turner    M    Galloway
    Submit Baptismal Form
    View Baptismal Page Should Be Open
    Navigate to Baptismal Main Page From View Baptismal Page
    Baptismal Main Page Should Be Open
    Navigate to View Baptismal Page From Baptismal Main Page
    View Baptismal Page Should Be Open
    Delete Baptismal Record
