*** Settings ***
Library    XML
Library    OS
Library    Collections
Library    RequestsLibrary
*** Variables ***
${base_Url}     http://thomas-bayer.com

*** Test Cases ***
TC1
    create session    mysession     ${base_url}
    #this response contains xml data
   ${response}=  get request    mysession    /sqlrest/CUSTOMER/15

    ${xml_string}=  convert to string    ${response.content}
    ${xml_obj}=     parse xml    ${xml_string}

    log to console  ${xml_obj}
    log to console   ${xml_string}

    #Single Element Verification
    element text should be    ${xml_obj}  15  .//ID

    #Multiple Value Check and Verification
    ${child_elements}=  get child elements   ${xml_obj}
    should not be empty    ${child_elements}


  ${id}=  get element text    ${child_elements[0]}
  ${firstName}=  get element text    ${child_elements[1]}
  ${lastName}=  get element text    ${child_elements[2]}
  ${street}=  get element text    ${child_elements[3]}
  ${city}=  get element text    ${child_elements[4]}

  log to console    ${id}
  log to console    ${street}
  log to console    ${city}

  should be equal    ${street}    319 Upland Pl.

