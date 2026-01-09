*** Settings ***
Resource    Resources/appointment_steps.robot
Resource    ../Resources/pages/appointment_page.resource
Resource    ../Resources/pages/connexion_page.resource
Resource    ../Resources/pages/common_page.resource
Resource    ../Resources/variables.resource

Test Teardown    Appointment Teardown

*** Test Cases ***

Book an appointment
    Given I am logged in as a patient
    And I am on Dr. Claire Martin's page
    When I select an available date
    And I select a time slot
    And I click on "Confirm appointment"
    Then I should see the message "Rendez-vous confirmé"
    And the appointment should appear in "My appointments"
