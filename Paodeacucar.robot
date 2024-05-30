** Settings **
Library     SeleniumLibrary
Library     FakerLibrary    locale=pt_BR

** Variables **
${Url}      https://www.paodeacucar.com/
${Browser}  chrome
${Picanha}  Picanha Bovina Extra Limpa Pedaço Bassi a Vácuo 1,4KG
${DataNascimento}  10/10/1990

#Elementos
${Campo_Busca}                  id:input-search
${Button_Aceitar_Cookies}       //button[contains(.,'Estou ciente')]
${Button_Buscar}                //button[@target='_self'][contains(.,'BUSCAR')]
${Button_Comprar1}              (//button[@target='_self'][contains(.,'COMPRAR')])[3]
${Button_Cadastro}              (//a[@href='#'][contains(.,'Cadastre-se')])[2]
${Campo_CPF}                    //input[contains(@type,'text')]
${Button_CPF}                   //button[@target='_self'][contains(.,'Continuar')]
${Campo_Nome}                   //input[contains(@name,'fullName')]
${Campo_DataNascimento}         //input[contains(@name,'dateOfBirth')]
${Button_Continuar}             //button[@target='_self'][contains(.,'Continuar')]


** Keywords **
Dado que acesse o formulário
    Open Browser    ${Url}  ${Browser}
    Sleep           1s
    Click Element   ${Button_Aceitar_Cookies}

Então preencho os produtos no campo de busca colocando no carrinho e compras
        Sleep   1s
        Input Text      ${Campo_Busca}      ${Picanha}
        Sleep   2s
        Click Element   ${Button_Buscar}
        Sleep   2s
        Click Element   ${Button_Comprar1}
        Sleep   2s

Dado que acesse a pagina de cadastro
        ${CPF}        FakerLibrary.cpf
        ${NOME}       FakerLibrary.name
        Click Element   ${Button_Cadastro}
        Sleep   2s
        Input Text      ${Campo_CPF}       ${CPF}
        Sleep   3s
        Click Element   ${Button_CPF}
        Sleep   1s
        Input Text      ${Campo_Nome}      ${NOME}
        Sleep   2s
        Input Text      ${Campo_DataNascimento}      ${DataNascimento}
        Sleep   2s
        Click Element   ${Button_Continuar}
        Sleep   6s

** Test Cases **
TC01 - Acessar O site Pao de Acuca realiar uma compra
    Dado que acesse o formulário
    Então preencho os produtos no campo de busca colocando no carrinho e compras

TC02 - Acessar O site Pao de Acuca realiar o Cadastro
    Dado que acesse a pagina de cadastro
