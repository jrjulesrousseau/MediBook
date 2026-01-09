*** Settings ***
Resource   common_page.resource
Resource   ../variables.resource

*** Variables ***
${LOGO}                     css:.header-logo
${LINK_LOGIN}               //a[@href="/login"]
${LINK_REGISTER}            //a[@href="/register"]
${LINK_SEARCH}              //a[@href="/search"]
${INPUT_SPECIALTY}          id=search-specialty
${INPUT_CITY}               id=search-city
${BTN_SEARCH}               css:.search-btn

*** Keywords ***
Home Page Should Be Visible
    Element Should Be Visible    ${LOGO}

Click Login Button
    Wait Until Element Is Visible    ${LINK_LOGIN}
    Click Link       ${LINK_LOGIN}

Click Register Button
    Wait Until Element Is Visible    ${LINK_REGISTER}
    Click Link                    ${LINK_REGISTER}

Navigate To Search Page
    Wait Until Element Is Visible    ${LINK_SEARCH}
    Click Link                    ${LINK_SEARCH}

Search For Practitioner
    [Arguments]    ${specialty}    ${city}
    Input Text Into Field    ${INPUT_SPECIALTY}    ${specialty}
    Input Text Into Field    ${INPUT_CITY}         ${city}
    Click Element            ${BTN_SEARCH}
