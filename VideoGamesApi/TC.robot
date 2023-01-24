*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${base_url}     http://localhost:8080


*** Test Cases ***
Get_games
    create session     mysession    ${base_url}

    ${response}=    get request    mysession    app/videogames
    log to console    ${response.status_code}
    log to console    ${response.content}
   #VALIDATIONS-status code
   ${status_code}=  convert to string    ${response.status_code}
   should be equal    ${status_code}    200
  #VALIDATIONS-Content
  ${body}=    convert to string    ${response.content}
  should contain    ${body}     Universal
Post_VideoGame
    create session     mysession    ${base_url}
     ${body}=    create dictionary    id=102  name=Shelby    releaseDate=2021-01-23T20:27:51.102   reviewScore=2    category=y  rating=low
     ${header}=    create dictionary    Content-Type=application/json
     ${response}=  post request      mysession    /app/videogames    data=${body}    headers=${header}


     log to console    ${response.status_code}
     log to console    ${response.content}
    #VALIDATIONS
    ${status_code}=     convert to string    ${response.status_code}

    ${res_body}=        convert to string       ${response.content}

