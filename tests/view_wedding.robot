*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            wedding.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to View Wedding Page (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Add Wedding Page Should Be Open
    Select Member Bride Form
    Select Random Member Bride
    Select Member Groom Form
    Select Random Member Groom
    Select Member Bride Mother Form
    Select Random Member Bride Mother
    Select Member Bride Father Form
    Select Random Member Bride Father
    Select Member Groom Mother Form
    Select Random Member Groom Mother
    Select Member Groom Father Form
    Select Random Member Groom Father
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Member Godmother Form
    Select Random Member Godmother
    Select Member Godfather Form
    Select Random Member Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Wedding Main Page From View Wedding Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Add Wedding Page Should Be Open

Navigate to View Wedding Page (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Member Bride Form
    Select Random Member Bride
    Select Member Groom Form
    Select Random Member Groom
    Select Member Bride Mother Form
    Select Random Member Bride Mother
    Select Member Bride Father Form
    Select Random Member Bride Father
    Select Member Groom Mother Form
    Select Random Member Groom Mother
    Select Member Groom Father Form
    Select Random Member Groom Father
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Member Godmother Form
    Select Random Member Godmother
    Select Member Godfather Form
    Select Random Member Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Wedding Main Page From View Wedding Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Delete Wedding Record

Navigate to View Wedding Page (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Member Bride Form
    Select Random Member Bride
    Select Member Groom Form
    Select Random Member Groom
    Select Member Bride Mother Form
    Select Random Member Bride Mother
    Select Member Bride Father Form
    Select Random Member Bride Father
    Select Member Groom Mother Form
    Select Random Member Groom Mother
    Select Member Groom Father Form
    Select Random Member Groom Father
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Member Godmother Form
    Select Random Member Godmother
    Select Member Godfather Form
    Select Random Member Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Wedding Main Page From View Wedding Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Delete Wedding Record
