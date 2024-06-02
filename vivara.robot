** Settings **
Library     SeleniumLibrary
Library     FakerLibrary    locale=pt_BR

** Variables **
${Url}      https://www.vivara.com.br/
${Browser}  chrome
${Quantidade}  10
${Telefone}  21990255550
${CEP1}                17512-842
${Numero}  87

#Elementos
${Button_Aceitar_Cookies}               //button[contains(.,'CONCORDAR E FECHAR')]
${Button_FecharCEP}                     //button[contains(@class,'close-icon-modal')]
${Button_Joias}                         //a[@class='menu-item bold joias'][contains(.,'Joias')]
${Button_VerTodos}                      //button[@data-custom-button='true'][contains(.,'Ver todos')]
${Button_Produto}                            //div[@class='shelf-product-card-listing__content'][contains(.,'Anel Vivara em Ouro Amarelo 18k com DiamantesSale Price:R$ 3.950,0010x sem juros de R$ 395,00')]     
#//div[@class='shelf-product-card-listing__content'][contains(.,'Pingente Medalhas N.Sra. Aparecida em Ouro Amarelo 18k com Safiras Azul e DiamantesSale Price:R$ 1.650,0010x sem juros de R$ 165,00')]
${Campo_Quantidade}                     //input[contains(@aria-label,'Quantity')]
${Button_Sacola}                        //button[@class='button']  
${Button_Sacola2}                       //button[@data-button-variant='primary']
${Button_Finalizar_Compra}              (//a[@href='#/orderform'][contains(.,'Fechar pedido')])[1]
${Campo_Email}                           //input[@placeholder='seu@email.com']
${Button_Continuar}                      //button[@class='btn btn-success'][contains(.,'Continuar')]
${Campo_Nome1}                           //input[contains(@autocomplete,'given-name')]
${Campo_Nome2}                           //input[contains(@autocomplete,'last-name')]
${Campo_RG}                              //input[contains(@minlength,'4')]
${Campo_CPF}                             //input[contains(@placeholder,'999.999.999-99')]
${Campo_Telefone}                        //input[contains(@placeholder,'11 99999-9999')]
${Idade}                                 //input[contains(@id,'declare-over-12-years-old')]
${IrParaEntrega}                         //button[@type='submit'][contains(.,'Ir para a Entrega')]
${Campo_CEP}                             //input[contains(@class,'input-small error')]
${Campo_Numero}                          //input[contains(@name,'number')]
${Button_Pagamento}                      //button[contains(.,'Ir para o pagamento')]
${Button_Finalizar_Compra1}              //button[@class='submit btn btn-success btn-large btn-block'][contains(.,'Finalizar compra')]

** Keywords **
Dado que acesse o site Vivara
    Open Browser    ${Url}  ${Browser}
    Maximize Browser Window
    Sleep        1s
Então irei as compras
    Sleep        1s
    Click Element   ${Button_FecharCEP}
    Sleep        2s
    Wait Until Element Is Visible       ${Button_Aceitar_Cookies}   2s
    Click Element   ${Button_Aceitar_Cookies}
    Sleep        3s
    Wait Until Element Is Visible       ${Button_Joias}     3s
    Click Element   ${Button_Joias}
    Sleep        2s
    Click Element   ${Button_VerTodos}
    Sleep        4s
    Click Element   ${Button_Produto}
    Sleep        4s
    Input Text      ${Campo_Quantidade}      ${Quantidade}
    Sleep        1s
    Click Element   ${Button_Sacola}
    Sleep        2s
    Click Element   ${Button_Sacola2}
    Sleep        4s
    Click Element   ${Button_Finalizar_Compra}
    Sleep        3s

E vou para o cadastro
    ${EMAIL}         FakerLibrary.email
    ${nome1}         FakerLibrary.First Name 
    ${nome2}         FakerLibrary.Last Name
    ${RG}            FakerLibrary.rg
    ${CPF}           FakerLibrary.cpf
    Sleep        2s
    Input Text  ${Campo_Email}     ${EMAIL} 
    Sleep        2s
    Click Element   ${Button_Continuar}
    Sleep        3s
    Input Text  ${Campo_Nome1}     ${nome1} 
    Sleep        1s
    Input Text  ${Campo_Nome2}     ${nome2} 
    Sleep        1s
    Input Text  ${Campo_RG}     ${RG}
    Sleep        1s
    Input Text  ${Campo_CPF}    ${CPF} 
    Sleep        1s
    Input Text  ${Campo_Telefone}   ${Telefone}
    Sleep        1s
    Click Element   ${Idade}
    Sleep        1s
    Click Element   ${IrParaEntrega}
    Sleep        3s

E vou cadastrar o endereço
    Sleep        2s
    Input Text   ${Campo_CEP}   ${CEP1} 
    Sleep        4s
    Input Text   ${Campo_Numero}    ${Numero}
    Sleep        1s
    Click Element   ${Button_Pagamento}
    Sleep        4s

Então finalizo a compra
    Sleep        1s
    Click Element   ${Button_Finalizar_Compra1}
    Sleep        8s

** Test Cases **
TC01 - Acessar O site Vivara e realiar uma compra
    Dado que acesse o site Vivara
    Então irei as compras
    E vou para o cadastro
    E vou cadastrar o endereço
    Então finalizo a compra
