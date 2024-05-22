** Settings **
Library     SeleniumLibrary
Library     DebugLibrary
Library     Collections
Library     ScreenCapLibrary
Library     DateTime


** Variables **
#Dados do teste
${NomeDaPesquisa}      Jogo Battletoads - Mega Drive
${email}    luis@gmail.com


#Variáveis de configuração
${URL}      https://www.meugameusado.com.br/
${Browser}  chrome

#Elementos
${Input_Pesquisa}   (//input[contains(@type,'text')])[2]
${Button_Pesquisa}  (//button[@aria-label='Buscar'])[2]
${Button_jogo}            //a[contains(@title,'Jogo Battletoads - Mega Drive')]
${Button_Compra}     (//a[contains(.,'Comprar')])[1]
${Button_Finalizar}  //a[contains(@class,'botao principal ir-carrinho hidden-phone')]
${Input_Email}   //input[@type='text'][contains(@id,'login')]
${Button_Finalizar2}     //a[contains(@class,'submit-email botao principal grande')]

** Keywords **

Dado que eu acesso o site do games
    ${now} =    Get Current Date    result_format=%Y-%m-%d_%H-%M-%S
    # Nome do arquivo com base na data e hora
    ${nome_arquivo} =    Set Variable    screenshot_${now}.webm

    Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Start Video Recording      name=${nome_arquivo}
       Sleep   5s

Quando digito o nome da pesquisa
    Input Text  ${Input_Pesquisa}   ${NomeDaPesquisa}
       Sleep   5s
     Stop Video Recording 
      
E clico no botao pesquisar
    Click Element   ${Button_Pesquisa}
       Sleep   4s
E clico em comprar
    Wait Until Element Is Visible   ${Button_jogo}  8
    Click Element   ${Button_jogo}
       Sleep   5s
Então o compra é executado
#    Wait Until Element Is Visible   ${Button_Prova}  8
   Click Element   ${Button_Compra}
    Sleep   5s
   Click Element   ${Button_Finalizar}
    Sleep   5s
     Input Text  ${Input_Email}   ${email}   
    Sleep   5s
    Click Element   ${Button_Finalizar2}
     Sleep   5s   
    Close Browser

** Test Cases **
Cenário 1: Executar compra no site do games
    Dado que eu acesso o site do games
    Quando digito o nome da pesquisa
    E clico no botao pesquisar
    E clico em comprar
    Então o compra é executado
