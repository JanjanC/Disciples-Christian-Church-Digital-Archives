*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            wedding.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to Add Wedding Page (Level 3)
   Open Browser to Login Page
   Login Level 3 User
   Main Page Should Be Open
   Navigate to Forms Main Page From Main Page
   Forms Main Page Should Be Open
   Navigate to Wedding Page From Forms Main Page
   Wedding Main Page Should Be Open
   Navigate to Add Wedding Page From Wedding Main Page
   Add Wedding Page Should Be Open

Navigate to Add Wedding Page (Level 2)
   Open Browser to Login Page
   Login Level 2 User
   Main Page Should Be Open
   Navigate to Forms Main Page From Main Page
   Forms Main Page Should Be Open
   Navigate to Wedding Page From Forms Main Page
   Wedding Main Page Should Be Open
   Navigate to Add Wedding Page From Wedding Main Page
   Add Wedding Page Should Be Open

Navigate to Add Wedding Page (Level 1)
   Open Browser to Login Page
   Login Level 1 User
   Main Page Should Be Open
   Navigate to Forms Main Page From Main Page
   Forms Main Page Should Be Open
   Navigate to Wedding Page From Forms Main Page
   Add Wedding Page Should Be Open

Complete Members Input (Level 1)
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
   Select Add Godmother Button
   Select Member Godmother Form
   Select Random Member Godmother
   Confirm Add Godmother
   Select Add Godfather Button
   Select Member Godfather Form
   Select Random Member Godfather
   Confirm Add Godfather
   Save Wedding Form Data
   Submit Wedding Registry
   View Wedding Page Should Be Open
   View Wedding Page Should Match Form Inputs
   Delete Wedding Record

Complete Members Input (Level 2)
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
   Select Add Godmother Button
   Select Member Godmother Form
   Select Random Member Godmother
   Confirm Add Godmother
   Select Add Godfather Button
   Select Member Godfather Form
   Select Random Member Godfather
   Confirm Add Godfather
   Save Wedding Form Data
   Submit Wedding Registry
   View Wedding Page Should Be Open
   View Wedding Page Should Match Form Inputs
   Delete Wedding Record

Complete Members Input (Level 3)
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
   Select Add Godmother Button
   Select Member Godmother Form
   Select Random Member Godmother
   Confirm Add Godmother
   Select Add Godfather Button
   Select Member Godfather Form
   Select Random Member Godfather
   Confirm Add Godfather
   Save Wedding Form Data
   Submit Wedding Registry
   View Wedding Page Should Be Open
   View Wedding Page Should Match Form Inputs
   Delete Wedding Record

Blank Non-Member Bride Input
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
   Bride Error Should Be Shown

Blank Member Bride Input
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
   Bride Error Should Be Shown

Blank Non-Member Groom Input
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
   Input Non-Member Bride Details    Jane    F    Uson
   Select Non-Member Groom Form
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
   Groom Error Should Be Shown

Blank Member Groom Input
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
   Input Non-Member Bride Details    Jane    F    Uson
   Select Member Groom Form
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
   Groom Error Should Be Shown

Blank Non-Member Bride Mother Input
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
   Input Non-Member Bride Details    Jane    F    Uson
   Select Non-Member Groom Form
   Input Non-Member Groom Details    Thane    T    Krios
   Select Non-Member Bride Mother Form
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
   Bride Mother Error Should Be Shown

Blank Member Bride Mother Input
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
   Input Non-Member Bride Details    Jane    F    Uson
   Select Non-Member Groom Form
   Input Non-Member Groom Details    Thane    T    Krios
   Select Member Bride Mother Form
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
   Bride Mother Error Should Be Shown
   
Blank Non-Member Bride Father Input
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
   Input Non-Member Bride Details    Jane    F    Uson
   Select Non-Member Groom Form
   Input Non-Member Groom Details    Thane    T    Krios
   Select Non-Member Bride Mother Form
   Input Non-Member Bride Mother Details    Katherine    K    Goto
   Select Non-Member Bride Father Form
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
   Bride Father Error Should Be Shown

Blank Member Bride Father Input
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
   Input Non-Member Bride Details    Jane    F    Uson
   Select Non-Member Groom Form
   Input Non-Member Groom Details    Thane    T    Krios
   Select Non-Member Bride Mother Form
   Input Non-Member Bride Mother Details    Katherine    K    Goto
   Select Member Bride Father Form
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
   Bride Father Error Should Be Shown

Blank Non-Member Groom Mother Input
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
   Input Non-Member Bride Details    Jane    F    Uson
   Select Non-Member Groom Form
   Input Non-Member Groom Details    Thane    T    Krios
   Select Non-Member Bride Mother Form
   Input Non-Member Bride Mother Details    Katherine    K    Goto
   Select Non-Member Bride Father Form
   Input Non-Member Bride Father Details    Kenji    K    Goto
   Select Non-Member Groom Mother Form
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
   Groom Mother Error Should Be Shown

Blank Member Groom Mother Input
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
   Input Non-Member Bride Details    Jane    F    Uson
   Select Non-Member Groom Form
   Input Non-Member Groom Details    Thane    T    Krios
   Select Non-Member Bride Mother Form
   Input Non-Member Bride Mother Details    Katherine    K    Goto
   Select Non-Member Bride Father Form
   Input Non-Member Bride Father Details    Kenji    K    Goto
   Select Member Groom Mother Form
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
   Groom Mother Error Should Be Shown

Blank Wedding Location Input
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
   Input Non-Member Bride Details    Jane    F    Uson
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
   Wedding Location Error Should Be Shown

Blank Wedding Date Input
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
   Input Non-Member Bride Details    Jane    F    Uson
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
   Input Wedding Date    BACK_SPACE    BACK_SPACE    BACK_SPACE
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
   Wedding Date Error Should Be Shown

Blank Officiant Input
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
   Input Non-Member Bride Details    Jane    F    Uson
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
   Save Wedding Form Data
   Submit Wedding Registry
   Officiant Error Should Be Shown

Blank Solemnizing Officer Input
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
   Input Non-Member Bride Details    Jane    F    Uson
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
   Input Contract Number    WR-100023
   Select Add Godmother Button
   Select Non-Member Godmother Form
   Input Non-Member Godmother Details    Samara    S    Justicar
   Confirm Add Godmother
   Select Add Godfather Button
   Select Non-Member Godfather Form
   Input Non-Member Godfather Details    Mordin    M    Solus
   Confirm Add Godfather
   Save Wedding Form Data
   Submit Wedding Registry
   Solemnizing Officer Error Should Be Shown

Blank Contract Input
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
   Input Non-Member Bride Details    Jane    F    Uson
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
   Select Add Godmother Button
   Select Non-Member Godmother Form
   Input Non-Member Godmother Details    Samara    S    Justicar
   Confirm Add Godmother
   Select Add Godfather Button
   Select Non-Member Godfather Form
   Input Non-Member Godfather Details    Mordin    M    Solus
   Confirm Add Godfather
   Save Wedding Form Data
   Submit Wedding Registry
   Contract Error Should Be Shown

No Godmother Input
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
   Input Non-Member Bride Details    Jane    F    Uson
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
   Select Add Godfather Button
   Select Non-Member Godfather Form
   Input Non-Member Godfather Details    Mordin    M    Solus
   Confirm Add Godfather
   Save Wedding Form Data
   Submit Wedding Registry
   View Wedding Page Should Be Open
   View Wedding Page Should Match Form Inputs
   Delete Wedding Record

No Godfather Input
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
   Input Non-Member Bride Details    Jane    F    Uson
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
   Save Wedding Form Data
   Submit Wedding Registry
   View Wedding Page Should Be Open
   View Wedding Page Should Match Form Inputs
   Delete Wedding Record

No Godmother and Godfather Input
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
   Input Non-Member Bride Details    Jane    F    Uson
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
   Submit Wedding Registry
   Godmother and Godfather Error Should Be Shown

Complete Member - Bride, Bride Father, Groom Mother, and Witness & Non-Member - Groom, Bride Mother, Groom Father, and Witness Input
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
   Input Non-Member Groom Details    Jo    P    Page
   Select Non-Member Bride Mother Form
   Input Non-Member Bride Mother Details    Georgia    N    Nakano
   Select Member Bride Father Form
   Select Random Member Bride Father
   Select Member Groom Mother Form
   Select Random Member Groom Mother
   Select Non-Member Groom Father Form
   Input Non-Member Groom Father Details    Marshall    T    Page
   Input Wedding Location    The Citadel
   Input Wedding Date    12    25    2021
   Input Officiant Details    Father Shepard
   Input Solemnizing Officer Details    Pastor Anderson
   Input Contract Number    WR-100023
   Select Add Godmother Button
   Select Non-Member Godmother Form
   Input Non-Member Godmother Details    Jane    C    Lara
   Confirm Add Godmother
   Select Add Godfather Button
   Select Member Godfather Form
   Select Random Member Godfather
   Confirm Add Godfather
   Save Wedding Form Data
   Submit Wedding Registry
   View Wedding Page Should Be Open
   View Wedding Page Should Match Form Inputs
   Delete Wedding Record

Complete Member - Groom, Bride Mother, Groom Father, and Witness & Non-Member Bride, Bride Father, Groom Mother, and Witness Input
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
   Input Non-Member Bride Details    Gloria    D    Parish
   Select Member Groom Form
   Select Random Member Groom
   Select Member Bride Mother Form
   Select Random Member Bride Mother
   Select Non-Member Bride Father Form
   Input Non-Member Bride Father Details    Jonathan    E    Parish
   Select Non-Member Groom Mother Form
   Input Non-Member Groom Mother Details    Mary    C    Clarke
   Select Member Groom Father Form
   Select Random Member Groom Father
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
   Input Non-Member Godfather Details    Nathan    K    Sera
   Confirm Add Godfather
   Save Wedding Form Data
   Submit Wedding Registry
   View Wedding Page Should Be Open
   View Wedding Page Should Match Form Inputs
   Delete Wedding Record

Complete Non-Members Input
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
   Save Wedding Form Data
   Submit Wedding Registry
   View Wedding Page Should Be Open
   View Wedding Page Should Match Form Inputs
   Delete Wedding Record

Complete Member - Bride, Groom, Bride Mother, Groom Mother, and Witness & Non-Member Bride Father, Groom Father, and Witness Input
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
   Select Non-Member Bride Father Form
   Input Non-Member Bride Father Details    Dan    P    Nakano
   Select Member Groom Mother Form
   Select Random Member Groom Mother
   Select Non-Member Groom Father Form
   Input Non-Member Groom Father Details    Terry    B    Vakarian
   Input Wedding Location    The Citadel
   Input Wedding Date    12    25    2021
   Input Officiant Details    Father Shepard
   Input Solemnizing Officer Details    Pastor Anderson
   Input Contract Number    WR-100023
   Select Add Godmother Button
   Select Member Godmother Form
   Select Random Member Godmother
   Confirm Add Godmother
   Select Add Godmother Button
   Select Non-Member Godmother Form
   Input Non-Member Godmother Details    Lisa    T    Pan
   Confirm Add Godmother
   Select Add Godfather Button
   Select Member Godfather Form
   Select Random Member Godfather
   Confirm Add Godfather
   Select Add Godfather Button
   Select Non-Member Godfather Form
   Input Non-Member Godfather Details    Josuke    S    Higashikata
   Confirm Add Godfather
   Save Wedding Form Data
   Submit Wedding Registry
   View Wedding Page Should Be Open
   View Wedding Page Should Match Form Inputs
   Delete Wedding Record

Complete Member - Bride, Groom, and Witness Input
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
   Select No Bride Mother Form
   Select No Bride Father Form
   Select No Groom Mother Form
   Select No Groom Father Form
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
   Select Member Godfather Form
   Select Random Member Godfather
   Confirm Add Godfather
   Save Wedding Form Data
   Submit Wedding Registry
   View Wedding Page Should Be Open
   View Wedding Page Should Match Form Inputs
   Delete Wedding Record

Complete Non-Member - Bride, Groom, and Groom Mother & Member - Bride Father and Witness Input
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
   Input Non-Member Bride Details    Lisa    D    Peters
   Select Non-Member Groom Form
   Input Non-Member Groom Details    Drew    G    Bucks
   Select No Bride Mother Form
   Select Member Bride Father Form
   Select Random Member Bride Father
   Select Non-Member Groom Mother Form
   Input Non-Member Groom Mother Details    Diane    G    Bucks
   Select No Groom Father Form
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
   Select Member Godfather Form
   Select Random Member Godfather
   Confirm Add Godfather
   Save Wedding Form Data
   Submit Wedding Registry
   View Wedding Page Should Be Open
   View Wedding Page Should Match Form Inputs
   Delete Wedding Record

Complete One Godfather and One Godmother Input
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
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record

Complete One Godmother Input
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
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record

Complete One Godfather Input
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
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record

Complete Six Godmother and Six Godfather Input
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
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record

Complete Six Godmother Input
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
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record

Complete Six Godfather Input
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
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record

Complete Seven Godmother and Seven Godfather Input
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
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record

Complete Seven Godmother and No Godfather Input
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
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record

Complete No Godmother and Seven Godfather Input
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
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record

Complete Seven Godmother and Valid Godfather Input
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
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record

Complete Valid Godmother and Seven Godfather Input
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
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Liara    M    Tsoni
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
    Select Add Godfather Button
    Godfather Maximum Warning Should Be Shown
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record

Blank Godmother and Godfather Input
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
    Submit Wedding Registry
    Godmother and Godfather Error Should Be Shown

Complete Deleted Godmother Input
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
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Remove Godmother
    Submit Wedding Registry
    Godmother and Godfather Error Should Be Shown
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record

Complete Deleted Godfather Input
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
    Select Add Godfather Button
    Select Non-Member Godfather Form
    Input Non-Member Godfather Details    Joseph    J    Joestar
    Confirm Add Godfather
    Remove Godfather
    Submit Wedding Registry
    Godmother and Godfather Error Should Be Shown
    Select Add Godmother Button
    Select Non-Member Godmother Form
    Input Non-Member Godmother Details    Urdnot    T    Wrex
    Confirm Add Godmother
    Save Wedding Form Data
    Submit Wedding Registry
    View Wedding Page Should Be Open
    View Wedding Page Should Match Form Inputs
    Delete Wedding Record
