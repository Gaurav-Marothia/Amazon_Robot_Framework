*** Settings ***
Library  SeleniumLibrary

Resource  ../../utilities/ui_utilities/landing_page.robot
Resource  ../../utilities/ui_utilities/login_page.robot

Suite Setup  Run Keywords    Login With User Credentials
Suite Teardown  Close All Browsers

*** Test Cases ***
Place Order For Laptop As Logged In User
    [Tags]  Smoke   Regression  Sanity
    [Setup]  log to console  Place Order for Laptop as Logged In User Started...
    select from list by label  ${search_dropdown}  Computers & Accessories
    press key  id=twotabsearchtextbox  ${enter_key}
    wait until page contains  Computers & Accessories
    mouse over  ${lap_&_acc}
    wait until keyword succeeds  60s  2s  click element  ${laptops}
    wait until page contains  Laptops
    scroll element into view  ${intel_core_i7}
    wait until keyword succeeds  60s  2s    select checkbox  ${intel_core_i7}
    scroll element into view  ${display_14"}
    wait until keyword succeeds  60s  2s    click element  ${display_14"}
    scroll element into view  ${memory_size_8}
    click element  ${memory_size_8}
    click element  ${sort_by_price}
    click element  ${low_to_high}

    ${Available_Prices}=    Get Element Count    xpath://span[@class="a-price-whole"]
    Log To Console    ${Available_Prices}

    @{LinkItems}    create list
    :FOR    ${i}    IN RANGE    1    ${Available_Prices}+1
    \   ${Amount_Text}=    Get Text    xpath:(//span[@class="a-price-whole"])[${i}]
    \   log to console  ${Amount_Text}
    \   ${result}=   split string   ${Amount_Text}  ,
    \   ${convertlisttostring}=  evaluate  "".join(${result})
    \   log to console  ${convertlisttostring}

    click element  ${lowest}
    select window  NEW
    wait until element is visible  ${add_to_cart}
    click element  ${add_to_cart}
    wait until page contains  Added to Cart
    wait until element is visible  ${proceed_to_buy}
    click element  ${proceed_to_buy}
    wait until page contains  Select a delivery address