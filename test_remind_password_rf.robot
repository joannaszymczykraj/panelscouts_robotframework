*** Settings ***
Library  SeleniumLibrary

Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${REMIND PASSWORD BUTTON}       xpath=//a[text()='Remind password']
${REMIND URL}       https://scouts-test.futbolkolektyw.pl/en/remind
${REMIND LOGO}      xpath=//h5[contains(text(),'Remind password')]
${REMIND EMAIL INPUT}       xpath=//input[@name='email']
${SEND BUTTON}          xpath=//button[@type='submit']
${MESSAGE SENT SUCCESSFULLY}        xpath=//div[text()='Message sent successfully.']

*** Test Cases ***
Remind password
    Open login page
    Click in the remind password button
    Open remind page
    Type in remind email
    Click in the send button
    Assert Remind Page
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Click in the remind password button
    Click Element       xpath=//a[text()='Remind password']
Open remind page
    Wait Until Element Is Visible       ${REMIND LOGO}
    Title Should Be     Remind password
Type in remind email
    Input Text      ${REMIND EMAIL INPUT}       user01@getnada.com
Click in the send button
    Click Element       xpath=//button[@type='submit']
Assert remind page
    Wait Until Element Is Visible       ${MESSAGE SENT SUCCESSFULLY}
    Title Should Be     Remind password
    Capture Page Screenshot     alert.png