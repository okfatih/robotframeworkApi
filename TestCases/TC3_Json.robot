*** Settings ***
Library    JSONLibrary
Library   os
Library    Collections


*** Variables ***


*** Test Cases ***
TC1
   ${json_object}=    load json from file   C:\Users\Admin\Desktop\SeleniumPractice\jsondata
    ${name_value}=   get value from json    ${json_object}    $.firstName
   log to console   ${name_value[0]}
