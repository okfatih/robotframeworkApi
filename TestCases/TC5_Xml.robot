*** Settings ***
Library    XML
Library    OS
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
