*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            dedication.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to Edit Dedication Record (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Add Dedication Page Should Be Open

Navigate to Edit Dedication Record (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open

Navigate to Edit Dedication Record (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open

Edit Dedication Date Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Input Date of Dedication    01    03    2022
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Edit Member Child Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Child Details
    Select Member Child Form
    Select Random Member Child
    Save Child Detail Changes
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Edit Non-Member Parent 1 Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 1 Details
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Steven    M    Harris
    Save Parent 1 Detail Changes
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Edit Member Parent 1 Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 1 Details
    Select Member Parent 1 Form
    Select Random Member Parent 1
    Save Parent 1 Detail Changes
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Edit Non-Member Parent 2 Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 2 Details
    Select Non-Member Parent 2 Form
    Input Non-Member Parent 2 Details    Kyrsten    L    Pressley
    Save Parent 2 Detail Changes
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Edit Member Parent 2 Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 2 Details
    Select Member Parent 2 Form
    Select Random Member Parent 2
    Save Parent 2 Detail Changes
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Edit No Parent 2 Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 2 Details
    Select No Parent 2 Form
    Save Parent 2 Detail Changes
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Edit Officiant Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Input Officiant Details    Pastor Eric
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Edit Adress of Dedication Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Input Address of Dedication    The Acropolis
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Edit Non-Member Godmother Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Godmother Details
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Pamela    F    Jackson
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Edit Member Godmother Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Godmother Details
    Select Member Godmother Form
    Select Random Member Godmother
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Remove Godmother Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Remove Godmother in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Add Non-Member Godmother Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Whitney    L    Mutton
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Add Member Godmother Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Add Godmother Button
    Select Member Godmother Form
    Select Random Member Godmother
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Edit Non-Member Godfather Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Godfather Details
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Samuel    L    Jackson
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Edit Member Godfather Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Godfather Details
    Select Member Godfather Form
    Select Random Member Godfather
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Remove Godfather Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Remove Godfather in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Add Non-Member Godfather Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Rick    L    Mutton
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Add Member Godfather Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Add Godfather Button
    Select Member Godfather Form
    Select Random Member Godfather
    Save Dedication Form Changes
    View Dedication Page Should Be Open

Delete Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to View Dedication Page From Dedication Main Page
    View Dedication Page Should Be Open
    Delete Dedication Record
    Forms Main Page Should Be Open
