*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${base_url}      https://demoqa.com/customer


*** Test Cases ***
Customer Reg with Post Request
    create session    mysession    ${base_url}
    ${body}=    create dictionary   FirstName=Davidyb    LastName=Alleıytm    UserName=fth1234    Password=12345raj    Email=xy@gmail.com
    ${header}=    create dictionary    Content-Type=application/json
    ${response}=    post request      mysession    /register    data=${body}     headers=${header}

    log to console    ${response}
    log to console    ${response.content}
    #VALIDATIONS
    ${response_body}=   convert to string    ${response.content}