*** Settings ***
Library  SeleniumLibrary

Documentation    Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//input[@id='password']
${SIGNINBUTTON}     xpath=//span[@class='MuiButton-label']
${PAGELOGO}     xpath=//div[@title='Logo Scouts Panel']
${SIGNOUTBUTTON}        xpath=//span[text()='Sign out']
${DASHBOARDURL}     https://scouts-test.futbolkolektyw.pl/en
${SIGN OUT URL}     https://scouts-test.futbolkolektyw.pl/en/login

*** Test Cases ***
Sign out the system
    Open login page
    Type in email
    Type in password
    Click In The Submit Button
    Assert dashboard
    Open dashboard page
    Click In The Sign Out Button
    [Teardown]    Close Browser


*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be         Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}       user01@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}        Test-1234
Click in the Submit button
    Click Element       xpath=//span[@class='MuiButton-label']
Assert dashboard
    Wait Until Keyword Succeeds    1 min    1 sec   Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be     Scouts panel
Open dashboard page
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be         Scouts panel
Click in the Sign Out button
    Click Element       xpath=//span[text()='Sign out']
Assert sign out
    Open Browser        ${SIGN OUT URL}     ${BROWSER}
    Title Should Be     Scouts panel - sign in
    Capture Page Screenshot     alert.png
