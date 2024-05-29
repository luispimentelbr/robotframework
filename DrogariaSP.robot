*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary    locale=pt_BR

*** Variables ***
# Dados do teste
#${LocalRetirada1}    Agencia Aeroporto Recife

# Variáveis de configuração
${URL}               https://www.drogariasaopaulo.com.br
${Browser}           chrome
${Quantidade}        50
${cep}               25882970
${name1}             Testando
${Fone}              219922022555
${Endereco}              Testando
${Numero}               87
${Complemento}       Testando
${Bairro}       Testando
${Cidade}       Testando

# Elementos
${Button_Aceitar_Cookies}    //div[@title='Aceitar']
${Dorflex}                   //a[contains(.,'Dorflex Max')]
${Campo_Quantidade}           //input[contains(@aria-label,'Quantidade de Produto')]
${Comprar}                    (//a[contains(.,'Comprar')])[1]
${Carrinho}                   //a[contains(@class,'nav-link rnk-comp-header-dropdown-trigger-carrinho')]
${Campo_cep}                  //input[contains(@class,'form-control rnk-form-calcule-o-frete rnk-checkout-cep')]
${Button_cep}                  //button[contains(@class,'btn btn-secondary rnk-btn-calcule-o-frete')]
${Finalizar_Compra}             //a[contains(@class,'btn btn-lg btn-primary btn-fechar-pedido')]
${Button_Cadastro}            //button[contains(.,'Ir para os Dados Pessoais')]
${Campo_email}                  //input[contains(@class,'rnk-checkout-profile-email form-control is-invalid')]
${Button_DadosPessoais}       //button[contains(.,'Ir para os Dados Pessoais')]
${Campo_Name}                 //input[contains(@class,'rnk-checkout-profile-firstName form-control')]
${Campo_SobreName}            //input[contains(@class,'rnk-checkout-profile-lastName form-control')]
${Campo_CPF}                 //input[contains(@class,'rnk-checkout-profile-document rnk-checkout-cpf form-control')]
${Campo_Fone}                 //input[contains(@class,'rnk-checkout-profile-phone rnk-checkout-phone form-control')]
${Button_IrEndereço}         //button[@type='submit'][contains(.,'Ir para o Endereço')]
${Button_PesquisarCep}          //button[@class='btn btn-primary'][contains(.,'Pesquisar')]
${Campo_Endereco}               //input[contains(@class,'rnk-checkout-address-street form-control')]
${Campo_Numero}              //input[contains(@class,'rnk-checkout-address-number form-control')]
${Campo_Complemento}            //input[contains(@class,'rnk-checkout-address-complement form-control')]
${Campo_Bairro}                 //input[contains(@class,'rnk-checkout-address-neighborhood form-control')]
${Campo_Cidade}                 //input[contains(@class,'rnk-checkout-address-city form-control')]
${Button_Estado}                //select[contains(@class,'rnk-checkout-address-state form-control')]
${Estado}                       //option[@value='AM'][contains(.,'AM')]
${Button_Entrega}                //button[@type='submit'][contains(.,'Ir para a Entrega')]
${Button_Finalizar}              //button[@type='button'][contains(.,'Finalizar Compra')]

*** Keywords ***
Dado que eu acesso o site da DrogariaSP
    Open Browser    ${URL}  ${Browser}
 #   Maximize Browser Window
    Sleep           2s
    Click Element   ${Button_Aceitar_Cookies}

E clico no botão do Produto
        Sleep   4s
        Click Element   ${Dorflex}
        Sleep   2s
        Input Text      ${Campo_Quantidade}      ${Quantidade}
        Sleep   4s
        Click Element   ${Comprar}
        Sleep   2s
        Click Element   ${Carrinho}

Quando finalizo a compra
        Sleep   2s
        Input Text      ${Campo_cep}      ${cep}
        Sleep   2s
        Click Element   ${Button_cep}
        Sleep   2s
        Click Element   ${Finalizar_Compra}
        Sleep   2s

E vou pra tela de cadastro
       ${email}         FakerLibrary.email
       ${name}          FakerLibrary.name
       ${CPF}           FakerLibrary.cpf
        Sleep   2s
        Click Element   ${Button_Cadastro}
        Sleep   2s
        Input Text      ${Campo_email}      ${email}
        Sleep   2s
        Click Element   ${Button_DadosPessoais}
        Sleep   2s
        Input Text      ${Campo_Name}       ${name}
        Sleep   1s
        Input Text      ${Campo_SobreName}       ${Numero}
        Sleep   1s
        Input Text      ${Campo_CPF}       ${CPF}
        Sleep   1s
        Input Text      ${Campo_Fone}       ${Fone}
        Sleep   1s
        Click Element   ${Button_IrEndereço} 
        Sleep   2s

E preencho o Endereço
        Sleep   2s   
        Click Element   ${Button_PesquisarCep}
        Sleep   2s
        Input Text      ${Campo_Endereco}       ${Endereco}
        Sleep   1s
        Input Text      ${Campo_Numero}      ${Numero}
        Sleep   1s
        Input Text      ${Campo_Complemento}       ${Complemento}
        Sleep   1s
        Input Text      ${Campo_Bairro}       ${Bairro}
        Sleep   1s
        Input Text      ${Campo_Cidade}       ${Cidade}
        Sleep   1s
        Click Element   ${Button_Estado}
        Sleep   1s
        Click Element   ${Estado}
        Sleep   1s
        Click Element   ${Button_Entrega}
        Sleep   1s
        
Então finalizo a entrega
        Sleep   2s    
        Click Element   ${Button_Finalizar}
        Sleep   1s

*** Test Cases ***
Cenário 1: Executar compra no site DrogariaSP
    Dado que eu acesso o site da DrogariaSP
    E clico no botão do Produto
    Quando finalizo a compra
    E vou pra tela de cadastro
    E preencho o Endereço
    Então finalizo a entrega
