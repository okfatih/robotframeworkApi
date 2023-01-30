*** Settings ***
Library    JSONLibrary
Library   os
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}    https://restful-booker.herokuapp.com/

*** Test Cases ***
Get country info
    create session    mysession     ${base_url}
    ${response}=    get request    mysession    /booking/2276
     log to console    ${response.status_code}
    log to console    ${response.content}
    ${json_object}=        to json     ${response.content}

    #Single data validation
    ${name}=    get value from json   ${json_object}  $.firstname
    log to console    ${name[0]}
    should be equal    ${name[0]}      John




