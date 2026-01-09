*** Keywords ***

I am on the registration page
    Open Browser To Base URL
    Go To Registration Page
    Registration Page Should Be Visible

I enter a unique email in the "Email" field
    ${email}=    Generate Unique Email
    Fill Email    ${email}

I enter "${First_name}" in the "First name" field
    Fill First Name    ${First_name}

I enter "${last_name}" in the "Last name" field
    Fill Last Name    ${last_name}

I enter "${email}" in the "Email" field
    Fill Email    ${emaiil}

I enter "${pwd}" in the "Password" field
    Fill Password    ${pwd}

I enter "${cnf_pwd}" in the "Confirm password" field
    Fill Confirm Password    ${cnf_pwd}

I check "I accept the Terms and Conditions"
    Accept Terms And Conditions

I click on "Create my account"
    Submit Registration

I should see the message "Account successfully created"
    Registration Should Be Successful

I enter an existing email "${email}"
    Fill Email    ${email}

I fill the other fields correctly
    Fill First Name    Test
    Fill Last Name     User
    Fill Password      Password123#
    Fill Confirm Password    Password123#
    Accept Terms And Conditions

I should see the error message "Email already used"
    Registration Should Fail Email Already Used
