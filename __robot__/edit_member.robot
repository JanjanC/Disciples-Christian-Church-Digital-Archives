*** Settings ***
Documentation     A test suite with for the Edit Member feature created by the former CSSWENG group. 
...
...               This test follows the example using keywords from
...               the SeleniumLibrary
Resource          login.resource
Resource          member.resource

*** Test Cases ***
Navigate To Edit Member (Level 1)
    member.Open Browser to Login Page
    Input Pass                            ${LEVEL 1 PASSWORD}
    member.Submit Credentials
    Go To Add Members 1
    Has No Access To Edit (Level 1)
    Return To Main Menu

Navigate To Edit Member (Level 2)
    Input Pass                            ${LEVEL 2 PASSWORD}
    member.Submit Credentials
    Has No Access To Edit (Level 2)    1
    Return To Main Menu

Navigate To Edit Member (Level 3)
    Input Pass                            ${LEVEL 3 PASSWORD}
    member.Submit Credentials
    Has Access To Edit
    Go To Level 3 Home Page

Edit Member
    Go To Edit Members                1
    Edit Member [All Inputs]
    Close Browser