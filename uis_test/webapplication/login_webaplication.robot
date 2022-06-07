*** Settings ***
Resource    ../../resources/webapplication/init.resource
Force Tags    webapplication    loginfuntion    sprint_001

*** Variables ***
${URL}    https://www.tutorialspoint.com/
${BROWSER}    chrome
*** Test Cases ***
TC1
   [Tags]  test01
   Open Browser    ${URL}    ${BROWSER}
   Maximize Browser Window
   Close Browser
