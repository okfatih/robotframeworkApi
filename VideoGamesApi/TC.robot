*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${base_url}     http://localhost:8080


*** Test Cases ***
TC1:Returns all the video games(GET)
#We get all the games from database
    create session     mysession    ${base_url}

    ${response}=    get request    mysession    app/videogames
    log to console    ${response.status_code}
#    log to console    ${response.content}
   #VALIDATIONS-status code
   ${status_code}=  convert to string    ${response.status_code}
   should be equal    ${status_code}    200
  #VALIDATIONS-Content
  ${body}=    convert to string    ${response.content}
  should contain    ${body}     Universal
TC2:Add a new video game(POST)
#We create a new game
    create session     mysession    ${base_url}
     ${body}=    create dictionary    id=107  name=AgeOfEmpires7   releaseDate=2021-02-23T20:27:51.102   reviewScore=11
     ${header}=    create dictionary    Content-Type=application/json
     ${response}=  post request      mysession    /app/videogames    data=${body}    headers=${header}


     log to console    ${response.status_code}
     log to console    ${response.content}

    #VALIDATIONS
    ${status_code}=     convert to string    ${response.status_code}

    ${res_body}=        convert to string       ${response.content}
    should contain      ${res_body}        Record Added Successfully
TC3 Get the new video game created above
#We get the new game that we have created
    create session     mysession    ${base_url}
   ${response}=  get request    mysession        app/videogames/107


    log to console    ${response.status_code}
  # log to console    ${response.content}
     #VALIDATIONS-status code
    ${status_code}=  convert to string    ${response.status_code}
    should be equal    ${status_code}    200
    #VALIDATIONS-Content
    ${body}=    convert to string    ${response.content}
    should contain    ${body}   AgeOfEmpires7

TC4 Update the game that we have created
    create session    mysession    ${base_url}
    ${body}=    create dictionary    id=107  name=Soldiers11   releaseDate=2021-02-23T20:27:51.102   reviewScore=11
    ${header}=    create dictionary    Content-Type=application/json
    ${response}=    put request    mysession    /app/videogames/107    data=${body}    headers=${header}

    log to console    ${response.status_code}
    log to console     ${response.content}


    #VALIDATIONS
    ${status_code}=    convert to string    ${response.status_code}
    should be equal     ${status_code}      200
     ${res_body}=        convert to string       ${response.content}
  should contain    ${res_body}          Soldiers11
    log to console    ${response.content}
TC5: Delete a video game by ID
    create session    mysession    ${base_url}
     ${response}=   delete request    mysession     app/videogames/107

     ${status_code}=    convert to string    ${response.status_code}
    should be equal     ${status_code}      200
    ${res_body}=        convert to string       ${response.content}
    should contain      ${res_body}        Record Deleted Successfully
