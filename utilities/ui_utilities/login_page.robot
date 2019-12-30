*** Settings ***
Library  SeleniumLibrary

Resource  ../ui_utilities/landing_page.robot
Resource  ../parser_utilities/test_bed_parser.robot

*** Variables ***
${BROWSER}  chrome
${login_submit_button}    id:signInSubmit
${continue_button}  id:continue
${title}  Hi, Gaurav

*** Keywords ***
Login To Amazon
    [Arguments]  ${uname}   ${pwd}
    ${base_url}=    Get Base Url
    ${uname}    ${passwd}=  Get User Credentials
    open browser  about:blank   ${browser}
    maximize browser window
    set selenium implicit wait  3s
    set selenium speed  1s
    go to  ${base_url}
    click element  ${login_link}
    input text  ap_email  ${uname}
    click button  ${continue_button}
    input password  ap_password   ${pwd}
    click element    ${login_submit_button}
#    wait until page contains  ${title}

Login With User Credentials
    ${user_name}    ${password}=    Get User Credentials
    Login To Amazon  ${user_name}  ${password}