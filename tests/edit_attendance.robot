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
    Input Date of Service    01    01    2021
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
    Input Date of Service to Edit    01    01    2021
    Select Add Non-Member Button
    Input Non-Member Details    Maria    D    Cruz
    Confirm Add Non-Member
    Save Attendance Form Data in Edit Attendance Page
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    01    2021
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Add Member Attendance Record (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    02    2021
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
    Input Date of Service to Edit    01    02    2021
    Select Add Member Button
    Select Random Member
    Confirm Add Member
    Save Attendance Form Data in Edit Attendance Page
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    02    2021
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Remove Non-Member Attendance Record (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    03    2021
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
    Input Date of Service to Edit    01    03    2021
    Remove Non-Member
    Save Attendance Form Data in Edit Attendance Page
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    03    2021
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Remove Member Attendance Record (Level 2)
    Open Browser to Login Page
    Login Level 2 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    04    2021
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
    Input Date of Service to Edit    01    04    2021
    Remove Member
    Save Attendance Form Data in Edit Attendance Page
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    04    2021
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Add Non-Member Attendance Record (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    05    2021
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
    Input Date of Service to Edit    01    05    2021
    Select Add Non-Member Button
    Input Non-Member Details    Maria    D    Cruz
    Confirm Add Non-Member
    Save Attendance Form Data in Edit Attendance Page
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    05    2021
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Add Member Attendance Record (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    06    2021
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
    Input Date of Service to Edit    01    06    2021
    Select Add Member Button
    Select Random Member
    Confirm Add Member
    Save Attendance Form Data in Edit Attendance Page
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    06    2021
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Remove Non-Member Attendance Record (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    07    2021
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
    Input Date of Service to Edit    01    07    2021
    Remove Non-Member
    Save Attendance Form Data in Edit Attendance Page
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    07    2021
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open

Remove Member Attendance Record (Level 3)
    Open Browser to Login Page
    Login Level 3 User
    Main Page Should Be Open
    Navigate to Attendance Main Page From Main Page
    Attendance Main Page Should Be Open
    Navigate to Add Attendance Page From Attendance Main Page
    Input Date of Service    01    08    2021
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
    Input Date of Service to Edit    01    08    2021
    Remove Member
    Save Attendance Form Data in Edit Attendance Page
    Submit Service Attendance Record
    View Attendance Page Should Be Open
    View Attendance Page Should Match Form Inputs
    Navigate to Attendance Main Page From View Attendance Page
    Attendance Main Page Should Be Open
    Navigate to Edit Attendance Page From Attendance Main Page
    Edit Attendance Page Should Be Open
    Input Date of Service to Edit    01    08    2021
    Delete Service Attendance Record
    Edit Attendance Page Should Be Open
