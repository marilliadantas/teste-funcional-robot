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
    Open Browser  ${geral.URL}  ${geral.Browser}
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

Entao o sistema redireciona para a página inicial exibindo a mensagem ${Texto}
    Element Text Should Be    ${login.Msg_Welcome}    Bem vindo, Kylian!

Quando o usuario insere email invalido
    Wait Until Element Is Visible  ${login.Input_EmailLogin}  10
    Input Text                     ${login.Input_EmailLogin}  ${dados_login.EmailInvalido}

E o usuario insere senha invalida
    Wait Until Element Is Visible  ${login.Input_SenhaLogin}  10
    Input Text                     ${login.Input_SenhaLogin}  ${dados_login.SenhaInvalida}

Entao o sistema deve exibir a mensagem "Problemas com o login do usuário"
    Element Text Should Be    ${login.Msg_Erro}    Problemas com o login do usuário

Quando o usuario nao preenche o campo email
    Wait Until Element Is Visible  ${login.Input_EmailLogin}  10
    Clear Element Text             ${login.Input_EmailLogin}  

Entao o sistema deve exibir a mensagem "Email é um campo obrigatório"
    Element Text Should Be    ${login.Msg_Erro}    Email é um campo obrigatório

E o usuario nao preenche o campo senha
    Wait Until Element Is Visible  ${login.Input_SenhaLogin}  10
    Clear Element Text             ${login.Input_SenhaLogin}  

Entao o sistema deve exibir a mensagem "Senha é um campo obrigatório"
    Element Text Should Be    ${login.Msg_Erro}    Senha é um campo obrigatório

Entao o sistema deve exibir a mensagem "Email é um campo obrigatório", "Senha é um campo obrigatório"
    Element Text Should Be    ${login.Msg_Erro}    "Email é um campo obrigatório", "Senha é um campo obrigatório