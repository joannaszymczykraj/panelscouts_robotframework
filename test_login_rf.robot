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

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click In The Submit Button
    Assert dashboard
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
    Capture Page Screenshot     alert.png



