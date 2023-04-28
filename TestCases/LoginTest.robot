*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Resources/login_keywords.robot
Suite Teardown  Close Browsers
Suite Setup      Open Website  ${SiteUrl}   ${Browser}

*** Variables ***
${Browser}  chrome
${SiteUrl}  https://finance.yahoo.com/
${User_First_Name}  Lopa
${User_Last_Name}  Das
${email}  lopadas
${password}  password@1234@
${Birth}  1994

*** Test Cases ***
Create_Yahoo_Account
    [Documentation]    creating a new account in YAHOO
    [Tags]    YahooFinance
    ${Random}  Generate Random String  5  [NUMBERS]
    Validate_loginpage
    Click_Sign_In_Button
    Create_New_Account  ${User_First_Name}  ${User_Last_Name}  ${email}${Random}  ${password}  ${Birth}
    Click_Continue_Button
    Validate_Secure_Page


