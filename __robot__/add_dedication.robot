*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            dedication.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to Add Dedication Page (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to Add Dedication Page From Dedication Main Page
    Add Dedication Page Should Be Open

Navigate to Add Dedication Page (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to Add Dedication Page From Dedication Main Page
    Add Dedication Page Should Be Open

Navigate to Add Dedication Page (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Add Dedication Page Should Be Open

Complete Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Add Dedication Page Should Be Open
    Select Member Child Form
    Select Random Member Child
    Select Member Parent 1 Form
    Select Random Member Parent 1
    Select Member Parent 2 Form
    Select Random Member Parent 2
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Member Godmother Form
    Select Random Member Godmother
    Confirm Add Godmother
    Select Add Godfather Button
    Select Member Godfather Form
    Select Random Member Godfather
    Confirm Add Godfather
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs

Complete Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Dedication Page From Forms Main Page
    Dedication Main Page Should Be Open
    Navigate to Add Dedication Page From Dedication Main Page
    Add Dedication Page Should Be Open
    Select Member Child Form
    Select Random Member Child
    Select Member Parent 1 Form
    Select Random Member Parent 1
    Select Member Parent 2 Form
    Select Random Member Parent 2
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Member Godmother Form
    Select Random Member Godmother
    Confirm Add Godmother
    Select Add Godfather Button
    Select Member Godfather Form
    Select Random Member Godfather
    Confirm Add Godfather
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Input (Level 3)
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
    Select Member Parent 1 Form
    Select Random Member Parent 1
    Select Member Parent 2 Form
    Select Random Member Parent 2
    Input Officiant Details    Pastor Shepard
    Input Address of Dedication    The Citadel
    Input Date of Dedication    09    01    2021
    Select Add Godmother Button
    Select Member Godmother Form
    Select Random Member Godmother
    Confirm Add Godmother
    Select Add Godfather Button
    Select Member Godfather Form
    Select Random Member Godfather
    Confirm Add Godfather
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Blank Member Child Input
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
    Child Error Should Be Shown

Blank Member Parents Input
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
    Select Member Parent 1 Form
    Select Member Parent 2 Form
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
    Parent 1 Error Should Be Shown
    Parent 2 Error Should Be Shown

Blank Officiant Input
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
    Officiant Error Should Be Shown

Blank Address of Dedication Input
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
    Address of Dedication Error Should Be Shown

Blank Date of Dedication Input
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
    Input Date of Dedication    BACK_SPACE    BACK_SPACE    BACK_SPACE
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Submit Dedication Form
    Date of Dedication Error Should Be Shown

Blank Godmother and Godfather Input
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
    Submit Dedication Form
    Godmother and Godfather Error Should Be Shown

Blank Non-Member Child Input
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
    Child Error Should Be Shown

Blank Non-Member Parents Input
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
    Select Non-Member Parent 2 Form
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
    Parent 1 Error Should Be Shown
    Parent 2 Error Should Be Shown

Blank Non-Member Godmother Input
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
    Input Non-Member Godmother Details    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Confirm Add Godmother
    Godmother Modal Error Should Be Shown

Blank Non-Member Godfather Input
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
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Confirm Add Godfather
    Godfather Modal Error Should Be Shown

Complete Non-Members Input
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
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Member - Child, Parent, and Witness & Non-Member - Parent and Witness Input
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
    Select Member Parent 1 Form
    Select Random Member Parent 1
    Select Non-Member Parent 2 Form
    Input Non-Member Parent 2 Details    Liara    T    Soni
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
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Member - Parent and Witness & Non-Member - Child, Parent, and Witness Input
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
    Select Member Parent 1 Form
    Select Random Member Parent 1
    Select Non-Member Parent 2 Form
    Input Non-Member Parent 2 Details    Liara    T    Soni
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
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Member - Parent and Witness & Non-Member - Child and Witness Input
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
    Select Member Parent 1 Form
    Select Random Member Parent 1
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
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Member - Witness & Non-Member - Child, Parent, and Witness Input
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
    Select Member Godmother Form
    Select Random Member Godmother
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete One Godfather and One Godmother Input
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
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete One Godfather Input
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
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete One Godmother Input
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
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Six Godmother and Six Godfather Input
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
    Input Non-Member Godmother Details    Liara    M    Tsoni
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Nino    N    Nakano
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Miku    N    Nakano
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Yotsuba    N    Nakano
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Jean    T    Manalo
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Nicole    P    De Leon
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Isaac    C    Clarke
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Garrus    D    Vakarian
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Josuke    F    Higashikata
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Miguel    D    Adajar
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Marcus    P    Aquino
    Confirm Add Godfather
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Six Godfather Input
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
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Isaac    C    Clarke
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Garrus    D    Vakarian
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Josuke    F    Higashikata
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Miguel    D    Adajar
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Marcus    P    Aquino
    Confirm Add Godfather
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Six Godmother Input
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
    Input Non-Member Godmother Details    Liara    M    Tsoni
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Nino    N    Nakano
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Miku    N    Nakano
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Yotsuba    N    Nakano
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Jean    T    Manalo
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Nicole    P    De Leon
    Confirm Add Godmother
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Seven Godmother and Seven Godfather Input
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
    Input Non-Member Godmother Details    Liara    M    Tsoni
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Nino    N    Nakano
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Miku    N    Nakano
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Yotsuba    N    Nakano
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Jean    T    Manalo
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Nicole    P    De Leon
    Confirm Add Godmother
    Select Add Godmother Button
    Godmother Maximum Warning Should Be Shown
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Isaac    C    Clarke
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Garrus    D    Vakarian
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Josuke    F    Higashikata
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Miguel    D    Adajar
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Marcus    P    Aquino
    Confirm Add Godfather
    Select Add Godfather Button
    Godfather Maximum Warning Should Be Shown
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Seven Godfather Input
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
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Isaac    C    Clarke
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Garrus    D    Vakarian
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Josuke    F    Higashikata
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Miguel    D    Adajar
    Confirm Add Godfather
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Marcus    P    Aquino
    Confirm Add Godfather
    Select Add Godfather Button
    Godfather Maximum Warning Should Be Shown
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Seven Godmother Input
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
    Input Non-Member Godmother Details    Liara    M    Tsoni
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Nino    N    Nakano
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Miku    N    Nakano
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Yotsuba    N    Nakano
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Jean    T    Manalo
    Confirm Add Godmother
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Nicole    P    De Leon
    Confirm Add Godmother
    Select Add Godmother Button
    Godmother Maximum Warning Should Be Shown
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Deleted Godmother Input
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
    Remove Godmother
    Submit Dedication Form
    Godmother and Godfather Error Should Be Shown
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record

Complete Deleted Godfather Input
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
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Remove Godfather
    Submit Dedication Form
    Godmother and Godfather Error Should Be Shown
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Save Dedication Form Data
    Submit Dedication Form
    View Dedication Page Should Be Open
    View Dedication Page Should Match Form Inputs
    Delete Dedication Record