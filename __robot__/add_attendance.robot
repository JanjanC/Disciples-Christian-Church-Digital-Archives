*** Settings ***
Documentation       A test suite with a single test for valid login
...
...                 This test follows the example using keywords from
...                 the SeleniumLibrary

Resource            login.resource
Resource            attendance.resource

Test Teardown       Close Browser

*** Test Cases ***
Navigate to Add Attendance Page (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Add Attendance Page Should Be Open

Navigate to Add Attendance Page (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Add Attendance Page Should Be Open

Navigate to Add Attendance Page (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Add Attendance Page Should Be Open

Complete Member Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    04    2020
    Add Attendance Page Should Be Open
    Select Add Member Button
    Select Random Member
    Confirm Add Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Logout User
    Login Page Should Be Open
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    04    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Member Attendance Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    05    2020
    Add Attendance Page Should Be Open
    Select Add Member Button
    Select Random Member
    Confirm Add Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    05    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Member Attendance Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    06    2020
    Add Attendance Page Should Be Open
    Select Add Member Button
    Select Random Member
    Confirm Add Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    06    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Non-Member and Member Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    07    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    L    Bainto
    Confirm Add Non-Member
    Select Add Member Button
    Select Random Member
    Confirm Add Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Logout User
    Login Page Should Be Open
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    07    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Non-Member and Member Attendance Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    08    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    L    Bainto
    Confirm Add Non-Member
    Select Add Member Button
    Select Random Member
    Confirm Add Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    08    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Non-Member and Member Attendance Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    09    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    L    Bainto
    Confirm Add Non-Member
    Select Add Member Button
    Select Random Member
    Confirm Add Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    09    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Non-Member Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    01    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    L    Bainto
    Confirm Add Non-Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Logout User
    Login Page Should Be Open
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Non-Member Attendance Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    02    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    L    Bainto
    Confirm Add Non-Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    02    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Complete Non-Member Attendance Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    03    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    L    Bainto
    Confirm Add Non-Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    03    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Blank Non-Member Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    10    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Confirm Add Non-Member
    Incomplete Non-Member Information Error Should Be Shown

Blank Non-Member Attendance Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    11    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Confirm Add Non-Member
    Incomplete Non-Member Information Error Should Be Shown

Blank Non-Member Attendance Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    12    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Confirm Add Non-Member
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member First Name Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    13    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    ${EMPTY}    L    Bainto
    Confirm Add Non-Member
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member First Name Attendance Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    14    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    ${EMPTY}    L    Bainto
    Confirm Add Non-Member
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member First Name Attendance Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    15    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    ${EMPTY}    L    Bainto
    Confirm Add Non-Member
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member Last Name Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    16    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    L    ${EMPTY}
    Confirm Add Non-Member
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member Last Name Attendance Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    17    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    L    ${EMPTY}
    Confirm Add Non-Member
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member Last Name Attendance Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    18    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    L    ${EMPTY}
    Confirm Add Non-Member
    Incomplete Non-Member Information Error Should Be Shown

Missing Non-Member Middle Initial Attendance Input (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Input Date of Service    01    19    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    ${EMPTY}    Bainto
    Confirm Add Non-Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Logout User
    Login Page Should Be Open
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    19    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Missing Non-Member Middle Initial Attendance Input (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    20    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    ${EMPTY}    Bainto
    Confirm Add Non-Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    20    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Missing Non-Member Middle Initial Attendance Input (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    21    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    ${EMPTY}    Bainto
    Confirm Add Non-Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    21    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Existing Attendance Record Input
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    23    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    L    Bainto
    Confirm Add Non-Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    23    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    L    Bainto
    Confirm Add Non-Member
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    23    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

No Existing Attendance Record Input
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    22    2020
    Add Attendance Page Should Be Open
    Select Add Non-Member Button
    Input Non-Member Details    John Matthew    L    Bainto
    Confirm Add Non-Member
    Save Attendance Form Data
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    22    2020
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open