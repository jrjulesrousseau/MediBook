*** Keywords ***

I am on the search page
    Open Browser To Base URL
    Go To Search Page
    Search Page Should Be Visible

I select "${specialty}" in the specialty filter
    Select Specialty    ${specialty}

I enter "${city}" in the city field
    Fill City    ${city}

I click on "Search"
    Submit Search

I should see a list of practitioners
    Practitioners List Should Be Visible

each result should display name, specialty and city
    Each Practitioner Card Should Have Required Fields

I search for "${specialty}" in "${city}"
    Select Specialty    ${specialty}
    Fill City           ${city}
    Submit Search

I should see the message "Aucun praticien trouvé"
    No Practitioner Message Should Be Visible
