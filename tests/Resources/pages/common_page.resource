*** Settings ***
Library    SeleniumLibrary
Resource   ../variables.resource

*** Variables ***

${BUTTON_RECHERCHER}     xpath=//span[text()="Rechercher"]
${BUTTON_ACCUEIL}        xpath=//span[text()="Accueil"]

*** Keywords ***
Open Browser To Base URL
    Open Browser    ${BASE_URL}    chrome

    Maximize Browser Window


Go To Page
    [Arguments]    ${url}
    Go To    ${url}

Click Element
    [Arguments]    ${locator}
    Click Element    ${locator}

Input Text Into Field
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

Element Should Be Visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
