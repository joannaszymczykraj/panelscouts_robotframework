*** Settings ***
Library  SeleniumLibrary

Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://dareit.futbolkolektyw.pl/en
${BROWSER}          Chrome
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//input[@id='password']
${SIGNINBUTTON}         xpath=//span[@class='MuiButton-label']
${PAGELOGO}         xpath=//div[@title='Logo Scouts Panel']
${ADD PLAYER BUTTON}        xpath=//span[text()='Add player']
${CLEAR BUTTON}        xpath=//span[text()='Clear']
${NAME INPUT}       xpath=//input[@name='name']
${SURNAME INPUT}        xpath=//input[@name='surname']
${AGE INPUT}        xpath=//input[@name='age']
${MAIN POSITION INPUT}      xpath=//input[@name='mainPosition']
${SUBMIT BUTTON}        xpath=//button[contains(@class,'containedPrimary') and @type='submit']
${NEW PLAYER NAME HEADER}        xpath=//span[text()='Edit player Joanna Testowa']

*** Test Cases ***
Add player
    Open login page
    Type in email
    Type in password
    Click in the submit button
    Open dashboard
    Click in the add player button
    Open Add Player Page
    Type in name
    Type in surmane
    Type in age
    Type in main position
    Click in the submit button on add player page
    Assert Add Player
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}       user01@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}        Test-1234
Click in the submit button
    Click Element       xpath=//span[@class='MuiButton-label']
Open dashboard
    Wait Until Keyword Succeeds    1 min    1 sec   Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be     Scouts panel
Click in the add player button
    Click Element       xpath=//span[text()='Add player']
Open add player page
    Wait Until Element Is Visible       ${CLEAR BUTTON}
    Title Should Be         Add player
Type in name
    Input Text      ${NAME INPUT}       Joanna
Type in surmane
    Input Text      ${SURNAME INPUT}    Testowa
Type in age
    Input Text      ${AGE INPUT}        01.01.2000
Type in main position
    Input Text      ${MAIN POSITION INPUT}      Goalkeeper
Click in the submit button on add player page
    Click Element       xpath=//button[contains(@class,'containedPrimary') and @type='submit']
Assert add player
    Wait Until Element Is Visible       ${NEW PLAYER NAME HEADER}
    Title Should Be     Edit player Joanna Testowa
    Capture Page Screenshot     alert.png
