*** Settings ***
Documentation     A test suite with a single test for valid login
...
...               This test follows the example using keywords from
...               the SeleniumLibrary
Resource          common.resource
Resource          login.resource
Resource          prenuptial.resource
Test Teardown     Close Browser

*** Test Cases ***
Complete Input:
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Create Prenuptial Main Page
