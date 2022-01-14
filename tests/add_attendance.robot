*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            attendance.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to Add Attendance Page (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Add Attendance Page Should Be Open

Navigate to Add Attendance Page (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Add Attendance Page Should Be Open

Navigate to Add Attendance Page (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Add Attendance Page Should Be Open

Complete Non-Member Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    Bainto
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Logout User
    Login Page Should Be Open
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Non-Member Attendance Input (Level 2)
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
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Non-Member Attendance Input (Level 3)
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
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Member Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Member Button
    Select Random Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Logout User
    Login Page Should Be Open
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Member Attendance Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
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

Complete Member Attendance Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
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

Complete Non-Member and Member Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    Bainto
    Select Add Member Button
    Select Random Member
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Logout User
    Login Page Should Be Open
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Non-Member and Member Attendance Input (Level 2)
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
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Non-Member and Member Attendance Input (Level 3)
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
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Blank Non-Member Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Incomplete Non-Member Information Error Should Be Shown

Blank Non-Member Attendance Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Incomplete Non-Member Information Error Should Be Shown

Blank Non-Member Attendance Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member First Name Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    ${EMPTY}    L    Bainto
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member First Name Attendance Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    ${EMPTY}    L    Bainto
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member First Name Attendance Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    ${EMPTY}    L    Bainto
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member Last Name Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    ${EMPTY}
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member Last Name Attendance Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    ${EMPTY}
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member Last Name Attendance Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    ${EMPTY}
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member Middle Initial Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    ${EMPTY}    Bainto
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Logout User
    Login Page Should Be Open
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Missing Non-Member Middle Initial Attendance Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    ${EMPTY}    Bainto
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Missing Non-Member Middle Initial Attendance Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    ${EMPTY}    Bainto
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

No Existing Attendance Record Input
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
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Existing Attendance Record Input
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
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    01    2022
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John    L    Bainto
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2022
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open
