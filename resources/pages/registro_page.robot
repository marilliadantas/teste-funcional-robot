*** Settings ***
Resource    ../main.robot

*** Variables ***
&{registro}
#Elementos página de Login
...   Input_Nome=//input[@id="nome"]
...   Input_Email=//input[@id="email"]
...   Input_Senha=//input[@id="senha"]
...   Button_Cadastrar=//input[@value='Cadastrar']
...   Link_Registro=//a[@href="/cadastro"]
...   Alert_Message=//div[@role="alert"]

*** Keywords ***
Dado que o usuario esta na tela inicial do site
    Open Browser  ${geral.URL}  ${geral.Browser}    options=${geral.Headless}
    Maximize Browser Window

E clica no link "Novo Usuário?"
    Click Link                      ${registro.Link_Registro}

Quando preenche o campo nome
    ${nome}       FakerLibrary.FirstName
    Input Text    ${registro.Input_Nome}      ${nome}
    
E preenche o campo email
    ${email}       FakerLibrary.FreeEmail
    Input Text    ${registro.Input_Email}     ${email}

E preenche o campo senha
    ${senha}       FakerLibrary.Password
    Input Text    ${registro.Input_Senha}     ${senha}

Quando preenche nao preenche o campo nome
    Clear Element Text             ${registro.Input_Nome}

E nao preenche o campo email
    Clear Element Text             ${registro.Input_Email}

E nao preenche o campo senha
    Clear Element Text             ${registro.Input_Senha}

E clica no botao cadastrar
    Wait Until Element Is Visible    ${registro.Button_Cadastrar}        10
    Click Element                    ${registro.Button_Cadastrar}

E pressiona ENTER no teclado
    Press Keys                       ${registro.Button_Cadastrar}  ENTER

E preenche o campo email com email ja cadastrado
    Input Text    ${registro.Input_Email}     ${dados_login.Email}
    
Então o sistema exibe a mensagem ${Text}
    Wait Until Element Is Visible    ${registro.Alert_Message}           10
    ${mensagem}    Get Text          ${registro.Alert_Message}
    Should Be Equal    ${mensagem}   ${Text}

Então o sistema exibe as mensagens
    [Arguments]    ${alerta1}    ${alerta2}    ${alerta3}
    Should Be Equal    ${alerta1}    Nome é um campo obrigatório
    Should Be Equal    ${alerta2}    Email é um campo obrigatório
    Should Be Equal    ${alerta3}    Senha é um campo obrigatório

