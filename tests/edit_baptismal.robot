*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            baptismal.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to Edit Baptismal Record (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open

Navigate to Edit Baptismal Record (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to View Baptismal Page From Baptismal Main Page
    View Baptismal Page Should Be Open
    Navigate to Edit Baptismal Page From View Baptismal Page
    Edit Baptismal Page Should Be Open

Navigate to Edit Baptismal Record (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to View Baptismal Page From Baptismal Main Page
    View Baptismal Page Should Be Open
    Navigate to Edit Baptismal Page From View Baptismal Page
    Edit Baptismal Page Should Be Open

Edit Baptism Date Baptismal Record:
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to View Baptismal Page From Baptismal Main Page
    View Baptismal Page Should Be Open
    Navigate to Edit Baptismal Page From View Baptismal Page
    Edit Baptismal Page Should Be Open
    Input Baptism Date    10    31    2021
    Save Baptismal Form Changes
    View Baptismal Page Should Be Open

Edit Member Baptismal Record:
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to View Baptismal Page From Baptismal Main Page
    View Baptismal Page Should Be Open
    Navigate to Edit Baptismal Page From View Baptismal Page
    Edit Baptismal Page Should Be Open
    Select Edit Member Details
    Select Random Member for Baptism
    Save Member Detail Changes
    Save Baptismal Form Changes
    View Baptismal Page Should Be Open

Edit Non-Member Officiant Baptismal Record:
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to View Baptismal Page From Baptismal Main Page
    View Baptismal Page Should Be Open
    Navigate to Edit Baptismal Page From View Baptismal Page
    Edit Baptismal Page Should Be Open
    Select Edit Officiant Details
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    John    C    Shepard
    Save Officiant Detail Changes
    Save Baptismal Form Changes
    View Baptismal Page Should Be Open

Edit Member Officiant Baptismal Record:
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to View Baptismal Page From Baptismal Main Page
    View Baptismal Page Should Be Open
    Navigate to Edit Baptismal Page From View Baptismal Page
    Edit Baptismal Page Should Be Open
    Select Edit Officiant Details
    Select Member Officiant Form
    Select Random Member Officiant
    Save Officiant Detail Changes
    Save Baptismal Form Changes
    View Baptismal Page Should Be Open

Edit Baptism Location Baptismal Record:
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to View Baptismal Page From Baptismal Main Page
    View Baptismal Page Should Be Open
    Navigate to Edit Baptismal Page From View Baptismal Page
    Edit Baptismal Page Should Be Open
    Input Baptism Location    Citadel
    Save Baptismal Form Changes
    View Baptismal Page Should Be Open

Delete Baptismal Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to View Baptismal Page From Baptismal Main Page
    View Baptismal Page Should Be Open
    Delete Baptismal Record
    Forms Main Page Should Be Open
