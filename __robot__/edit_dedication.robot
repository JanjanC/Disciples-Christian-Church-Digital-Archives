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
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Input Date of Dedication    01    03    2022
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Non-Member Child From Non-Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Child Details
    Select Non-Member Child Form
    Input Non-Member Child Details    Joseph    Z    Miranda
    Save Child Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record


Edit Non-Member Child From Member Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to Add Dedication Page From Dedication Main Page
    Add Dedication Page Should Be Open
    Select Member Child Form
    Select Random Member Child
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Child Details
    Select Non-Member Child Form
    Input Non-Member Child Details    Joseph    Z    Miranda
    Save Child Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Member Child From Non-Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Child Details
    Select Member Child Form
    Select Random Member Child
    Save Child Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Member Child From Member Dedication Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to Add Dedication Page From Dedication Main Page
    Add Dedication Page Should Be Open
    Select Member Child Form
    Select Random Member Child
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Child Details
    Select Member Child Form
    Select Random Member Child
    Save Child Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Non-Member Parent 1 From Non-Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 1 Details
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Steven    M    Harris
    Save Parent 1 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Non-Member Parent 1 From Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Member Parent 1 Form
    Select Random Member Parent 1
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 1 Details
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Steven    M    Harris
    Save Parent 1 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Member Parent 1 From Non-Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 1 Details
    Select Member Parent 1 Form
    Select Random Member Parent 1
    Save Parent 1 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Member Parent 1 From Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Member Parent 1 Form
    Select Random Member Parent 1
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 1 Details
    Select Member Parent 1 Form
    Select Random Member Parent 1
    Save Parent 1 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Non-Member Parent 2 From Non-Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select Non-Member Parent 2 Form
    Input Non-Member Parent 2 Details    Emily    D    Elmber
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 2 Details
    Select Non-Member Parent 2 Form
    Input Non-Member Parent 2 Details    Kyrsten    L    Pressley
    Save Parent 2 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Non-Member Parent 2 From Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select Member Parent 2 Form
    Select Random Member Parent 2
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 2 Details
    Select Non-Member Parent 2 Form
    Input Non-Member Parent 2 Details    Kyrsten    L    Pressley
    Save Parent 2 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Non-Member Parent 2 From None Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 2 Details
    Select Non-Member Parent 2 Form
    Input Non-Member Parent 2 Details    Kyrsten    L    Pressley
    Save Parent 2 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Member Parent 2 From Non-Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select Non-Member Parent 2 Form
    Input Non-Member Parent 2 Details    Emily    D    Elmber
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 2 Details
    Select Member Parent 2 Form
    Select Random Member Parent 2
    Save Parent 2 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Member Parent 2 From Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select Member Parent 2 Form
    Select Random Member Parent 2
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 2 Details
    Select Member Parent 2 Form
    Select Random Member Parent 2
    Save Parent 2 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Member Parent 2 From None Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 2 Details
    Select Member Parent 2 Form
    Select Random Member Parent 2
    Save Parent 2 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit No Parent 2 From Non-Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select Non-Member Parent 2 Form
    Input Non-Member Parent 2 Details    Emily    D    Elmber
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 2 Details
    Select No Parent 2 Form
    Save Parent 2 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit No Parent 2 From Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select Member Parent 2 Form
    Select Random Member Parent 2
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 2 Details
    Select No Parent 2 Form
    Save Parent 2 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit No Parent 2 From None Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Parent 2 Details
    Select No Parent 2 Form
    Save Parent 2 Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Officiant Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Input Officiant Details    Pastor Eric
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Adress of Dedication Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Input Address of Dedication    The Acropolis
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Non-Member Godmother From Non-Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Godmother Details
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Pamela    F    Jackson
    Save Godmother Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Non-Member Godmother From Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Member Godmother Form
    Select Random Member Godmother
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Godmother Details
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Pamela    F    Jackson
    Save Godmother Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Member Godmother From Non-Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Godmother Details
    Select Member Godmother Form
    Select Random Member Godmother
    Save Godmother Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Member Godmother From Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Member Godmother Form
    Select Random Member Godmother
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Godmother Details
    Select Member Godmother Form
    Select Random Member Godmother
    Save Godmother Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Remove Godmother Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Remove Godmother in Edit Dedication Page
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Add Non-Member Godmother Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Whitney    L    Mutton
    Confirm Add Godmother
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Add Member Godmother Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Add Godmother Button
    Select Member Godmother Form
    Select Random Member Godmother
    Confirm Add Godmother
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Non-Member Godfather From Non-Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mike    S    Oliver
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Godfather Details
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Samuel    L    Jackson
    Save Godfather Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Non-Member Godfather From Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Member Godfather Form
    Select Random Member Godfather
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Godfather Details
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Samuel    L    Jackson
    Save Godfather Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Member Godfather From Non-Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mike    S    Oliver
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Godfather Details
    Select Member Godfather Form
    Select Random Member Godfather
    Save Godfather Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Edit Member Godfather From Member Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Member Godfather Form
    Select Random Member Godfather
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Edit Godfather Details
    Select Member Godfather Form
    Select Random Member Godfather
    Save Godfather Detail Changes
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Remove Godfather Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mike    S    Oliver
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Remove Godfather in Edit Dedication Page
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Add Non-Member Godfather Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mike    S    Oliver
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Rick    L    Mutton
    Confirm Add Godfather
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Add Member Godfather Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mike    S    Oliver
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Navigate to Edit Dedication Page From View Dedication Page
    Edit Dedication Page Should Be Open
    Select Add Godfather Button
    Select Member Godfather Form
    Select Random Member Godfather
    Confirm Add Godfather
    Save Dedication Form Data in Edit Dedication Page
    Save Dedication Form Changes
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Delete Dedication Record
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
    Input Non-Member Child Details    Karen    J    Robinson
    Select Non-Member Parent 1 Form
    Input Non-Member Parent 1 Details    Liara    T    Soni
    Select No Parent 2 Form
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Celeste    G    Clay
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mike    S    Oliver
    Confirm Add Godfather
    Submit Dedication Form
    View Dedication Page Should Be Open
    Delete Dedication Record
    Forms Main Page Should Be Open