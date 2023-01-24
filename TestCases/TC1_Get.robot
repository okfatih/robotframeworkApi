*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://demoqa.com
${city}         Delhi

*** Test Cases ***
Get_weatherInfo
#First create session and add base url
    create session    mysession     ${base_url}
#After get reques add relative url
     ${response}=  get request    mysession    /utilities/weather/city/${city}
    log to console    ${response.status_code}
   log to console    ${response.content}
    #log to console    ${response.headers}


    #VALIDATIONS-status code
    ${staus_code}=  convert to string    ${response.status_code}
    should be equal  ${staus_code}  200

    #VALIDATIONS-Content
    ${body}=  convert to string    ${response.content}
    should contain    ${body}    Delhi
    #VALIDATIONS-Headers
    ${connectionData}=    get from dictionary    ${response.headers}   Connection
    should be equal   ${connectionData}     keep-alive


   ${Xpower}=   get from dictionary     ${response.headers}    X-Powered-By

   should be equal    ${Xpower}   Express