*** Settings ***
Resource    ../main.robot

*** Keywords ***
# Acessar o site e logar 
#     Dado que eu acesse o php travels
#     E realize o cadastro 
#     E faça o Login

Acessar site
    Open Browser  ${geral.URL}  ${geral.Browser}  options=${geral.Headless}

Fechar navegador
    Close Browser

Screenshot
    [Arguments]        ${name_print}
    Set Screenshot Directory    ./screenshots/suites
    Capture Page Screenshot   ${name_print}