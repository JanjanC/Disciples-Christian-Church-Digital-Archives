*** Settings ***
Documentation     A test suite with a single test for valid login
...
...               This test follows the example using keywords from
...               the SeleniumLibrary
Resource          login.resource
Resource          wedding.resource
Test Teardown     Close Browser

*** Test Cases ***
Navigate to View Wedding Page (Level 1):
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Forms Main Page From Main Page
    Forms Main Page Should Be Open
    Navigate to Wedding Page From Forms Main Page
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
    Navigate to Wedding Main Page From View Wedding Page
    Wedding Main Page Should Be Open
    Navigate to View Wedding Page From Wedding Main Page
    View Wedding Page Should Be Open
    Delete Wedding Record
