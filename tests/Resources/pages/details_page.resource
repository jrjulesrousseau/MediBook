*** Settings ***
Resource   common_page.resource

*** Keywords ***
Open Details Page
    [Arguments]    ${id}
    Go To Page    ${BASE_URL}/details/${id}

Details Should Be Visible
    Element Should Be Visible    xpath=//div[@id='details-container']
