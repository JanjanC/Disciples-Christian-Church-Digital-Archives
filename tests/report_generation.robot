*** Settings ***
Documentation     A test suite with for the Report Generation feature created by the team. 
...
...               This test follows the example using keywords from
...               the SeleniumLibrary
Resource          login.resource
Resource          report_generation.resource

*** Test Cases ***
Level 1 Report Generation Access
    Open Browser to Login Page
    Login Level 1 User
    Access Report Generation
    Has No Access To Report Generation
    Close Browser

Level 2 Report Generation Access
    Open Browser to Login Page
    Login Level 2 User
    Access Report Generation
    Has No Access To Report Generation
    Close Browser

Level 3 Report Generation Access
    Open Browser to Login Page
    Login Level 3 User
    Access Report Generation
    Has Access To Report Generation
    Return To Home Page

Same Day Statistical Report
    Access Report Generation
    Input Start Date    01012022
    Input End Date      01012022
    Change Date
    Is Invalid Date

End Date Before Start Date
    Input Start Date    01022022
    Input End Date      01012022
    Change Date
    Is Invalid Date

Day Statistical Report
    Input Start Date    01012022
    Input End Date      01022022
    Change Date
    Is Valid Date

Month Statistical Report
    Input Start Date    01012022
    Input End Date      01312022
    Change Date
    Is Valid Date

Year Statistical Report
    Input Start Date    01012022
    Input End Date      12312022
    Change Date
    Is Valid Date

Twenty Years Or Less
    Input Start Date    01012002
    Input End Date      12312022
    Change Date
    Is Valid Date
Greater Than Twenty Years
    Input Start Date    01012002
    Input End Date      01012023
    Change Date
    Greater Than Twenty Years Report

Check Max Date
    Input Start Date    123099999
    Input End Date      123199999
    Change Date
    Is Valid Date
    Close Browser