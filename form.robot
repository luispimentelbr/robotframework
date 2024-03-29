** Settings **
Library     SeleniumLibrary

** Variables **
${input_name}        //input[contains(@placeholder,'First Name')]
${input_name1}       //input[contains(@placeholder,'Last Name')]
${input_email}       //input[contains(@id,'userEmail')]
${select_gender}     //label[@for='gender-radio-1'][contains(.,'Male')]
${input_phone}       //input[contains(@pattern,'\d*')]
${button_submit}     //button[contains(@id,'submit')]

** Keywords **
Abrir navegador e acessar o Site
    Open Browser    https://demoqa.com/automation-practice-form  chrome

preencher campos
    Sleep   5s
    Input Text      ${input_name}   Luis
    Input Text      ${input_name1}  Lacerda   
    Input Text      ${input_email}  luis@gmail.com
    Click Element   ${select_gender}
    Input Text      ${input_phone}  0992012441

clicar em submit
    Click Element   ${button_submit}

fechar navegador
    Close Browser


** Test Cases **
Cenário 1: Preencher formulario
    abrir navegador e acessar o Site
    preencher campos
 #   clicar em submit
    fechar navegador
