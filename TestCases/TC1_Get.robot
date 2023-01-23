*** Settings ***
Library    RequestsLibrary





*** Variables ***
${base_ur}     https://demoqa.com
${city}         Delhi

*** Test Cases ***
Get_weatherInfo
#First create session and add base url
    create session    mysession     ${base_ur}
#After get reques add relative url
     ${response}=  GET On Session    mysession    /utilities/weather/city/${city}
    log to console    ${response.status_code}
   # log to console    ${response.content}
    #log to console    ${response.headers}


    #VALIDATIONS-status code
    ${staus_code}=  convert to string    ${response.status_code}
    should be equal  ${staus_code}  200

    #VALIDATIONS-Content
    ${body}=    ${response.content}
