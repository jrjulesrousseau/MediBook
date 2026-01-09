*** Settings ***
Resource    common_page.resource
Resource    search_page.resource

*** Variables ***
${AVAILABLE_DATE}         xpath=(//span[@class="slot-count"]/..)[1]
${SLOT_OPTION}            xpath=(//button[@class="slot-btn "])[1]
${BTN_CONFIRM}            xpath=//button[contains(.,"Confirmer le rendez-vous")]
${MSG_CONFIRMED}          xpath=//div[contains(text(),"Rendez-vous confirmé !")]
${APPOINTMENT_VERIF}      xpath=//ul[@class="appointments-list"]//h2[contains(.,"Dr. Claire Martin")]
${BTN_CANCEL}             xpath=(//button[contains(.,"Annuler")])[1]

*** Keywords ***

Appointment Teardown
    Go To Appointment Page
    Cancel Appointment
    Close Browser

Go To Appointment Page
    [Arguments]
    Go To Page    ${BASE_URL}/appointments

Practitioner Page Should Be Visible
    Element Should Be Visible    ${BTN_CONFIRM}

Select First Available Date
    Scroll Element Into View    ${AVAILABLE_DATE}
    Click Button    ${AVAILABLE_DATE}

Select First Available Slot
    Scroll Element Into View    ${SLOT_OPTION}
    Click Button    ${SLOT_OPTION}

Confirm Appointment
    Scroll Element Into View    ${BTN_CONFIRM}
    Click Button    ${BTN_CONFIRM}

Appointment Should Be Confirmed
    Wait Until Page Contains Element    ${MSG_CONFIRMED}

Go To Appointments Page
    Go To Page    ${URL_APPOINTMENTS}

Appointment Should Be Listed
    Element Should Be Visible    ${APPOINTMENT_VERIF}

Cancel Appointment
    ${status}=  Run Keyword And Return Status    Scroll Element Into View    ${BTN_CANCEL}
    IF    ${status}
        Click Button    ${BTN_CANCEL}
    END
    