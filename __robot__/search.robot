*** Settings ***
Documentation    A test suite with for the old Search feature created during CSSWENG. 
...
...              This test follows the example using keywords from
...              the SeleniumLibrary
Resource         search.resource

*** Test Cases ***
Access Advanced Search [Level 1]
    Open Browser To Login Page
    Input Pass                                          ${LEVEL 1 PASSWORD}
    Submit Credentials
    Access Advanced Search
    Has No Access To Advanced Search
    Go To Home Page
    Close Browser

Access Advanced Search [Level 2]
    Open Browser To Login Page
    Input Pass                                          ${LEVEL 2 PASSWORD}
    Submit Credentials
    Access Advanced Search
    Go To Home Page
    Close Browser

Access Advanced Search [Level 3]
    Open Browser To Login Page
    Input Pass                                          ${LEVEL 3 PASSWORD}
    Submit Credentials
    Access Advanced Search
    Go To Home Page

Sort Members
    Access Advanced Search
    Search Member [No Additional Conditions]
    Record Is Ascending By                              css:*[aria-label="ID: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="ID: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="ID: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Name: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Name: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Name: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Name: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Age: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Age: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Age: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Age: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Birth Date: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Birth Date: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Birth Date: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Birth Date: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Contact Number: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Contact Number: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Contact Number: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Contact Number: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Email Address: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Email Address: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Email Address: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Email Address: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Address: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Address: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Address: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Address: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Date Created: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Date Created: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Date Created: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Date Created: activate to sort column ascending"]
    Go To Home Page

Sort Prenuptial Records
    Access Advanced Search
    Search Prenuptial Record [No Additional Conditions]
    Record Is Ascending By                              css:*[aria-label="Registry Number: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Registry Number: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Registry Number: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Groom: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Groom: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Groom: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Groom: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Bride: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Bride: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Bride: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Bride: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Date Created: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Date Created: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Date Created: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Date Created: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Date of Wedding: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Date of Wedding: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Date of Wedding: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Date of Wedding: activate to sort column ascending"]
    Go To Home Page

Sort Child Dedication Records
    Access Advanced Search
    Search Child Dedication Record [No Additional Conditions]
    Record Is Ascending By                              css:*[aria-label="Registry Number: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Registry Number: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Registry Number: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Child: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Child: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Child: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Child: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Parent/Guardian: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Parent/Guardian: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Parent/Guardian: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Parent/Guardian: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Date Created: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Date Created: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Date Created: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Date Created: activate to sort column ascending"]
    Go To Home Page

Sort Wedding Registries
    Access Advanced Search
    Search Wedding Registry Record [No Additional Conditions]
    Record Is Ascending By                              css:*[aria-label="Registry Number: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Registry Number: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Registry Number: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Groom: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Groom: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Groom: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Groom: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Bride: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Bride: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Bride: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Bride: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Date of Wedding: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Date of Wedding: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Date of Wedding: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Date of Wedding: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Date Created: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Date Created: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Date Created: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Date Created: activate to sort column ascending"]
    Go To Home Page

Sort Baptismal Records
    Access Advanced Search
    Search Baptismal Record [No Additional Conditions]
    Record Is Ascending By                              css:*[aria-label="Registry Number: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Registry Number: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Registry Number: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Name: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Name: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Name: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Name: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Date of Baptism: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Date of Baptism: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Date of Baptism: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Date of Baptism: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Location: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Location: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Location: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Location: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Officiant: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Officiant: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Officiant: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Officiant: activate to sort column ascending"]
    Sort Record                                         css:*[aria-label="Date Created: activate to sort column ascending"]
    Record Is Ascending By                              css:*[aria-label="Date Created: activate to sort column descending"]
    Sort Record                                         css:*[aria-label="Date Created: activate to sort column descending"]
    Record Is Descending By                             css:*[aria-label="Date Created: activate to sort column ascending"]
    Go To Home Page

Navigate Linked Records
    Access Advanced Search
    Navigate Member                                     1
    View Linked Prenuptial Record                       13
    Access Advanced Search
    Navigate Member                                     1
    View Linked Wedding Record                          2
    Access Advanced Search
    Navigate Member                                     1
    View Linked Baptismal Record                        5
    Access Advanced Search
    Navigate Member                                     1
    View Linked Child Dedication Record                 9

Search Member Record Different Conditions 
    Access Advanced Search
    Search Member [All Conditions]                      Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966
    Access Advanced Search
    Search Member [No Additional Conditions]
    Check Member [No Additional Conditions]
    Access Advanced Search
    Search Member [First Name Condition]                Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966
    Access Advanced Search
    Search Member [Middle Initial Condition]            Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966
    Access Advanced Search
    Search Member [Last Name Condition]                 Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966
    Access Advanced Search
    Search Member [Sex Condition 2]                     Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966
    Access Advanced Search
    Search Member [Age Condition]                       Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966
    Access Advanced Search
    Search Member [Birthday Condition]                  Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966    09/24/1966    09/27/1966
    Access Advanced Search
    Search Member [Membership Status Condition]         Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966
    Access Advanced Search
    Search Member [Civil Status Condition]              Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966
    Access Advanced Search
    Search Member [City Condition]                      Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966
    Access Advanced Search
    Search Member [Educational Attainment Condition]    Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966
    Access Advanced Search
    Search Member [Occupation Condition]                Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966
    Access Advanced Search
    Search Member [Two Or More Conditions]              Joseph    J    Joestar    Male    54    56    Active    Regular Member (Resident)    Married    Ottawa    High School    Engineer    01/01/1970    98    09/26/1966

Search Prenuptial Record Different Conditions
    Access Advanced Search
    Search Prenuptial Record [All Conditions]                        Leola    R    Matthews    Clayton    S    Kersey    02/06/2022    02/08/2022    08/01/2022    08/03/2022    02/07/2022    08/02/2022    110
    Access Advanced Search
    Search Prenuptial Record [No Additional Conditions]
    Check Prenuptial Record [No Additional Condition]
    Access Advanced Search
    Search Prenuptial Record [Bride First Name Condition]            Leola        R        Matthews        110        02/07/2022        Clayton        S        Kersey        08/02/2022
    Access Advanced Search
    Search Prenuptial Record [Bride Middle Initial Condition]        Leola    R    Matthews    Clayton    S    Kersey    02/06/2022    02/08/2022    08/01/2022    08/03/2022    02/07/2022    08/02/2022    110
    Access Advanced Search
    Search Prenuptial Record [Bride Last Name Condition]             Leola    R    Matthews    Clayton    S    Kersey    02/06/2022    02/08/2022    08/01/2022    08/03/2022    02/07/2022    08/02/2022    110
    Access Advanced Search
    Search Prenuptial Record [Groom First Name Condition]            Leola    R    Matthews    Clayton    S    Kersey    02/06/2022    02/08/2022    08/01/2022    08/03/2022    02/07/2022    08/02/2022    110
    Access Advanced Search
    Search Prenuptial Record [Groom Middle Initial Condition]        Leola    R    Matthews    Clayton    S    Kersey    02/06/2022    02/08/2022    08/01/2022    08/03/2022    02/07/2022    08/02/2022    110
    Access Advanced Search
    Search Prenuptial Record [Groom Last Name Condition]             Leola    R    Matthews    Clayton    S    Kersey    02/06/2022    02/08/2022    08/01/2022    08/03/2022    02/07/2022    08/02/2022    110
    Access Advanced Search
    Search Prenuptial Record [Date Created Condition]                Leola    R    Matthews    Clayton    S    Kersey    02/06/2022    02/08/2022    08/01/2022    08/03/2022    02/07/2022    08/02/2022    110
    Access Advanced Search
    Search Prenuptial Record [Proposed Date Of Wedding Condition]    Leola    R    Matthews    Clayton    S    Kersey    02/06/2022    02/08/2022    08/01/2022    08/03/2022    02/07/2022    08/02/2022    110
    Access Advanced Search
    Search Prenuptial Record [Two Or More Conditions]                Leola    R    Matthews    Clayton    S    Kersey    02/06/2022    02/08/2022    08/01/2022    08/03/2022    02/07/2022    08/02/2022    110

Search Wedding Record Different Conditions
    Access Advanced Search
    Search Wedding Record [All Conditions]               Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano
    Access Advanced Search
    Search Wedding Registry Record [No Additional Conditions]
    Check Wedding Registry Record [No Condition]
    Access Advanced Search
    Search Wedding Record [Bride Name Condition]         Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano
    Access Advanced Search
    Search Wedding Record [Groom Name Condition]         Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano
    Access Advanced Search
    Search Wedding Record [Bride Mother Condition]       Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano
    Access Advanced Search
    Search Wedding Record [Bride Father Condition]       Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano
    Access Advanced Search
    Search Wedding Record [Groom Mother Condition]       Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano
    Access Advanced Search
    Search Wedding Record [Groom Father Condition]       Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano
    Access Advanced Search
    Search Wedding Record [Wedding Date Condition]       Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano
    Access Advanced Search
    Search Wedding Record [Location Condition]           Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano
    Access Advanced Search
    Search Wedding Record [Officiant Condition]          Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano
    Access Advanced Search
    Search Wedding Record [Solemnizer Condition]         Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano
    Access Advanced Search
    Search Wedding Record [Contract Number Condition]    Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano
    Access Advanced Search
    Search Wedding Record [Two Or More Conditions]       Liara    B    Tsoni    Josuke    J    Higashikata    Nino    N    Nakano    Jonathan Jr    J    Joestar    Miku    N    Nakano    Joseph    J    Joestar    02/17/2022    02/19/2022    DLSU    Yo mama    Yo papa    426    1920438    02/07/2022    02/18/2022    Isaac C. Clarke    Yotsuba N. Nakano

Search Child Dedication [Different Conditions]
    Access Advanced Search
    Search Child Dedication [All Conditions]               Jimmy    K    Webb    5    Samson    W    Elliot    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    08/01/2021    Mike R. Cooper    Andrea T. Peyton    07/30/2021    08/02/2021    02/07/2022
    Access Advanced Search
    Search Child Dedication Record [No Additional Conditions]
    Check Child Dedication Search Result [No Condition]
    Access Advanced Search
    Search Child Dedication [Child Name Condition]         Jimmy    K    Webb    5    Samson    W    Elliot    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    08/01/2021    Mike R. Cooper    Andrea T. Peyton    07/30/2021    08/02/2021    02/07/2022
    Access Advanced Search
    Search Child Dedication [Mother Name Condition]        Jimmy    K    Webb    5    Samson    W    Elliot    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    08/01/2021    Mike R. Cooper    Andrea T. Peyton    07/30/2021    08/02/2021    02/07/2022
    Access Advanced Search
    Search Child Dedication [Father Name Condition]        Jimmy    K    Webb    5    Samson    W    Elliot    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    08/01/2021    Mike R. Cooper    Andrea T. Peyton    07/30/2021    08/02/2021    02/07/2022
    Access Advanced Search
    Search Child Dedication [Dedication Date Condition]    Jimmy    K    Webb    5    Samson    W    Elliot    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    08/01/2021    Mike R. Cooper    Andrea T. Peyton    07/30/2021    08/02/2021    02/07/2022
    Access Advanced Search
    Search Child Dedication [Location Condition]           Jimmy        K        Webb       5        Samson        W        Elliot        ${EMPTY}        ${EMPTY}        ${EMPTY}        Pastor Shepard        The Citadel        08/01/2021        Mike R. Cooper        Andrea T. Peyton
    Access Advanced Search
    Search Child Dedication [Officiant Condition]          Jimmy    K    Webb    5    Samson    W    Elliot    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    08/01/2021    Mike R. Cooper    Andrea T. Peyton    07/30/2021    08/02/2021    02/07/2022
    Access Advanced Search
    Search Child Dedication [Two Or More Conditions]       Jimmy    K    Webb    5    Samson    W    Elliot    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    08/01/2021    Mike R. Cooper    Andrea T. Peyton    07/30/2021    08/02/2021    02/07/2022

Search Baptismal [Different Conditions]
    Access Advanced Search
    Search Baptismal [All Conditions]    Joseph    J    Joestar    Lawrence    E    Edwards    01/01/2000    01/03/2000    Manila Church    77    02/07/2022    01/02/2000
    Access Advanced Search
    Search Baptismal Record [No Additional Conditions]
    Baptismal Record Results    41    43
    Access Advanced Search
    Search Baptismal Record [Baptized First Name Condition]    Joseph    J    Joestar        77        Lawrence    E    Edwards        01/02/2000        Manila Church
    Access Advanced Search
    Search Baptismal Record [Baptized Middle Initial Condition]    Joseph    J    Joestar        77        Lawrence    E    Edwards        01/02/2000        Manila Church
    Access Advanced Search
    Search Baptismal Record [Baptized Last Name Condition]    Joseph    J    Joestar        77        Lawrence    E    Edwards        01/02/2000        Manila Church
    Access Advanced Search
    Search Baptismal Record [Date Of Baptism Condition]    Joseph    J    Joestar        77        Lawrence    E    Edwards        01/02/2000        Manila Church    01/01/2000    01/03/2000
    Access Advanced Search
    Search Baptismal Record [Baptism Location Condition]    Joseph    J    Joestar        77        Lawrence    E    Edwards        01/02/2000        Manila Church
    Access Advanced Search
    Search Baptismal Record [Officiant First Name Condition]    Joseph    J    Joestar        77        Lawrence    E    Edwards        01/02/2000        Manila Church
    Access Advanced Search
    Search Baptismal Record [Officiant Middle Initial Condition]    Joseph    J    Joestar        77        Lawrence    E    Edwards        01/02/2000        Manila Church
    Access Advanced Search
    Search Baptismal Record [Officiant Last Name Condition]    Joseph    J    Joestar        77        Lawrence    E    Edwards        01/02/2000        Manila Church
    Access Advanced Search
    Search Baptismal Record [Atleast Two Conditions]    Joseph    J    Joestar        77        Lawrence    E    Edwards        01/02/2000        Manila Church

Viewing Search Results
    Access Advanced Search
    Search Member [Sex Condition]                       1
    Access Advanced Search
    Search Prenuptial Record [Bride First Name Condition]        Leola        R        Matthews        110        02/07/2022        Clayton        S        Kersey        08/02/2022
    Access Advanced Search
    Search Wedding Record [Groom Condition]             Josuke    J    Higashikata        426        1920438        02/07/2022        02/18/2022        Liara    B    Tsoni
    Access Advanced Search
    Search Child Dedication [Location Condition]        Jimmy        K        Webb       5        Samson        W        Elliot        ${EMPTY}        ${EMPTY}        ${EMPTY}        Pastor Shepard        The Citadel        08/01/2021        Mike R. Cooper        Andrea T. Peyton
    Access Advanced Search
    Search Baptismal Record [Baptized First Name Condition]    Joseph    J    Joestar        77        Lawrence    E    Edwards        01/02/2000        Manila Church
    Close Browser