*** Settings ***
Resource    ../main.robot

*** Variables ***
&{login}
#Elementos página de Login
...   Input_EmailLogin=//input[@id="email"] 
...   Input_SenhaLogin=//input[@id="senha"]
...   Button_Logar=//button[@class="btn btn-primary"]
...   Link_Registro=//a[@href="/cadastro"]
...   Msg_Welcome=//div[@class="alert alert-success"]
...   Msg_Erro=//div[@class="alert alert-danger"]

*** Keywords ***
Dado que o usuario esta na tela de login
    Open Browser  ${geral.URL}  ${geral.Browser}  options=${geral.Headless}
    Maximize Browser Window

Quando o usuario insere email valido
    Wait Until Element Is Visible  ${login.Input_EmailLogin}  10
    Input Text                     ${login.Input_EmailLogin}  ${dados_login.Email}

E o usuario insere senha valida
    Wait Until Element Is Visible  ${login.Input_SenhaLogin}  10
    Input Text                     ${login.Input_SenhaLogin}  ${dados_login.Senha}

E clica em "Entrar"
    Wait Until Element Is Visible  ${login.Button_Logar}      10
    Click Element                  ${login.Button_Logar} 

Entao o sistema redireciona para a página inicial exibindo a mensagem "${MsgWelcome}"
    Element Text Should Be    ${login.Msg_Welcome}    Bem vindo, Kylian!
    Location Should Be        https://seubarriga.wcaquino.me/logar

Quando o usuario insere email invalido
    Wait Until Element Is Visible  ${login.Input_EmailLogin}  10
    Input Text                     ${login.Input_EmailLogin}  ${dados_login.EmailInvalido}

E o usuario insere senha invalida
    Wait Until Element Is Visible  ${login.Input_SenhaLogin}  10
    Input Text                     ${login.Input_SenhaLogin}  ${dados_login.SenhaInvalida}

Quando o usuario nao preenche o campo email
    Wait Until Element Is Visible  ${login.Input_EmailLogin}  10
    Clear Element Text             ${login.Input_EmailLogin}  

E o usuario nao preenche o campo senha
    Wait Until Element Is Visible  ${login.Input_SenhaLogin}  10
    Clear Element Text             ${login.Input_SenhaLogin}  

Entao o sistema exibe a mensagem ${Text}
    Wait Until Element Is Visible    ${login.Msg_Erro}        10
    ${mensagem}    Get Text          ${login.Msg_Erro}
    Should Be Equal    ${mensagem}   ${Text}

Entao o sistema exibe as mensagens
    [Arguments]    ${alerta1}    ${alerta2}
    Should Be Equal    ${alerta1}    Email é um campo obrigatório
    Should Be Equal    ${alerta2}    Senha é um campo obrigatório