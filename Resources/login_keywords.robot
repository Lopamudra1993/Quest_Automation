*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObject/Locators.py

*** Keywords ***
Open Website
    [Arguments]    ${SiteUrl}   ${Browser}
    Open Browser    ${SiteUrl}   ${Browser}
    Maximize Browser Window

Validate_loginpage
   Wait Until Page Contains Element        ${logo}  5  failed to load login page

Click_Sign_In_Button
    Wait Until Page Contains Element     ${btn_signin}
    Click Element        ${btn_signin}

Create_New_Account
    [Arguments]    ${User_First_Name}  ${User_Last_Name}  ${email}  ${password}  ${Birth}
    Wait Until Page Contains Element       ${create_account}
    Click Element    ${create_account}
    Wait Until Page Contains Element    ${first_name}
    Input Text   ${first_name}   ${User_First_Name}
    Input Text    ${last_name}   ${User_Last_Name}
    Input Text    ${accnt_email}   ${email}
    Input Text    ${accnt_password}  ${password}
    Wait Until Page Contains Element    ${Birth_Year}
    Click Element    ${Birth_Year}
    Input Text    ${Birth_Year}   1991
    ${Present}      Run Keyword And Return Status    Element Should Be Visible    ${Birth_Day}
    Run Keyword If     ${Present}==True     Select From List By Value    ${Birth_Month}  2
    Run Keyword If     ${Present}==True     Input Text    ${Birth_Day}   ${Birth}
    Run Keyword If     ${Present}==True     Input Text    ${Birth_Year}   1991

Click_Continue_Button
    Click Element    ${confirm_btn}
    Capture Page Screenshot

Validate_Secure_Page
    Wait Until Page Contains Element    ${secure_page}  5  failed to go secure page

close browsers
    Close All Browsers
