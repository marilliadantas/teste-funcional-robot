*** Settings ***
Resource    ../main.robot

*** Keywords ***
Acessar o site e logar 
    Dado que o usuario esta na tela de login
    Quando o usuario insere email valido
    E o usuario insere senha valida
    E clica em "Entrar"
    # E realize o cadastro 
    # E faça o Login

Acessar site
    Open Browser  ${geral.URL}  ${geral.Browser}  options=${geral.Headless}

Fechar navegador
    Close Browser

Screenshot
    [Arguments]        ${name_print}
    Set Screenshot Directory    ./screenshots/suites
    Capture Page Screenshot   ${name_print}