*** Settings ***
Resource   common_page.resource
Resource   ../variables.resource

*** Variables ***
${INPUT_EMAIL}            id=email
${INPUT_PASSWORD}         id=password
${BTN_SUBMIT_LOGIN}       //button[@type="submit"]

*** Keywords ***
Go To Login Page
    Go To Page    ${URL_LOGIN}

Login With Credentials
    [Arguments]    ${email}    ${password}
    Input Text Into Field    ${INPUT_EMAIL}       ${email}
    Input Text Into Field    ${INPUT_PASSWORD}    ${password}
    Wait Until Element Is Visible       ${BTN_SUBMIT_LOGIN}
    Click Button            ${BTN_SUBMIT_LOGIN}

User Should Be Logged In
    Element Should Be Visible    css:.header-logo
