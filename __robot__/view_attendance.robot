*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            attendance.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to View Attendance Page (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Add Attendance Page Should Be Open

Navigate to Edit Attendance Page (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to View Attendance Page From Attendance Main Page
    View Attendance Page Should Be Open

Navigate to Edit Attendance Page (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to View Attendance Page From Attendance Main Page
    View Attendance Page Should Be Open
