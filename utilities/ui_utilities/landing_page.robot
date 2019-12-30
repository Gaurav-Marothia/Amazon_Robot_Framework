*** Settings ***
Library  SeleniumLibrary
Resource  ../parser_utilities/test_bed_parser.robot

*** Variables ***
${BROWSER}  chrome
${login_link}   //div[@id='nav-signin-tooltip']//span[@class='nav-action-inner'][contains(text(),'Sign in')]
${search_bar}  //input[@id='twotabsearchtextbox']
${search_button}  (//input[@type='submit'])[1]
${search_dropdown}  //select[@id='searchDropdownBox']
${enter_key}    \\13
${lap_&_acc}    //span[contains(text(),'Laptops & Accessories')]
${lap}    //div[contains(text(),'Laptops')]
${laptops}    //h3//a[contains(text(),'Laptops')]
${intel_core_i7}    s-ref-checkbox-12598163031
${display_14"}    //span[contains(text(),'13" - 14"')]
${memory_size_8}  //li[@id='p_n_feature_browse-bin/1485945031']//label
${sort_by_price}    //span[contains(text(), 'New & Popular')]
${low_to_high}    //a[@id='s-result-sort-select_1']
${lowest}    (//span[@class='a-price-whole'])[1]
${add_to_cart}    //input[@id='add-to-cart-button']
${by_now}    //input[@id='buy-now-button']
${deliver_to_add}   //a[contains(text(),'Deliver to this address')]
${add_card}  //input[@id='pp-Kqms2q-58']
${visa}  //input[@value='instrumentId=0h_PE_CUS_2b923b4b-084d-4629-bd75-09f81d422e1b&isExpired=false&paymentMethod=CC&tfxEligible=false']
${CVV}  292
${continue_to_order}    //span[@id='pp-Kqms2q-135']//input[@name='ppw-widgetEvent:SetPaymentPlanSelectContinueEvent']
${place_your_order}  //input[@name='placeYourOrder1']
${breadcrumb}    //a[@id='nav-hamburger-menu']
${comp_&_acc}    //div[contains(text(), 'Mobiles, Computers')]
${proceed_to_buy}   //span[@id='hlb-ptc-btn']//a[@id='hlb-ptc-btn-native']  #(//a[contains(text(), "Proceed to Buy (1 item)")])[1]

*** Keywords ***
User is a Guest
    ${base_url}=    Get Base Url
    open browser  about:blank   ${browser}
    maximize browser window
    set selenium implicit wait  3s
    set selenium speed  1s
    go to  ${base_url}
#    wait until page contains

User searches for a laptop
    click element  ${breadcrumb}
    click element  ${comp_&_acc}
    scroll element into view  ${lap}
    click element  ${lap}
    wait until page contains  Laptops

Selects the configuration of laptop as Intel Core i7, upto 14" display and 8/16 Gb of RAM
    scroll element into view  ${intel_core_i7}
    wait until keyword succeeds  60s  2s    select checkbox  ${intel_core_i7}
    scroll element into view  ${display_14"}
    wait until keyword succeeds  60s  2s    click element  ${display_14"}
    scroll element into view  ${memory_size_8}
    click element  ${memory_size_8}

User selects the laptop with lowest price
    click element  ${sort_by_price}
    click element  ${low_to_high}
    click element   ${lowest}

User add product to cart
    select window  NEW
    wait until element is visible  ${add_to_cart}
    click element  ${add_to_cart}

Product is present in cart
    wait until page contains  Added to Cart

User attempts to checkout
    wait until element is visible  ${proceed_to_buy}
    click element  ${proceed_to_buy}

The user is required to sign-in or sign-up
    wait until page contains  Login