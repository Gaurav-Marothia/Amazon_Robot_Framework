*** Settings ***
Library  SeleniumLibrary
Resource  ../../utilities/ui_utilities/landing_page.robot

Suite Setup  Log To Console    Suite Execution Started.....Place Order for Laptop as aa Guest User Started...
Suite Teardown  Log To Console    Suite Execution Completed.....Place Order for Laptop as aa Guest User Started...
Test Teardown  Close All Browsers

*** Test Cases ***
Place Order For Laptop As Guest User
    [Tags]  Smoke   Regression  Sanity
    [Setup]  log to console  Place Order for Laptop as Guest User Started...
    Given User is a Guest
    And User searches for a laptop
    And Selects the configuration of laptop as Intel Core i7, upto 14" display and 8/16 Gb of RAM
    And User selects the laptop with lowest price
    And User add product to cart
    And Product is present in cart
    When User attempts to checkout
    Then The user is required to sign-in or sign-up