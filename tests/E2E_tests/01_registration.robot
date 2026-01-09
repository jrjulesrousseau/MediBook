*** Settings ***
Resource    Resources/registration_steps.robot
Resource    ../Resources/pages/registration_page.resource
Resource    ../Resources/pages/common_page.resource
Resource    ../Resources/variables.resource

Test Teardown   Close Browser

*** Test Cases ***

# Test suite for patient registration

Successful Registration
    [Documentation]
        
    Given I am on the registration page
    When I enter "Test" in the "First name" field
    And I enter "Automatise" in the "Last name" field
    And I enter a unique email in the "Email" field
    And I enter "Password123!" in the "Password" field
    And I enter "Password123!" in the "Confirm password" field
    And I check "I accept the Terms and Conditions"
    And I click on "Create my account"
    Then I should see the message "Account successfully created"

Failed registration - Email already used
    [Documentation]

    Given I am on the registration page
    When I enter an existing email "adresse.test@email.com"
    And I fill the other fields correctly
    And I click on "Create my account"
    Then I should see the error message "Email already used"
