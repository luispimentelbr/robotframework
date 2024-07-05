*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://demo.automationtesting.in/Register.html
${BROWSER}    chrome
${FIRST_NAME}    John
${LAST_NAME}    Doe
${EMAIL}    johndoe@example.com
${PHONE}    1234567890

*** Test Cases ***
Fill Form And Submit
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    //input[contains(@placeholder,'First Name')]    ${FIRST_NAME}
    Input Text    //input[contains(@placeholder,'Last Name')]    ${LAST_NAME}
    Input Text    //input[contains(@type,'email')]    ${EMAIL}
    Input Text    //input[contains(@type,'tel')]    ${PHONE}
    Click Element    //input[@value='Male']
    Sleep    5s
    Click Button    id:submitbtn
    Sleep    5s
    Close Browser
