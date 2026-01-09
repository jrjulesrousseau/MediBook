*** Settings ***
Resource    Resources/search_steps.robot
Resource    ../Resources/pages/search_page.resource
Resource    ../Resources/pages/common_page.resource
Resource    ../Resources/variables.resource

Test Teardown    Close Browser

*** Test Cases ***

Search by specialty and city
    Given I am on the search page
    When I select "Médecin généraliste" in the specialty filter
    And I enter "Paris" in the city field
    And I click on "Search"
    Then I should see a list of practitioners
    And each result should display name, specialty and city

Search with no results
    Given I am on the search page
    When I search for "Cardiologue" in "Village Inexistant"
    Then I should see the message "Aucun praticien trouvé"
