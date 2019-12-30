*** Settings ***
Library  OperatingSystem
Library  String
Library  RequestsLibrary
Library  Collections
Resource  ../misc_utilities/misc_utilities.robot

*** Keywords ***
Get User Credentials
    ${test_bed_file}=   get test bed file
    ${testBed_json}=   To Json  ${test_bed_file}
    ${credentials}=     get from dictionary     ${testBed_json}     credentials
    ${username}=    get from dictionary  ${credentials}     username
    ${password}=    get from dictionary  ${credentials}     password
    [Return]  ${username}   ${password}

Get Base Url
    ${test_bed_file}=   get test bed file
    ${testBed_json}=   To Json  ${test_bed_file}
    ${base_url}=    get from dictionary  ${testBed_json}    base_url
    [Return]  ${base_url}

Get Test Bed File
    ${home_dir}=    Get Home Dir
    ${test_bed_file}=   get file  ${home_dir}//config//test_bed.json
    [Return]  ${test_bed_file}

Get Sample File
    ${home_dir}=    Get Home Dir
    ${test_bed_file}=   get file  ${home_dir}//config//sample.json
    [Return]  ${test_bed_file}