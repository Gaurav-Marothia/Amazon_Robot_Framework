*** Settings ***
Library  BuiltIn

*** Keywords ***
Get Home Dir
    ${home_dir}=    set variable  ${CURDIR}/../..
    [Return]  ${home_dir}