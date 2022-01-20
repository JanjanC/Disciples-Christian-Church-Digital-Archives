*** Settings ***
Documentation     A test suite with for the Edit Member feature created by the former CSSWENG group. 
...
...               This test follows the example using keywords from
...               the SeleniumLibrary
Resource          edit_member.resource
Resource          login.resource

*** Test Cases ***
Navigate To Edit Member (Level 1)
    Open Browser to Login Page
    Login Level 1 User
    Go To Add Members 1
    Has No Access To Edit (Level 1)
    Return To Main Menu

Navigate To Edit Member (Level 2)
    Login Level 2 User
    Has No Access To Edit (Level 2)    1
    Return To Main Menu

Navigate To Edit Member (Level 3)
    Login Level 3 User
    Has Access To Edit
    Return To Main Menu
    Close Browser