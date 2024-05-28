*** Settings ***
Library     SeleniumLibrary
Library     DebugLibrary
Library     Collections
Library     FakerLibrary    locale=pt_BR

*** Variables ***
# Dados do teste
#${Nascimento}    10/10/1980
${CPF}          479.915.840-62
${EMAIL}        luis@exemplo.com
${NOME}         Carlos Silva
${Nascimento}   10/10/1990
${Celular}      (81) 99202-2000

# Variáveis de configuração
${URL}               https://seminovos.localiza.com/
${Browser}           chrome
${URL1}              https://seminovos.localiza.com/detalhes-carro/fiat-mobi-like-10-4p-95420/financiamento

# Elementos
${Click_Cidade}            //input[contains(@placeholder,'Inclua sua cidade')]
${Click_Cidade1}           //p[@class='p-custom ng-star-inserted'][contains(.,'RECIFE - PE')]
${Click_Preco}             //input[contains(@placeholder,'Preço')]
${Click_Preco1}            //p[@class='p-custom ng-star-inserted'][contains(.,'Até R$60.000')]
${Botao_Pesquisar}         //button[@class='pesquisar'][contains(.,'Pesquisar')]
${Button_Aceitar_Cookies}  //a[@aria-label='allow cookies'][contains(.,'Permitir Cookies')]
${Click_Produto}           (//div[contains(@class,'container-main ng-star-inserted')])[3]
${Campo_CPF}               //input[contains(@id,'cpf')]
${Campo_Nome}               //input[contains(@id,'name')]
${Campo_Email}              //input[contains(@id,'email')]
${Campo_Nascimento}         //input[contains(@id,'dateBirth')]
${Campo_Celular}            //input[contains(@minlength,'11')]
${Botao_Dados}              id:sharedData
${Button_Finalizar}         id:submit
${Botao_EnviarProposta}      //button[@class='calcRight_button'][contains(.,'Enviar proposta')]

*** Keywords ***
Dado que eu acesso o site da Localiza
    Open Browser    ${URL}  ${Browser}
    Sleep           2s

Quando preencho os dados da Pesquisa
    Wait Until Element Is Visible    ${Click_Cidade}    4s
    Click Element                    ${Click_Cidade}
    Sleep                            1s
    Wait Until Element Is Visible    ${Click_Cidade1}    4s
    Click Element                    ${Click_Cidade1}
    Sleep                            2s    
    Wait Until Element Is Visible    ${Click_Preco}    4s
    Click Element                    ${Click_Preco} 
    Sleep                            1s
    Wait Until Element Is Visible    ${Click_Preco1}    4s
    Click Element                    ${Click_Preco1} 
    Sleep                            2s
    Wait Until Element Is Visible    ${Botao_Pesquisar}    4s
    Click Element                    ${Botao_Pesquisar}
    Sleep                            1s
    Wait Until Element Is Visible    ${Button_Aceitar_Cookies}    4s
    Click Element                    ${Button_Aceitar_Cookies}   
    Sleep                            3s

E clico em Produto
    Wait Until Element Is Visible    ${Click_Produto}    4s
    Click Element                    ${Click_Produto}
    Sleep                            4s
    Close Browser

Dado que eu preencho os dados
    Open Browser    ${URL1}  ${Browser}
    Sleep                            3s

Quando preencho os dados no simulador
        Sleep   2s
        Input Text   ${Campo_CPF}    ${CPF}
        Input Text   ${Campo_Nome}   ${NOME}
        Input Text   ${Campo_Email}  ${EMAIL} 
        Input Text   ${Campo_Nascimento}  ${Nascimento} 
        Input Text   ${Campo_Celular}     ${Celular} 
        Sleep   4s
        Click Element                    ${Button_Aceitar_Cookies} 
        Click Element      ${Botao_Dados}
        Sleep   2s

Entao finalizo o simulador
        Sleep   2s
        Click Element      ${Button_Finalizar} 
        Sleep   12s
        Click Element      ${Botao_EnviarProposta}
        Sleep   2s
        Close Browser

*** Test Cases ***
Cenário 1: Executar compra no site Localiza
    Dado que eu acesso o site da Localiza
    Quando preencho os dados da Pesquisa
    E clico em Produto

Cenário 2: Preencher os dados no simulador
    Dado que eu preencho os dados
    Quando preencho os dados no simulador
    Entao finalizo o simulador
