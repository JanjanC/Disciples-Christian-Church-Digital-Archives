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
    Menu Page 1 Should Be Open
    Access Advanced Search
    Has No Access To Advanced Search
    Go To Home Page
    Close Browser

Access Advanced Search [Level 2]
    Open Browser To Login Page
    Input Pass                                          ${LEVEL 2 PASSWORD}
    Submit Credentials
    Menu Page 2 Should Be Open
    Access Advanced Search
    Has Access To Advanced Search
    Go To Home Page
    Close Browser

Access Advanced Search [Level 3]
    Open Browser To Login Page
    Input Pass                                          ${LEVEL 3 PASSWORD}
    Submit Credentials
    Menu Page 3 Should Be Open
    Access Advanced Search
    Has Access To Advanced Search
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
    Open Browser To Login Page
    Input Pass                                          ${LEVEL 3 PASSWORD}
    Submit Credentials
    Menu Page 3 Should Be Open
    Access Advanced Search
    Has Access To Advanced Search
    Navigate Member                                     1000001
    View Linked Prenuptial Record                       4000001
    Access Advanced Search
    Navigate Member                                     1000001
    View Linked Wedding Record                          5000001
    Access Advanced Search
    Navigate Member                                     1000001
    View Linked Baptismal Record                        3000001
    Access Advanced Search
    Navigate Member                                     1000001
    View Linked Child Dedication Record                 7000005

Search Member Record Different Conditions 
    Access Advanced Search
    Search Member [All Conditions]                      Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974
    Access Advanced Search
    Search Member [No Additional Conditions]
    Check Member [No Additional Conditions]
    Access Advanced Search
    Search Member [First Name Condition]                Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974
    Access Advanced Search
    Search Member [Middle Initial Condition]            Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974
    Access Advanced Search
    Search Member [Last Name Condition]                 Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974
    Access Advanced Search
    Search Member [Sex Condition 2]                     Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974
    Access Advanced Search
    Search Member [Age Condition]                       Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974
    Access Advanced Search
    Search Member [Birthday Condition]                  Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974    03/29/1974    03/31/1974
    Access Advanced Search
    Search Member [Membership Status Condition]         Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974
    Access Advanced Search
    Search Member [Civil Status Condition]              Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974
    Access Advanced Search
    Search Member [City Condition]                      Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974
    Access Advanced Search
    Search Member [Educational Attainment Condition]    Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974
    Access Advanced Search
    Search Member [Occupation Condition]                Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974
    Access Advanced Search
    Search Member [Two Or More Conditions]              Henry    B    Bainto    Male    47    48    Active    Regular Member (Resident)    Single    Manila    College    IT Consultant    12/28/2021    1000004    03/30/1974

Search Prenuptial Record Different Conditions
    Access Advanced Search
    Search Prenuptial Record [All Conditions]                        Maria    L    Santos    Soma    Y    Ahcac    12/28/2021    12/29/2021    07/28/2022    07/29/2022    12/29/2021    07/29/2022    4000001
    Access Advanced Search
    Search Prenuptial Record [No Additional Conditions]
    Check Prenuptial Record [No Additional Condition]
    Access Advanced Search
    Search Prenuptial Record [Bride First Name Condition]            Jamie        P        Antonio        4000003        12/29/2021        John        D        Bainto        11/13/2024
    Access Advanced Search
    Search Prenuptial Record [Bride Middle Initial Condition]        Maria    L    Santos    Soma    Y    Ahcac    12/28/2021    12/29/2021    07/28/2022    07/29/2022    12/29/2021    07/29/2022    4000001
    Access Advanced Search
    Search Prenuptial Record [Bride Last Name Condition]             Maria    L    Santos    Soma    Y    Ahcac    12/28/2021    12/29/2021    07/28/2022    07/29/2022    12/29/2021    07/29/2022    4000001
    Access Advanced Search
    Search Prenuptial Record [Groom First Name Condition]            Maria    L    Santos    Soma    Y    Ahcac    12/28/2021    12/29/2021    07/28/2022    07/29/2022    12/29/2021    07/29/2022    4000001
    Access Advanced Search
    Search Prenuptial Record [Groom Middle Initial Condition]        Maria    L    Santos    Soma    Y    Ahcac    12/28/2021    12/29/2021    07/28/2022    07/29/2022    12/29/2021    07/29/2022    4000001
    Access Advanced Search
    Search Prenuptial Record [Groom Last Name Condition]             Maria    L    Santos    Soma    Y    Ahcac    12/28/2021    12/29/2021    07/28/2022    07/29/2022    12/29/2021    07/29/2022    4000001
    Access Advanced Search
    Search Prenuptial Record [Date Created Condition]                Maria    L    Santos    Soma    Y    Ahcac    12/28/2021    12/29/2021    07/28/2022    07/29/2022    12/29/2021    07/29/2022    4000001
    Access Advanced Search
    Search Prenuptial Record [Proposed Date Of Wedding Condition]    Maria    L    Santos    Soma    Y    Ahcac    12/28/2021    12/29/2021    07/28/2022    07/29/2022    12/29/2021    07/29/2022    4000001
    Access Advanced Search
    Search Prenuptial Record [Two Or More Conditions]                Maria    L    Santos    Soma    Y    Ahcac    12/28/2021    12/29/2021    07/28/2022    07/29/2022    12/29/2021    07/29/2022    4000001

Search Wedding Record Different Conditions
    Access Advanced Search
    Search Wedding Record [All Conditions]               Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba
    Access Advanced Search
    Search Wedding Registry Record [No Additional Conditions]
    Check Wedding Registry Record [No Condition]
    Access Advanced Search
    Search Wedding Record [Bride Name Condition]         Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba
    Access Advanced Search
    Search Wedding Record [Groom Name Condition]         Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba
    Access Advanced Search
    Search Wedding Record [Bride Mother Condition]       Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba
    Access Advanced Search
    Search Wedding Record [Bride Father Condition]       Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba
    Access Advanced Search
    Search Wedding Record [Groom Mother Condition]       Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba
    Access Advanced Search
    Search Wedding Record [Groom Father Condition]       Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba
    Access Advanced Search
    Search Wedding Record [Wedding Date Condition]       Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba
    Access Advanced Search
    Search Wedding Record [Location Condition]           Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba
    Access Advanced Search
    Search Wedding Record [Officiant Condition]          Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba
    Access Advanced Search
    Search Wedding Record [Solemnizer Condition]         Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba
    Access Advanced Search
    Search Wedding Record [Contract Number Condition]    Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba
    Access Advanced Search
    Search Wedding Record [Two Or More Conditions]       Rachelle    M    Danoli    Soma    Y    Ahcac    Manali    M    Danoli    Peter    C    Danoli    Lani    Y    Ahcac    Danilo    T    Ahcac    07/08/2021    07/09/2021    Manila    Officianta    Solemnizer    5000001    00001    01/02/2022    07/09/2021    John D. Bainto    Karina T. Mamba

Search Child Dedication [Different Conditions]
    Access Advanced Search
    Search Child Dedication [All Conditions]               John    D    Bainto    7000004    Meliza    D    Bainto    Henry    B    Bainto    William    Onyx    03/30/2001    Soma Y. Ahcac    Rachelle M. Danoli    03/29/2001    03/30/2001    01/02/2022
    Access Advanced Search
    Search Child Dedication Record [No Additional Conditions]
    Check Child Dedication Search Result [No Condition]
    Access Advanced Search
    Search Child Dedication [Child Name Condition]         John    D    Bainto    7000004    Meliza    D    Bainto    Henry    B    Bainto    William    Onyx    03/30/2001    Soma Y. Ahcac    Rachelle M. Danoli    03/29/2001    03/30/2001    01/02/2022
    Access Advanced Search
    Search Child Dedication [Mother Name Condition]        John    D    Bainto    7000004    Meliza    D    Bainto    Henry    B    Bainto    William    Onyx    03/30/2001    Soma Y. Ahcac    Rachelle M. Danoli    03/29/2001    03/30/2001    01/02/2022
    Access Advanced Search
    Search Child Dedication [Father Name Condition]        John    D    Bainto    7000004    Meliza    D    Bainto    Henry    B    Bainto    William    Onyx    03/30/2001    Soma Y. Ahcac    Rachelle M. Danoli    03/29/2001    03/30/2001    01/02/2022
    Access Advanced Search
    Search Child Dedication [Dedication Date Condition]    John    D    Bainto    7000004    Meliza    D    Bainto    Henry    B    Bainto    William    Onyx    03/30/2001    Soma Y. Ahcac    Rachelle M. Danoli    03/29/2001    03/30/2001    01/02/2022
    Access Advanced Search
    Search Child Dedication [Location Condition]           John        D        Bainto       7000004        Meliza        D        Bainto        Henry        B        Bainto        William        Onyx        03/30/2001        Soma Y. Ahcac        Rachelle M. Danoli
    Access Advanced Search
    Search Child Dedication [Officiant Condition]          John    D    Bainto    7000004    Meliza    D    Bainto    Henry    B    Bainto    William    Onyx    03/30/2001    Soma Y. Ahcac    Rachelle M. Danoli    03/29/2001    03/30/2001    01/02/2022
    Access Advanced Search
    Search Child Dedication [Two Or More Conditions]       John    D    Bainto    7000004    Meliza    D    Bainto    Henry    B    Bainto    William    Onyx    03/30/2001    Soma Y. Ahcac    Rachelle M. Danoli    03/29/2001    03/30/2001    01/02/2022

Search Baptismal [Different Conditions]
    Access Advanced Search
    Search Baptismal [All Conditions]    Soma    Y    Ahcac    Off    I    Ciant    01/01/2011    01/01/2012    Manila    3000001    01/02/2022    06/06/2011
    Access Advanced Search
    Search Baptismal Record [No Additional Conditions]
    Baptismal Record Results    3000001        3000002
    Access Advanced Search
    Search Baptismal Record [Baptized First Name Condition]    Soma        Y        Ahcac        3000001        Off        I        Ciant        06/06/2011        Manila
    Access Advanced Search
    Search Baptismal Record [Baptized Middle Initial Condition]    Soma        Y        Ahcac        3000001        Off        I        Ciant        06/06/2011        Manila
    Access Advanced Search
    Search Baptismal Record [Baptized Last Name Condition]    Soma        Y        Ahcac        3000001        Off        I        Ciant        06/06/2011        Manila
    Access Advanced Search
    Search Baptismal Record [Date Of Baptism Condition]    Soma        Y        Ahcac        3000001        Off        I        Ciant        06/06/2011        Manila    06/05/2011    06/06/2011
    Access Advanced Search
    Search Baptismal Record [Baptism Location Condition]    Soma        Y        Ahcac        3000001        Off        I        Ciant        06/06/2011        Manila
    Access Advanced Search
    Search Baptismal Record [Officiant First Name Condition]    Soma        Y        Ahcac        3000001        Off        I        Ciant        06/06/2011        Manila
    Access Advanced Search
    Search Baptismal Record [Officiant Middle Initial Condition]    Soma        Y        Ahcac        3000001        Off        I        Ciant        06/06/2011        Manila
    Access Advanced Search
    Search Baptismal Record [Officiant Last Name Condition]    Soma        Y        Ahcac        3000001        Off        I        Ciant        06/06/2011        Manila
    Access Advanced Search
    Search Baptismal Record [Atleast Two Conditions]    Soma        Y        Ahcac        3000001        Off        I        Ciant        06/06/2011        Manila

Viewing Search Results
    Access Advanced Search
    Search Member [Sex Condition]                       1000005
    Access Advanced Search
    Search Prenuptial Record [Bride First Name Condition]        Jamie        P        Antonio        4000003        12/29/2021        John        D        Bainto        11/13/2024
    Access Advanced Search
    Search Wedding Record [Groom Condition]             Soma        Y        Ahcac        5000001        00001        01/02/2022        07/09/2021        Rachelle        M        Danoli
    Access Advanced Search
    Search Child Dedication [Location Condition]        John        D        Bainto       7000004        Meliza        D        Bainto        Henry        B        Bainto        William        Onyx        03/30/2001        Soma Y. Ahcac        Rachelle M. Danoli
    Access Advanced Search
    Search Baptismal Record [Baptized First Name Condition]    Soma        Y        Ahcac        3000001        Off        I        Ciant        06/06/2011        Manila
    Close Browser