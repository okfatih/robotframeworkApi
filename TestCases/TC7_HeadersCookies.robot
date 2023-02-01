*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    http://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders
    create session    mysession   ${base_url}
    ${response}=    get request    mysession    /photos
    log to console    ${response.status_code}
    log to console    ${response.headers}
    #${response.headers}    is a dictionary variable as it contains multiple key and values
    #Lets capture specific header

    ${ContentTypeValue}=    get from dictionary    ${response.headers}      Content-Type
     log to console    ${ContentTypeValue}

    should be equal    ${ContentTypeValue}       application/json; charset=utf-8


    ${ContentEncoding}=     get from dictionary    ${response.headers}    Content-Encoding
    log to console    ${ContentEncoding}
    should be equal             ${ContentEncoding}        gzip
Test Cookies
    create session    mysession   ${base_url}
    ${response}=    get request    mysession    /photos

    log to console    ${response.cookies}
    should be empty    ${response.cookies}
