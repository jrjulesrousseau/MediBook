*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../variables.resource

*** Variables ***

${BUTTON_RECHERCHER}     xpath=//span[text()="Rechercher"]
${BUTTON_ACCUEIL}        xpath=//span[text()="Accueil"]

*** Keywords ***

Create Chrome Options
    ${chrome_options}=    Evaluate    __import__("selenium.webdriver").webdriver.ChromeOptions()    selenium.webdriver
    Run Keyword If    '${HEADLESS}'=='true'    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    RETURN    ${chrome_options}
    

Open Browser To Base URL
    ${remote}=    Get Environment Variable    REMOTE_URL    ${EMPTY}
    ${options}=   Create Chrome Options
 
    IF    '${remote}' != ''
        Open Browser    ${BASE_URL}    chrome    remote_url=${remote}    options=${options}
    ELSE
        Open Browser    ${BASE_URL}    chrome    options=${options}
    END
 
    Set Selenium Timeout    ${TIMEOUT}
    Maximize Browser Window
    Go To Path    /
    Reset Browser State

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
