*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/pages/common_page.resource
Resource   ../Resources/pages/home_page.resource
Resource   ../Resources/pages/connexion_page.resource
Resource   ../Resources/variables.resource
Test Teardown   Close Browser

*** Test Cases ***
Patient Can Log In
    Open Browser To Base URL
    Home Page Should Be Visible
    Click Login Button
    Login With Credentials    ${PATIENT_EMAIL}    ${PATIENT_PASSWORD}
    User Should Be Logged In
