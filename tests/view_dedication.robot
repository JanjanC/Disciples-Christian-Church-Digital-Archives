*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            dedication.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to View Dedication Page (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Add Dedication Page Should Be Open
    Select Non-Member Child Form
    Input Non-Member Child Details    Garrus    K    Vakarian
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Dedication Main Page From View Dedication Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Add Dedication Page Should Be Open

Navigate to View Dedication Page (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to Add Dedication Page From Dedication Main Page
    Add Dedication Page Should Be Open
    Select Non-Member Child Form
    Input Non-Member Child Details    Garrus    K    Vakarian
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Dedication Main Page From View Dedication Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Delete Dedication Record

Navigate to View Dedication Page (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to Add Dedication Page From Dedication Main Page
    Add Dedication Page Should Be Open
    Select Non-Member Child Form
    Input Non-Member Child Details    Garrus    K    Vakarian
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Dedication Main Page From View Dedication Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Delete Dedication Record
