*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            attendance.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to Edit Attendance Page (Level 1)
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
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open

Navigate to Edit Attendance Page (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open

Add Non-Member Attendance Record (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    Bainto
    Select Add Member Button
    Select Random Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Select Add Non-Member Button
    Input Non-Member Details    Maria    D    Cruz
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Add Member Attendance Record (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    Bainto
    Select Add Member Button
    Select Random Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Select Add Member Button
    Select Random Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Remove Non-Member Attendance Record (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    Bainto
    Select Add Member Button
    Select Random Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Remove Non-Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Remove Member Attendance Record (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    Bainto
    Select Add Member Button
    Select Random Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Remove Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Add Non-Member Attendance Record (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    Bainto
    Select Add Member Button
    Select Random Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Select Add Non-Member Button
    Input Non-Member Details    Maria    D    Cruz
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Add Member Attendance Record (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    Bainto
    Select Add Member Button
    Select Random Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Select Add Member Button
    Select Random Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Remove Non-Member Attendance Record (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    Bainto
    Select Add Member Button
    Select Random Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Remove Non-Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Remove Member Attendance Record (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    Bainto
    Select Add Member Button
    Select Random Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Remove Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open
