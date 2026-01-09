*** Keywords ***

I am logged in as a patient
    Open Browser To Base URL
    Go To Login Page
    Login With Credentials    ${PATIENT_EMAIL}    ${PATIENT_PASSWORD}
    User Should Be Logged In

I am on Dr. Claire Martin's page
    Go To Search Page
    Select Practitioner    Dr. Claire Martin

I select an available date
    Select First Available Date

I select a time slot
    Select First Available Slot

I click on "Confirm appointment"
    Confirm Appointment

I should see the message "Rendez-vous confirmé"
    Appointment Should Be Confirmed

the appointment should appear in "My appointments"
    Go To Appointments Page
    Appointment Should Be Listed
