*** Settings ***
Resource    common_page.resource
Resource    ../../Resources/variables.resource

Library    String

*** Variables ***
${ON_PAGE}                  xpath=//h1[text()='Créer un compte']
${INPUT_FIRSTNAME}          id=firstName
${INPUT_LASTNAME}           id=lastName
${INPUT_EMAIL}              id=email
${INPUT_PASSWORD}           id=password
${INPUT_CONFIRM_PASSWORD}   id=confirmPassword
${CHECKBOX_CGU}             xpath=//input[@type="checkbox"]
${BTN_SUBMIT_REGISTER}      xpath=//button[@type="submit"]
${MSG_SUCCESS}              Spécialités les plus recherchées
${MSG_EMAIL_USED}           Un compte existe déjà avec cet email
${USER_NAME_VERIF}          css:.user-name

*** Keywords ***

Go To Registration Page
    Go To Page    ${URL_REGISTER}

Registration Page Should Be Visible
    Element Should Be Visible    ${ON_PAGE}

Generate Unique Email
    ${rand}=    Generate Random String    8    [LETTERS][NUMBERS]
    ${email}=   Set Variable    test.auto+${rand}@email.com
    RETURN    ${email}

Fill First Name
    [Arguments]    ${value}
    Input Text Into Field    ${INPUT_FIRSTNAME}    ${value}

Fill Last Name
    [Arguments]    ${value}
    Input Text Into Field    ${INPUT_LASTNAME}    ${value}

Fill Email
    [Arguments]    ${value}
    Input Text Into Field    ${INPUT_EMAIL}    ${value}

Fill Password
    [Arguments]    ${value}
    Input Text Into Field    ${INPUT_PASSWORD}    ${value}

Fill Confirm Password
    [Arguments]    ${value}
    Input Text Into Field    ${INPUT_CONFIRM_PASSWORD}    ${value}

Accept Terms And Conditions
    Scroll Element Into View    ${CHECKBOX_CGU}
    Select Checkbox    ${CHECKBOX_CGU}

Submit Registration
    Scroll Element Into View    ${BTN_SUBMIT_REGISTER}
    Click Button    ${BTN_SUBMIT_REGISTER}

Registration Should Be Successful
    Wait Until Page Contains     ${MSG_SUCCESS}

Registration Should Fail Email Already Used
    Wait Until Page Contains    ${MSG_EMAIL_USED}