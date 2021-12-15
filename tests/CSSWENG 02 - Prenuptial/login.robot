*** Settings ***
Documentation     A test suite with a single test for valid login
...
...               This test follows the example using keywords from
...               the SeleniumLibrary
Resource          common.resource
Resource          login.resource
Test Teardown     Close Browser

*** Test Cases ***
Valid Level 3 User Login
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open

Valid Level 2 User Login
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open

Valid Level 1 User Login
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open

Invalid User Login
    Open Browser to Login Page
    Login Invalid User
    Error Modal Shown

Empty User Login
    Open Browser to Login Page
    Login Empty User
