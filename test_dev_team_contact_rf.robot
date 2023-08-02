*** Settings ***
Library  SeleniumLibrary

Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGINURL}     https://dareit.futbolkolektyw.pl/en
${BROWSER}      Chrome
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//input[@id='password']
${PAGELOGO}         xpath=//div[@title='Logo Scouts Panel']
${SIGNINBUTTON}     xpath=//span[@class='MuiButton-label']
${DEVTEAMBUTTON}        //span[text()='Dev team contact']
${LOGIN CONTACT URL}        https://app.slack.com/workspace-signin


*** Test Cases ***
Dev team contact
    Open login page
    Type in email
    Type in password
    Click in the Submit button
    Open dashboard
    Click in the dev team contact button
    Assert Dev Team Contact
    [Teardown]      Close Browser

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}         ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}       user01@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}        Test-1234
Click in the Submit button
    Click Element       xpath=//span[@class='MuiButton-label']
Open dashboard
    Wait Until Keyword Succeeds    1 min    1 sec   Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be     Scouts panel
Click in the dev team contact button
    Click Element       xpath=//span[text()='Dev team contact']
Assert dev team contact
    Open Browser        ${LOGIN CONTACT URL}        ${BROWSER}
    Title Should Be     Find your workspace | Slack
    Capture Page Screenshot     alert.png