*** Settings ***
Library  SeleniumLibrary

Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//span[@class='MuiButton-label']
${MESSAGE PLEASE PROVIDE}       xpath=//span[text()='Please provide your username or your e-mail.']

*** Test Cases ***
Lack of login or password
    Open login page
    Click in the submit button
    Assert lack of login or password
    [Teardown]    Close Browser


*** Keywords ***
Open login page
    Open Browser        ${LOGINURL}     ${BROWSER}
    Title Should Be     Scouts panel - sign in
Click in the submit button
    Click Element       xpath=//span[@class='MuiButton-label']
Assert lack of login or password
    Wait Until Element Is Visible       ${MESSAGE PLEASE PROVIDE}
    Title Should Be     Scouts panel - sign in
    Capture Page Screenshot     alert.png
