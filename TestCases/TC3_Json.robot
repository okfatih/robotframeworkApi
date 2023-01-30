*** Settings ***
Library    JSONLibrary
Library   os
Library    Collections


*** Variables ***


*** Test Cases ***
TC1
   ${json_object}=    load json from file   C:/SeleniumPractice/jsondata.json
    ${name_value}=   get value from json    ${json_object}    $.firstName
   log to console   ${name_value[0]}
    should be equal    ${name_value[0]}    John

    ${street_address}=   get value from json    ${json_object}    $.address.streetAddress
   log to console   ${street_address}
    should be equal    ${street_address[0]}     21 2nd Street

    ${fax_number}=    get value from json    ${json_object}     $.phoneNumber[1].number
    log to console    ${fax_number}
    should be equal     ${fax_number[0]}        646 555-4567

