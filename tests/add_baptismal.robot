*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            baptismal.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to Add Baptismal Page (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open

Navigate to Add Baptismal Page (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to Add Baptismal Page From Baptismal Main Page
    Add Baptismal Page Should Be Open

Navigate to Add Baptismal Page (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to Add Baptismal Page From Baptismal Main Page
    Add Baptismal Page Should Be Open

Validate Baptism Location Input Field
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Valenzuela
    Input Baptism Date    01    17    2021
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Ray    P    Phillips
    Submit Baptismal Form
    View Baptismal Page Should Be Open
    Delete Baptismal Record

Validate Baptism Date Input Field
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Valenzuela
    Input Baptism Date    one    seventeen    two thousand twenty-one
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Ray    P    Phillips
    Submit Baptismal Form
    Baptism Date Error Should Be Shown

Validate Non-Member Officiant Input Field
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Valenzuela
    Input Baptism Date    01    17    2021
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Ray    P    Phillips
    Submit Baptismal Form
    View Baptismal Page Should Be Open
    Delete Baptismal Record

Validate Non-Member Officiant Middle Name Input Field
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Valenzuela
    Input Baptism Date    01    17    2021
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Ray    Park    Phillips
    Submit Baptismal Form
    Non-Member Officiant Middle Initial Error Should Be Shown

Complete Non-Member Officiant Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Valenzuela
    Input Baptism Date    10    09    2010
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Wilburn    A    Maxwell
    Submit Baptismal Form
    View Baptismal Page Should Be Open
    Delete Baptismal Record

Complete Member Officiant Input (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Valenzuela
    Input Baptism Date    01    17    2021
    Select Member Officiant Form
    Select Random Member Officiant
    Submit Baptismal Form
    View Baptismal Page Should Be Open
    Delete Baptismal Record

Complete Non-Member Officiant Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to Add Baptismal Page From Baptismal Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Pasay
    Input Baptism Date    02    21    2017
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Loren    O    Odonell
    Submit Baptismal Form
    View Baptismal Page Should Be Open
    Delete Baptismal Record

Complete Member Officiant Input (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to Add Baptismal Page From Baptismal Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Navotas
    Input Baptism Date    05    02    2016
    Select Member Officiant Form
    Select Random Member Officiant
    Submit Baptismal Form
    View Baptismal Page Should Be Open
    Delete Baptismal Record

Complete Non-Member Officiant Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to Add Baptismal Page From Baptismal Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Malabon
    Input Baptism Date    02    03    2022
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Turner    M    Galloway
    Submit Baptismal Form
    View Baptismal Page Should Be Open
    Delete Baptismal Record

Complete Member Officiant Input (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Baptismal Main Page Should Be Open
    Navigate to Add Baptismal Page From Baptismal Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Pateros
    Input Baptism Date    06    18    2021
    Select Member Officiant Form
    Select Random Member Officiant
    Submit Baptismal Form
    View Baptismal Page Should Be Open
    Delete Baptismal Record

Missing Member for Baptism Input:
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Input Baptism Location    Paranaque
    Input Baptism Date    02    22    2022
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Nino    N    Nakano
    Submit Baptismal Form
    Member for Baptism Error Should Be Shown

Missing Baptism Location Input:
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Date    02    03    2022
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Turner    M    Galloway
    Submit Baptismal Form
    Baptism Location Error Should Be Shown

Missing Baptism Date Input:
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Malabon
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    Turner    M    Galloway
    Submit Baptismal Form
    Baptism Date Error Should Be Shown

Missing Member Officiant Input:
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Malabon
    Input Baptism Date    02    03    2022
    Select Member Officiant Form
    Submit Baptismal Form
    Member Officiant Error Should Be Shown

Missing Non-Member Officiant Input:
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Malabon
    Input Baptism Date    02    03    2022
    Select Non-Member Officiant Form
    Submit Baptismal Form
    Non-Member Officiant Error Should Be Shown

Incomplete Non-Member Officiant Input:
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Baptismal Page From Forms Main Page
    Add Baptismal Page Should Be Open
    Select Random Member for Baptism
    Input Baptism Location    Malabon
    Select Non-Member Officiant Form
    Input Non Member Officiant Details    ${EMPTY}    T    Zorah
    Submit Baptismal Form
    Baptism Date Error Should Be Shown
