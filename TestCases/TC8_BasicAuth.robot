*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${base_url}     http://restapi.demoqa.com

*** Test Cases ***
Basic Authentication Test
    ${auth}     create list    ToolsQA      TestPassword
    create session    mysession     ${base_url}    auth=${auth}
    ${response}=    get request    mysession    /authentication/CheckForAuthentication/
    log to console    ${response.content}
    log to console    ${response.status_code}
