** Settings **
Library     SeleniumLibrary
Library     DebugLibrary
Library     Collections
Library     ScreenCapLibrary
Library     DateTime


** Variables **
#Dados do teste
${CEP_teste}    52011260

#Variáveis de configuração
${URL}      https://www.boticario.com.br/
${Browser}  chrome

#Elementos
${Button_Aceitar_Cookies}   //button[@id='onetrust-accept-btn-handler']
${Button_CEP1}  (//a[contains(.,'Informar CEP')])[1]
${Button_CEP2}  (//div[contains(.,'Digitar um CEP')])[25]
${Input_CEP}    (//input[@type='text'])[3]
${Button_CEP3}  (//button[@type='submit'][contains(.,'OK')])[3]
${Button_Lancamento}  //img[contains(@alt,'Lançamentos')]
${Button_Produto}  (//a[@href='https://www.boticario.com.br/zaad-venture-eau-de-parfum-95ml/'])[2]
${Button_Comprar}   //a[@data-cy='buy-button'][contains(.,'Comprar')]

** Keywords **

Dado que eu acesso o site boticario
        ${now} =    Get Current Date    result_format=%Y-%m-%d_%H-%M-%S
    # Nome do arquivo com base na data e hora
    ${nome_arquivo} =    Set Variable    screenshot_${now}.webm

    Open Browser    ${URL}  ${Browser}
 #   Maximize Browser Window
 #   Start Video Recording      name=${nome_arquivo}
       Sleep   2s

Quando clico no botão CEP
        Click Element   ${Button_Aceitar_Cookies}
        Click Element   ${Button_CEP1} 
        Click Element   ${Button_CEP2} 
        Input Text  ${Input_CEP}   ${CEP_teste}  
        Click Element   ${Button_CEP3}

E clico no botao lancamentos
        Click Element   ${Button_Lancamento}
        Click Element   ${Button_Produto}

Então o comprar é executado
        Click Element   ${Button_Comprar}
        Close Browser

** Test Cases **
Cenário 1: Executar compra no site boticario
    Dado que eu acesso o site boticario
    Quando clico no botão CEP
    E clico no botao Lancamentos
    Então o comprar é executado
