*** Settings ***
Documentation       A resource file with reusable keywords and variables
...
...                 Creating system specific keywords from default keywords
...                 from SeleniumLibrary

Library             SeleniumLibrary
Variables           variables.py
Resource            common.resource

*** Keywords ***
Return To Main Menu
    Wait Until Page Contains Element    css:*[data-icon="sign-out-alt"]
    Click Element                       css:*[data-icon="sign-out-alt"]

Has No Access To Edit (Level 1)
    Page Should Contain                 Add Member

Go To Add Members 1
    Wait Until Page Contains Element    css:*[src="../images/people.png"]
    Click Image                         ../images/people.png

Go To Edit Members
    [Arguments]                         ${member}
    Go To Add Members 1
    Wait Until Page Contains Element    css:*[data-href="/member/${member}"]
    Click Element                       css:*[data-href="/member/${member}"]
    Scroll To Element                   css:*[href="/edit_member/${member}"]
    Click Element                       css:*[href="/edit_member/${member}"]

Has No Access To Edit (Level 2)
    [Arguments]                         ${member}
    Go To Add Members 1
    Wait Until Page Contains Element    css:*[data-href="/member/${member}"]
    Click Element                       css:*[data-href="/member/${member}"]
    Page Should Not Contain             Edit Member

Has Access To Edit
    Go To Edit Members                  1
    Page Should Contain                 Edit Member