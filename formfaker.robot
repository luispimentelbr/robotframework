** Settings **
Library     SeleniumLibrary
Library     FakerLibrary

** Variables **
${Url}      https://qavalidation.com/demo-form/
${Browser}  chrome

${First_Name}       //input[contains(@name,'g4072-fullname')]
${Email}            //input[@id='g4072-email']
${MobileNumber}     //input[contains(@type,'tel')]
${OtherDetails}     //textarea[contains(@name,'g4072-otherdetails')]


** Keywords **
Dado que acesse o formulário
    Open Browser    ${Url}  ${Browser}

Então o formulário deve ser preenchido
    wait Until Element Is Visible   ${First_Name}   10s
    ${Nome}    FakerLibrary.FirstName
    ${Emaill}    FakerLibrary.Email
    ${Mobile}    FakerLibrary.Phone Number
    ${Details}    FakerLibrary.Paragraph
    Input Text  ${First_Name}   ${Nome}
    Input Text  ${Email}    ${Emaill}
    Input Text  ${MobileNumber}     ${Mobile}
    Input Text  ${OtherDetails}     ${Details}     
    Sleep   10s

** Test Cases **
TC01 - Acessar e preencher formulário
    Dado que acesse o formulário
    Então o formulário deve ser preenchido
