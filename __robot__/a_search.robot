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
    View Linked Prenuptial Record                       111

Search Member Record Different Conditions 
    Access Advanced Search
    Search Member [All Conditions]                      Jonathan    N    Starfish    Female    19    21    Inactive    Honorary Member    Married    Oklahoma    Masters    Engineer    01/01/1970    1    02/22/2001
    Access Advanced Search
    Search Member [No Additional Conditions]
    Check Member [No Additional Conditions]
    Access Advanced Search
    Search Member [First Name Condition]                Jonathan    N    Starfish    Female    19    21    Inactive    Honorary Member    Married    Oklahoma    Masters    Engineer    01/01/1970    1    02/22/2001
    Access Advanced Search
    Search Member [Middle Initial Condition]            Jonathan    N    Starfish    Female    19    21    Inactive    Honorary Member    Married    Oklahoma    Masters    Engineer    01/01/1970    1    02/22/2001
    Access Advanced Search
    Search Member [Last Name Condition]                 Jonathan    N    Starfish    Female    19    21    Inactive    Honorary Member    Married    Oklahoma    Masters    Engineer    01/01/1970    1    02/22/2001
    Access Advanced Search
    Search Member [Sex Condition 2]                     Jonathan    N    Starfish    Female    19    21    Inactive    Honorary Member    Married    Oklahoma    Masters    Engineer    01/01/1970    1    02/22/2001
    Access Advanced Search
    Search Member [Age Condition]                       Jonathan    N    Starfish    Female    19    21    Inactive    Honorary Member    Married    Oklahoma    Masters    Engineer    01/01/1970    1    02/22/2001
    Access Advanced Search
    Search Member [Birthday Condition]                  Jonathan    N    Starfish    Female    19    21    Inactive    Honorary Member    Married    Oklahoma    Masters    Engineer    01/01/1970    1    02/22/2001    02/21/2001    02/23/2001
    Access Advanced Search
    Search Member [City Condition]                      Jonathan    N    Starfish    Female    19    21    Inactive    Honorary Member    Married    Oklahoma    Masters    Engineer    01/01/1970    1    02/22/2001
    Access Advanced Search
    Search Member [Educational Attainment Condition]    Jonathan    N    Starfish    Female    19    21    Inactive    Honorary Member    Married    Oklahoma    Masters    Engineer    01/01/1970    1    02/22/2001
    Access Advanced Search
    Search Member [Occupation Condition]                Jonathan    N    Starfish    Female    19    21    Inactive    Honorary Member    Married    Oklahoma    Masters    Engineer    01/01/1970    1    02/22/2001
    Access Advanced Search
    Search Member [Two Or More Conditions]              Jonathan    N    Starfish    Female    19    21    Inactive    Honorary Member    Married    Oklahoma    Masters    Engineer    01/01/1970    1    02/22/2001

Search Prenuptial Record Different Conditions
    Access Advanced Search
    Search Prenuptial Record [All Conditions]                        Donna    A    Grant    Elroy    B    Spalding    08/01/2021    08/03/2021    09/08/2021    09/10/2021    08/02/2021    09/09/2021    108
    Access Advanced Search
    Search Prenuptial Record [No Additional Conditions]
    Check Prenuptial Record [No Additional Condition]
    Access Advanced Search
    Search Prenuptial Record [Bride First Name Condition]            Donna        A        Grant        108        08/02/2021        Elroy        B        Spalding        09/09/2021
    Access Advanced Search
    Search Prenuptial Record [Bride Middle Initial Condition]        Donna    A    Grant    Elroy    B    Spalding    08/01/2021    08/03/2021    09/08/2021    09/10/2021    08/02/2021    09/09/2021    108
    Access Advanced Search
    Search Prenuptial Record [Bride Last Name Condition]             Donna    A    Grant    Elroy    B    Spalding    08/01/2021    08/03/2021    09/08/2021    09/10/2021    08/02/2021    09/09/2021    108
    Access Advanced Search
    Search Prenuptial Record [Groom First Name Condition]            Donna    A    Grant    Elroy    B    Spalding    08/01/2021    08/03/2021    09/08/2021    09/10/2021    08/02/2021    09/09/2021    108
    Access Advanced Search
    Search Prenuptial Record [Groom Middle Initial Condition]        Donna    A    Grant    Elroy    B    Spalding    08/01/2021    08/03/2021    09/08/2021    09/10/2021    08/02/2021    09/09/2021    108
    Access Advanced Search
    Search Prenuptial Record [Groom Last Name Condition]             Donna    A    Grant    Elroy    B    Spalding    08/01/2021    08/03/2021    09/08/2021    09/10/2021    08/02/2021    09/09/2021    108
    Access Advanced Search
    Search Prenuptial Record [Date Created Condition]                Donna    A    Grant    Elroy    B    Spalding    08/01/2021    08/03/2021    09/08/2021    09/10/2021    08/02/2021    09/09/2021    108
    Access Advanced Search
    Search Prenuptial Record [Proposed Date Of Wedding Condition]    Donna    A    Grant    Elroy    B    Spalding    08/01/2021    08/03/2021    09/08/2021    09/10/2021    08/02/2021    09/09/2021    108
    Access Advanced Search
    Search Prenuptial Record [Two Or More Conditions]                Donna    A    Grant    Elroy    B    Spalding    08/01/2021    08/03/2021    09/08/2021    09/10/2021    08/02/2021    09/09/2021    108

Search Wedding Record Different Conditions
    Access Advanced Search
    Search Wedding Record [All Conditions]               Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A
    Access Advanced Search
    Search Wedding Registry Record [No Additional Conditions]
    Check Wedding Registry Record [No Condition]
    Access Advanced Search
    Search Wedding Record [Bride Name Condition]         Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A
    Access Advanced Search
    Search Wedding Record [Groom Name Condition]         Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A
    Access Advanced Search
    Search Wedding Record [Bride Mother Condition]       Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A
    Access Advanced Search
    Search Wedding Record [Bride Father Condition]       Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A
    Access Advanced Search
    Search Wedding Record [Groom Mother Condition]       Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A
    Access Advanced Search
    Search Wedding Record [Groom Father Condition]       Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A
    Access Advanced Search
    Search Wedding Record [Wedding Date Condition]       Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A
    Access Advanced Search
    Search Wedding Record [Location Condition]           Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A
    Access Advanced Search
    Search Wedding Record [Officiant Condition]          Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A
    Access Advanced Search
    Search Wedding Record [Solemnizer Condition]         Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A
    Access Advanced Search
    Search Wedding Record [Contract Number Condition]    Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A
    Access Advanced Search
    Search Wedding Record [Two Or More Conditions]       Sally    C    Connor    Thane    T    Krios    Katherine    K    Goto    Kenji    K    Goto    Therese    T    Krios    Theo    T    Krios    12/24/2021    12/26/2021    The Citadel    Father Shepard    Pastor Anderson    249    WR-100023    02/06/2022    12/25/2021    N/A    N/A

Search Child Dedication [Different Conditions]
    Access Advanced Search
    Search Child Dedication [All Conditions]               Garrus    K    Vakarian    24    Liara    T    Soni    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    09/01/2021    Leon L. Bainto    De L. Bainto    08/30/2021    09/02/2021    01/31/2022
    Access Advanced Search
    Search Child Dedication Record [No Additional Conditions]
    Check Child Dedication Search Result [No Condition]
    Access Advanced Search
    Search Child Dedication [Child Name Condition]         Garrus    K    Vakarian    24    Liara    T    Soni    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    09/01/2021    Leon L. Bainto    De L. Bainto    08/30/2021    09/02/2021    01/31/2022
    Access Advanced Search
    Search Child Dedication [Mother Name Condition]        Garrus    K    Vakarian    24    Liara    T    Soni    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    09/01/2021    Leon L. Bainto    De L. Bainto    08/30/2021    09/02/2021    01/31/2022
    Access Advanced Search
    Search Child Dedication [Father Name Condition]        Garrus    K    Vakarian    24    Liara    T    Soni    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    09/01/2021    Leon L. Bainto    De L. Bainto    08/30/2021    09/02/2021    01/31/2022
    Access Advanced Search
    Search Child Dedication [Dedication Date Condition]    Garrus    K    Vakarian    24    Liara    T    Soni    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    09/01/2021    Leon L. Bainto    De L. Bainto    08/30/2021    09/02/2021    01/31/2022
    Access Advanced Search
    Search Child Dedication [Location Condition]           Garrus    K    Vakarian    24    Liara    T    Soni    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    09/01/2021    Leon L. Bainto    De L. Bainto
    Access Advanced Search
    Search Child Dedication [Officiant Condition]          Garrus    K    Vakarian    24    Liara    T    Soni    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    09/01/2021    Leon L. Bainto    De L. Bainto    08/30/2021    09/02/2021    01/31/2022
    Access Advanced Search
    Search Child Dedication [Two Or More Conditions]       Garrus    K    Vakarian    24    Liara    T    Soni    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    09/01/2021    Leon L. Bainto    De L. Bainto    08/30/2021    09/02/2021    01/31/2022

Search Baptismal [Different Conditions]
    Access Advanced Search
    Search Baptismal [All Conditions]    Jonathan    N    Starfish    Turner    M    Galloway    02/02/2022    02/04/2022    Malabon    74    02/07/2022    02/03/2022
    Access Advanced Search
    Search Baptismal Record [No Additional Conditions]
    Baptismal Record Results    74    75
    Access Advanced Search
    Search Baptismal Record [Baptized First Name Condition]    Jonathan    N    Starfish        74        Turner    M    Galloway        02/03/2022        Malabon
    Access Advanced Search
    Search Baptismal Record [Baptized Middle Initial Condition]    Jonathan    N    Starfish        74        Turner    M    Galloway        02/03/2022        Malabon
    Access Advanced Search
    Search Baptismal Record [Baptized Last Name Condition]    Jonathan    N    Starfish        74        Turner    M    Galloway        02/03/2022        Malabon
    Access Advanced Search
    Search Baptismal Record [Date Of Baptism Condition]    Jonathan    N    Starfish        74        Turner    M    Galloway        02/03/2022        Malabon    02/02/2022    02/04/2022
    Access Advanced Search
    Search Baptismal Record [Baptism Location Condition]    Jonathan    N    Starfish        74        Turner    M    Galloway        02/03/2022        Malabon
    Access Advanced Search
    Search Baptismal Record [Officiant First Name Condition]    Jonathan    N    Starfish        74        Turner    M    Galloway        02/03/2022        Malabon
    Access Advanced Search
    Search Baptismal Record [Officiant Middle Initial Condition]    Jonathan    N    Starfish        74        Turner    M    Galloway        02/03/2022        Malabon
    Access Advanced Search
    Search Baptismal Record [Officiant Last Name Condition]    Jonathan    N    Starfish        74        Turner    M    Galloway        02/03/2022        Malabon
    Access Advanced Search
    Search Baptismal Record [Atleast Two Conditions]    Jonathan    N    Starfish        74        Turner    M    Galloway        02/03/2022        Malabon

Viewing Search Results
    Access Advanced Search
    Search Member [Sex Condition]                       1
    Access Advanced Search
    Search Prenuptial Record [Bride First Name Condition]        Donna        A        Grant        108        08/02/2021        Elroy        B        Spalding        09/09/2021
    Access Advanced Search
    Search Wedding Record [Groom Condition]             Thane    T    Krios        249        WR-100023        02/06/2022        12/25/2021        Sally    C    Connor
    Access Advanced Search
    Search Child Dedication [Location Condition]        Garrus    K    Vakarian    24    Liara    T    Soni    ${EMPTY}    ${EMPTY}    ${EMPTY}    Pastor Shepard    The Citadel    09/01/2021    Leon L. Bainto    De L. Bainto
    Access Advanced Search
    Search Baptismal Record [Baptized First Name Condition]    Jonathan    N    Starfish        74        Turner    M    Galloway        02/03/2022        Malabon
    Close Browser