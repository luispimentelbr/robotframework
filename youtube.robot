** Settings **
Library     SeleniumLibrary

** Variables **
#Dados do teste
${NomeDaMusica}      YG Marley - "Praise Jah in the Moonlight" 

#Variáveis de configuração
${URL}      https://www.youtube.com/
${Browser}  chrome

#Elementos
${Input_Pesquisa}   //input[contains(@autocapitalize,'none')]
${Button_Pesquisa}  //button[@class='style-scope ytd-searchbox'][contains(.,'Pesquisa')]
${Segunda}          //yt-formatted-string[@class='style-scope ytd-video-renderer'][contains(.,'YG Marley - "Praise Jah in the Moonlight"')]
${Button_Prova}     (//div[contains(@class,'fill')])[17]

** Keywords **
Dado que eu acesso o site do youtube
    Open Browser    ${URL}  ${Browser}
       Sleep   5s
Quando digito o nome da musica
    Input Text  ${Input_Pesquisa}   ${NomeDaMusica}
       Sleep   5s
E clico no botao buscar
    Click Element   ${Button_Pesquisa}
       Sleep   5s
E clico na segunda opção da lista
    Wait Until Element Is Visible   ${Segunda}  8
    Click Element   ${Segunda}
       Sleep   5s
Então o video é executado
#    Wait Until Element Is Visible   ${Button_Prova}  8
#    Element Should Be Visible  ${Button_Prova}
    Sleep   5s
    Close Browser

** Test Cases **
Cenário 1: Executar video no site do youtube
    Dado que eu acesso o site do youtube
    Quando digito o nome da musica
    E clico no botao buscar
    E clico na segunda opção da lista
    Então o video é executado
