** Settings **
Library     SeleniumLibrary

** Variables **
#Dados do teste

#Variáveis de configuração
${URL1}      https://embraer.com/br/pt
${Browser}  chrome

#Elementos
${Button_Aceitar_Cookies}   //button[@data-cookiefirst-action='accept'][contains(.,'Aceitar todos')]
${Button_Menu}                  //button[contains(@class,'menu-burger')]
${Button_Avião_Comercial}      //a[contains(@data-title,'aviação comercial')]
${Button_Discover}       //span[@class='text'][contains(.,'Discover more')]
${Button_Menu1}         //button[@type='button'][contains(@id,'trigger-9274')]

** Keywords **

#Cenário 1: Login com sucesso
Dado que estou na página da Embraer
    Open Browser    ${URL1}  ${Browser}
    Sleep           1s
    Click Element   ${Button_Aceitar_Cookies}

Então vou comprar um avião
    Sleep   1s
    Click Element   ${Button_Menu}
    Sleep   1s
    Click Element   ${Button_Avião_Comercial}
    Sleep   2s
    Click Element   ${Button_Discover}
    Sleep   2s
    Click Element   ${Button_Menu1}
    Sleep   5s
 
** Test Cases **
Cenário 1: Acessar O site da Embraer
    Dado que estou na página da Embraer
    Então vou comprar um avião
