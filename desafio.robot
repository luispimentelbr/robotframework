*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           String
Suite Setup       Setup Suite
Suite Teardown    Teardown Suite
Test Setup        Setup Test
Test Teardown     Teardown Test

*** Variables ***
${URL}            http://the-internet.herokuapp.com/challenging_dom

*** Test Cases ***
Verificar carregamento da página
    Abrir Página    ${URL}
    Verificar Título    The Internet

Verificar cabeçalho da página
    Abrir Página    ${URL}
    Verificar Cabeçalho    Challenging DOM

Contar links de edição
    Abrir Página    ${URL}
    Contar Links    //a[text()='edit']    10

Verificar links de edição não vazios
    Abrir Página    ${URL}
    Verificar Links Não Vazios    //a[text()='edit']

Contar links de deleção
    Abrir Página    ${URL}
    Contar Links    //a[text()='delete']    10

Verificar links de deleção não vazios
    Abrir Página    ${URL}
    Verificar Links Não Vazios    //a[text()='delete']

Verificar mudança de valor após atualização
    Abrir Página    ${URL}
    Verificar Mudança de Valor Após Atualização

Verificar botão azul
    Abrir Página    ${URL}
    Verificar Mudança de ID ao Clicar    //a[@class='button']

Verificar botão vermelho
    Abrir Página    ${URL}
    Verificar Mudança de ID ao Clicar    //a[@class='button alert']

Verificar botão verde
    Abrir Página    ${URL}
    Verificar Mudança de ID ao Clicar    //a[@class='button success']

*** Keywords ***
Setup Suite
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Teardown Suite
    Close Browser

Setup Test
    Log    Iniciando teste...

Teardown Test
    Log    Teste finalizado.

Abrir Página
    [Arguments]    ${url}
    Go To    ${url}
    Wait Until Page Contains Element    xpath://div[@class='example']    10s
    Log    Página carregada: ${url}

Verificar Título
    [Arguments]    ${title}
    Title Should Be    ${title}
    Log    Título da página verificado: ${title}

Verificar Cabeçalho
    [Arguments]    ${header}
    ${header_text}=    Get Text    xpath://div[@class='example']/h3
    Should Be Equal As Strings    ${header_text}    ${header}
    Log    Cabeçalho da página verificado: ${header}

Contar Links
    [Arguments]    ${xpath}    ${expected_count}
    ${elements}=    Get WebElements    ${xpath}
    ${count}=    Get Length    ${elements}
    Should Be Equal As Numbers    ${count}    ${expected_count}
    Log    Número de links verificado: ${count}

Verificar Links Não Vazios
    [Arguments]    ${xpath}
    ${elements}=    Get WebElements    ${xpath}
    FOR    ${element}    IN    @{elements}
        ${href}=    Get Element Attribute    ${element}    href
        Should Not Be Empty    ${href}
        Log    Link verificado com href: ${href}
    END

Verificar Mudança de Valor Após Atualização
    ${script_inner_html}=    Get Element Attribute    xpath://div[@id='content']/script    innerHTML
    ${old_number}=    Get Value From Script InnerHTML    ${script_inner_html}
    Log    Número antigo: ${old_number}
    Reload Page
    ${script_inner_html}=    Get Element Attribute    xpath://div[@id='content']/script    innerHTML
    ${new_number}=    Get Value From Script InnerHTML    ${script_inner_html}
    Log    Número novo: ${new_number}
    Should Not Be Equal As Strings    ${old_number}    ${new_number}
    Log    Valor da resposta mudou após atualização: ${old_number} para ${new_number}

Verificar Mudança de ID ao Clicar
    [Arguments]    ${xpath}
    ${button}=    Get WebElement    ${xpath}
    ${old_id}=    Get Element Attribute    ${button}    id
    Click Element    ${button}
    ${button}=    Get WebElement    ${xpath}
    ${new_id}=    Get Element Attribute    ${button}    id
    Should Not Be Equal As Strings    ${old_id}    ${new_id}
    Log    ID do botão mudou após clique: ${old_id} para ${new_id}

*** Keywords ***
Get Value From Script InnerHTML
    [Arguments]    ${script_inner_html}
    ${numbers}=    Evaluate    re.findall('[0-9]+', '''${script_inner_html}''')    re
    ${number_list}=    Create List
    FOR    ${number}    IN    @{numbers}
        ${is_valid}=    Evaluate    len('''${number}''') == 5
        IF    ${is_valid}
            Append To List    ${number_list}    ${number}
        END
    END
    [Return]    ${number_list[0]}
