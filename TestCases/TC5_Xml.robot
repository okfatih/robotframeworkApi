*** Settings ***
Library    XML
Library    os
Library    Collections

*** Variables ***

*** Test Cases ***
TestCase1
    ${xml_obj}=   parse xml    C:/SeleniumPractice/xmldata/xmlFile.txt


    #Validations - Check single element value
    ${emp_first}=  get element text    ${xml_obj}      .//Customer[1]/Phone
     log to console     ${emp_first}


    ${emp_sec}=     get element text    ${xml_obj}      .//Customer[2]/Phone
     log to console    ${emp_sec}


    #Check number of elements in xml file
    ${numberOfCustomers}=    get element count    ${xml_obj}     .//Customer
    log to console    ${numberOfCustomers}
    should be equal as integers    ${numberOfCustomers}      4

    #Check attribute presence
    element attribute should be     ${xml_obj}      CustomerID  GREAL       .//Customer[1]
    element attribute should be    ${xml_obj}       CustomerID   HUNGC      .//Customer[2]

    #Check value of child elements
   ${child_Elements}=  get child elements    ${xml_obj}     .//Customer[1]
   should not be empty    ${child_Elements}

    #Get the text of the first element of the first child element
    ${companyName}=     get element text    ${child_Elements[0]}
    ${contactName}   get element text    ${child_Elements[1]}
    ${contactTitle}  get element text    ${child_Elements[2]}
    ${Phone}  get element text    ${child_Elements[3]}

    log to console    ${companyName}
    log to console    ${contactName}
    log to console    ${contactTitle}
    log to console    ${Phone}

    should be equal    ${contactName}   Howard Snyder
