*** Settings ***
Resource    common_page.resource

*** Variables ***
${SELECT_SPECIALTY}      id=specialty
${INPUT_CITY}            id=city
${SEARCH_VERIF}          Filtres
${RESULT_CARD}           xpath=//a[@class="practitioner-card"]
${NO_RESULT_MSG}         Aucun praticien trouvé avec ces critères.
${BTN_SEARCH}            xpath=//button[@type="submit"]

*** Keywords ***

Go To Search Page
    Go To Page    ${URL_SEARCH}

Search Page Should Be Visible
    Wait Until Page Contains    ${SEARCH_VERIF}

Select Specialty
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${SELECT_SPECIALTY}
    Select From List By Label    ${SELECT_SPECIALTY}    ${value}

Fill City
    [Arguments]    ${value}
    Input Text Into Field    ${INPUT_CITY}    ${value}

Submit Search
    Click Button    ${BTN_SEARCH}

Practitioners List Should Be Visible
    Element Should Be Visible    ${RESULT_CARD}

Each Practitioner Card Should Have Required Fields
    ${cards}=    Get WebElements    ${RESULT_CARD}
    FOR    ${card}    IN    @{cards}
        Element Should Contain    ${card}    Médecin
        Element Should Contain    ${card}    Paris
    END

No Practitioner Message Should Be Visible
    Page Should Contain    ${NO_RESULT_MSG}

Select Practitioner
    [Arguments]    ${name}

    Wait Until Element Is Visible    //a[contains(., "${name}")]
    Click Link    //a[contains(., "${name}")]
    Wait Until Page Contains    Prendre rendez-vous
