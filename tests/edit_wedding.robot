*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            wedding.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to Edit Wedding Record (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Add Wedding Page Should Be Open

Navigate to Edit Wedding Record (Level 2):
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open

Navigate to Edit Wedding Record (Level 3):
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open

Edit Wedding Date Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Input Wedding Date in Edit Wedding Page    02    01    2022
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Contract Number Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Input Contract Number    WD-696969
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Non-Member Bride Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Details
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Sally    C    Connor
    Save Bride Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Member Bride Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Details
    Select Member Bride Form
    Select Random Member Bride
    Save Bride Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Non-Member Groom Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Details
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Jeron    M    Bishop
    Save Groom Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Member Groom Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Details
    Select Member Groom Form
    Select Random Member Groom
    Save Groom Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Non-Member Bride Mother Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Mother Details
    Select Non-Member Female Form
    Input Non-Member Female Details    Jaiden    C    Connor
    Save Female Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Member Bride Mother Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Mother Details
    Select Member Female Form
    Select Random Member Female
    Save Female Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Non-Member Bride Father Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Father Details
    Select Non-Member Male Form
    Input Non-Member Male Details    Jordan    C    Connor
    Save Male Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Member Bride Father Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Father Details
    Select Member Male Form
    Select Random Member Male
    Save Male Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Non-Member Groom Mother Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Mother Details
    Select Non-Member Female Form
    Input Non-Member Female Details    Kirsten    M    Bishop
    Save Female Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Member Groom Mother Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Mother Details
    Select Member Female Form
    Select Random Member Female
    Save Female Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Non-Member Groom Father Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Father Details
    Select Non-Member Male Form
    Input Non-Member Male Details    Maynard    M    Bishop
    Save Male Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Member Groom Father Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Father Details
    Select Member Male Form
    Select Random Member Male
    Save Male Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Officiant Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Input Officiant Details    Pastor Eric
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Solemnizing Officer Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Input Solemnizing Officer Details    Pastor Jacob
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Wedding Location Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Input Wedding Location    The Acropolis
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Non-Member Godmother Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Godmother Details
    Select Non-Member Godmother Form in Edit Wedding Page
    Input Non-Member Godmother Details in Edit Wedding Page    Pamela    F    Jackson
    Save Godmother Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Member Godmother Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Godmother Details
    Select Member Godmother Form in Edit Wedding Page
    Select Random Member Godmother in Edit Wedding Page
    Save Godmother Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Remove Godmother Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Remove Godmother in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Add Non-Member Godmother Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Add Godmother Button
    Select Non-Member Godmother Form in Edit Wedding Page
    Input Non-Member Godmother Details in Edit Wedding Page    Whitney    L    Mutton
    Save Godmother Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Add Member Godmother Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Add Godmother Button
    Select Member Godmother Form in Edit Wedding Page
    Select Random Member Godmother in Edit Wedding Page
    Save Godmother Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Non-Member Godfather Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Godfather Details
    Select Non-Member Godfather Form in Edit Wedding Page
    Input Non-Member Godfather Details in Edit Wedding Page    Samuel    L    Jackson
    Save Godfather Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Edit Member Godfather Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Godfather Details
    Select Member Godfather Form in Edit Wedding Page
    Select Random Member Godfather in Edit Wedding Page
    Save Godfather Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Remove Godfather Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Remove Godfather in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Add Non-Member Godfather Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Add Godfather Button
    Select Non-Member Godfather Form in Edit Wedding Page
    Input Non-Member Godfather Details in Edit Wedding Page    Rick    L    Mutton
    Save Godfather Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Add Member Godfather Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Add Godfather Button
    Select Member Godfather Form in Edit Wedding Page
    Select Random Member Godfather in Edit Wedding Page
    Save Godfather Detail Changes
    Save Wedding Form Changes
    View Wedding Page Should Be Open

Delete Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Delete Wedding Record
    Forms Main Page Should Be Open
