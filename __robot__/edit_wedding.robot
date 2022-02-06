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
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Kasuma    K    Goto
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Thane    T    Krios
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Katherine    K    Goto
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
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
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Kasuma    K    Goto
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Thane    T    Krios
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Katherine    K    Goto
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
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
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Kasuma    K    Goto
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Thane    T    Krios
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Katherine    K    Goto
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Input Wedding Date in Edit Wedding Page    02    01    2022
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Contract Number Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Kasuma    K    Goto
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Thane    T    Krios
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Katherine    K    Goto
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Input Contract Number    WD-696969
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Bride From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Thane    T    Krios
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Katherine    K    Goto
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Details
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Sally    C    Connor
    Save Bride Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Bride From Member Wedding Record
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
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Thane    T    Krios
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Katherine    K    Goto
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Details
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Sally    C    Connor
    Save Bride Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Bride From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Thane    T    Krios
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Katherine    K    Goto
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Details
    Select Member Bride Form
    Select Random Member Bride
    Save Bride Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Bride From Member Wedding Record
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
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Thane    T    Krios
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Katherine    K    Goto
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Details
    Select Member Bride Form
    Select Random Member Bride
    Save Bride Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Groom From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Katherine    K    Goto
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Details
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Jeron    M    Bishop
    Save Groom Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Groom From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Member Groom Form
    Select Random Member Groom
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Katherine    K    Goto
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Details
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Jeron    M    Bishop
    Save Groom Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Groom From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Katherine    K    Goto
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Details
    Select Member Groom Form
    Select Random Member Groom
    Save Groom Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Groom From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Member Groom Form
    Select Random Member Groom
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Katherine    K    Goto
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Details
    Select Member Groom Form
    Select Random Member Groom
    Save Groom Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Bride Mother From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Mother Details
    Select Non-Member Female Form
    Input Non-Member Female Details    Jaiden    C    Connor
    Save Bride Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Bride Mother From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Member Bride Mother Form
    Select Random Member Bride Mother
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Mother Details
    Select Non-Member Female Form
    Input Non-Member Female Details    Jaiden    C    Connor
    Save Bride Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Bride Mother From None Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select No Bride Mother Form
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Mother Details
    Select Non-Member Female Form
    Input Non-Member Female Details    Jaiden    C    Connor
    Save Bride Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Bride Mother From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Mother Details
    Select Member Female Form
    Select Random Member Female
    Save Bride Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Bride Mother From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Member Bride Mother Form
    Select Random Member Bride Mother
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Mother Details
    Select Member Female Form
    Select Random Member Female
    Save Bride Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Bride Mother From None Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select No Bride Mother Form
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Mother Details
    Select Member Female Form
    Select Random Member Female
    Save Bride Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit No Bride Mother From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Mother Details
    Select No Female Form
    Save Bride Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit No Bride Mother From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Member Bride Mother Form
    Select Random Member Bride Mother
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Mother Details
    Select No Female Form
    Save Bride Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit No Bride Mother From None Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select No Bride Mother Form
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Kenji    K    Goto
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Mother Details
    Select No Female Form
    Save Bride Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Bride Father From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Father Details
    Select Non-Member Male Form
    Input Non-Member Male Details    Jordan    C    Connor
    Save Bride Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Bride Father From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Member Bride Father Form
    Select Random Member Bride Father
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Father Details
    Select Non-Member Male Form
    Input Non-Member Male Details    Jordan    C    Connor
    Save Bride Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Bride Father From None Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select No Bride Father Form
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Father Details
    Select Non-Member Male Form
    Input Non-Member Male Details    Jordan    C    Connor
    Save Bride Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Bride Father From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Father Details
    Select Member Male Form
    Select Random Member Male
    Save Bride Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Bride Father From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Member Bride Father Form
    Select Random Member Bride Father
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Father Details
    Select Member Male Form
    Select Random Member Male
    Save Bride Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Bride Father From None Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select No Bride Father Form
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Father Details
    Select Member Male Form
    Select Random Member Male
    Save Bride Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit No Bride Father From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Father Details
    Select No Male Form
    Save Bride Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit No Bride Father From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Member Bride Father Form
    Select Random Member Bride Father
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Father Details
    Select No Male Form
    Save Bride Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit No Bride Father From None Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select No Bride Father Form
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Therese    T    Krios
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Bride Father Details
    Select No Male Form
    Save Bride Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Groom Mother From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Mother Details
    Select Non-Member Female Form
    Input Non-Member Female Details    Kirsten    M    Bishop
    Save Groom Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Groom Mother From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Member Groom Mother Form
    Select Random Member Groom Mother
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Mother Details
    Select Non-Member Female Form
    Input Non-Member Female Details    Kirsten    M    Bishop
    Save Groom Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Groom Mother From None Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select No Groom Mother Form
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Mother Details
    Select Non-Member Female Form
    Input Non-Member Female Details    Kirsten    M    Bishop
    Save Groom Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Groom Mother From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Mother Details
    Select Member Female Form
    Select Random Member Female
    Save Groom Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Groom Mother From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Member Groom Mother Form
    Select Random Member Groom Mother
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Mother Details
    Select Member Female Form
    Select Random Member Female
    Save Groom Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Groom Mother From None Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select No Groom Mother Form
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Mother Details
    Select Member Female Form
    Select Random Member Female
    Save Groom Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit No Groom Mother From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Mother Details
    Select No Female Form
    Save Groom Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit No Groom Mother From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Member Groom Mother Form
    Select Random Member Groom Mother
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Mother Details
    Select No Female Form
    Save Groom Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit No Groom Mother From None Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select No Groom Mother Form
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Theo    T    Krios
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Mother Details
    Select No Female Form
    Save Groom Mother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Groom Father From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Father Details
    Select Non-Member Male Form
    Input Non-Member Male Details    Maynard    M    Bishop
    Save Groom Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Groom Father From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Member Groom Father Form
    Select Random Member Groom Father
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Father Details
    Select Non-Member Male Form
    Input Non-Member Male Details    Maynard    M    Bishop
    Save Groom Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Groom Father From None Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select No Groom Father Form
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Father Details
    Select Non-Member Male Form
    Input Non-Member Male Details    Maynard    M    Bishop
    Save Groom Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Groom Father From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Father Details
    Select Member Male Form
    Select Random Member Male
    Save Groom Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Groom Father From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Member Groom Father Form
    Select Random Member Groom Father
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Father Details
    Select Member Male Form
    Select Random Member Male
    Save Groom Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Groom Father From None Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select No Groom Father Form
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Father Details
    Select Member Male Form
    Select Random Member Male
    Save Groom Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit No Groom Father From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Father Details
    Select No Male Form
    Save Groom Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit No Groom Father From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Member Groom Father Form
    Select Random Member Groom Father
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Father Details
    Select No Male Form
    Save Groom Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit No Groom Father From None Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select No Groom Father Form
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Groom Father Details
    Select No Male Form
    Save Groom Father Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Officiant Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Input Officiant Details    Pastor Eric
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Solemnizing Officer Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Input Solemnizing Officer Details    Pastor Jacob
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Wedding Location Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Input Wedding Location    The Acropolis
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Godmother From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Godmother Details
    Select Non-Member Godmother Form in Edit Wedding Page
    Input Non-Member Godmother Details in Edit Wedding Page    Pamela    F    Jackson
    Save Godmother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Godmother From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Member Godmother Form
    Select Random Member Godmother
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Godmother Details
    Select Non-Member Godmother Form in Edit Wedding Page
    Input Non-Member Godmother Details in Edit Wedding Page    Pamela    F    Jackson
    Save Godmother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Godmother From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Godmother Details
    Select Member Godmother Form in Edit Wedding Page
    Select Random Member Godmother in Edit Wedding Page
    Save Godmother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Godmother From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Member Godmother Form
    Select Random Member Godmother
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Godmother Details
    Select Member Godmother Form in Edit Wedding Page
    Select Random Member Godmother in Edit Wedding Page
    Save Godmother Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Remove Godmother Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Remove Godmother in Edit Wedding Page
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Add Non-Member Godmother Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Add Godmother Button
    Select Non-Member Godmother Form in Edit Wedding Page
    Input Non-Member Godmother Details in Edit Wedding Page    Whitney    L    Mutton
    Confirm Add Godmother in Edit Wedding Page
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Add Member Godmother Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Add Godmother Button
    Select Member Godmother Form in Edit Wedding Page
    Select Random Member Godmother in Edit Wedding Page
    Confirm Add Godmother in Edit Wedding Page
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Godfather From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Godfather Details
    Select Non-Member Godfather Form in Edit Wedding Page
    Input Non-Member Godfather Details in Edit Wedding Page    Samuel    L    Jackson
    Save Godfather Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Non-Member Godfather From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Member Godfather Form
    Select Random Member Godfather
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Godfather Details
    Select Non-Member Godfather Form in Edit Wedding Page
    Input Non-Member Godfather Details in Edit Wedding Page    Samuel    L    Jackson
    Save Godfather Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Godfather From Non-Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Godfather Details
    Select Member Godfather Form in Edit Wedding Page
    Select Random Member Godfather in Edit Wedding Page
    Save Godfather Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Edit Member Godfather From Member Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Member Godfather Form
    Select Random Member Godfather
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Edit Godfather Details
    Select Member Godfather Form in Edit Wedding Page
    Select Random Member Godfather in Edit Wedding Page
    Save Godfather Detail Changes
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Remove Godfather Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Remove Godfather in Edit Wedding Page
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Add Non-Member Godfather Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Add Godfather Button
    Select Non-Member Godfather Form in Edit Wedding Page
    Input Non-Member Godfather Details in Edit Wedding Page    Rick    L    Mutton
    Confirm Add Godfather in Edit Wedding Page
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Add Member Godfather Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Navigate to Edit Wedding Page From View Wedding Page
    Edit Wedding Page Should Be Open
    Select Add Godfather Button
    Select Member Godfather Form in Edit Wedding Page
    Select Random Member Godfather in Edit Wedding Page
    Confirm Add Godfather in Edit Wedding Page
    Save Wedding Form Data in Edit Wedding Page
    Save Wedding Form Changes
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs

Delete Wedding Record
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
    Wedding Main Page Should Be Open
    Navigate to Add Wedding Page From Wedding Main Page
    Add Wedding Page Should Be Open
    Select Non-Member Bride Form
    Input Non-Member Bride Details    Brooke    J    Whitney
    Select Non-Member Groom Form
    Input Non-Member Groom Details    Rex    N    Graham
    Select Non-Member Bride Mother Form
    Input Non-Member Bride Mother Details    Vicky    M    Weston
    Select Non-Member Bride Father Form
    Input Non-Member Bride Father Details    Sterling    H    Moss
    Select Non-Member Groom Mother Form
    Input Non-Member Groom Mother Details    Bridget    N    Robinson
    Select Non-Member Groom Father Form
    Input Non-Member Groom Father Details    Baldwin    R    Fleur
    Input Wedding Location    The Citadel
    Input Wedding Date    12    25    2021
    Input Officiant Details    Father Shepard
    Input Solemnizing Officer Details    Pastor Anderson
    Input Contract Number    WR-100023
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Samara    S    Justicar
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Mordin    M    Solus
    Confirm Add Godfather
    Submit Wedding Registry
    View Wedding Page Should Be Open
    Delete Wedding Record
    Forms Main Page Should Be Open
