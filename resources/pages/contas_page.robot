*** Settings ***
Resource    ../main.robot

*** Variables ***
&{contas}
#Elementos página de Login
...   Dropdown_Contas=//a[@class="dropdown-toggle"]
...   Button_Adicionar=//a[@href="/addConta"]
...   Input_Nome_Conta=//input[@id="nome"]
...   Button_Salvar=//button[@class="btn btn-primary"]
...   Msg_Sucesso=//div[@class="alert alert-success"]
...   Title_Conta=//*[@id="tabelaSaldo"]/thead/tr/th[1]
...   Button_Listar=//a[@href="/contas"]
...   Segunda_Lista=//*[@id="tabelaContas"]/tbody/tr[2]/td[1]
...   Button_Editar=//*[@id="tabelaContas"]/tbody/tr[2]/td[2]/a[1]/span
...   Button_Remover=//*[@id="tabelaContas"]/tbody/tr[2]/td[2]/a[2]/span

*** Keywords ***
Dado que o usuario esta logado
    Wait Until Element Is Visible       ${contas.Title_Conta}        10
    Maximize Browser Window

Quando clicar em contas
    Wait Until Element Is Visible      ${contas.Dropdown_Contas}     10
    Click Element                      ${contas.Dropdown_Contas}  

E clicar em adicionar
    Wait Until Element Is Visible      ${contas.Button_Adicionar}     10
    Click Element                      ${contas.Button_Adicionar}  

E clicar em listar
    Wait Until Element Is Visible      ${contas.Button_Listar}        10
    Click Element                      ${contas.Button_Listar}  

E inserir o nome da conta
    Wait Until Element Is Visible      ${contas.Input_Nome_Conta}     10
    Input Text                         ${contas.Input_Nome_Conta}     Nubank

E clicar em salvar
    Wait Until Element Is Visible      ${contas.Button_Salvar}        10
    Click Element                      ${contas.Button_Salvar}  

E clicar em editar
    Wait Until Element Is Visible      ${contas.Button_Editar}        10
    Click Element                      ${contas.Button_Editar}  

E editar o nome da conta
    Wait Until Element Is Visible      ${contas.Input_Nome_Conta}     10
    Input Text                         ${contas.Input_Nome_Conta}     Inter

E clicar em remover conta
    Wait Until Element Is Visible      ${contas.Button_Remover}        10
    Click Element                      ${contas.Button_Remover}  

Entao o sistema exibe uma conta "${NomeConta}"                
    Element Text Should Be             ${contas.Segunda_Lista}        Nubank

Entao o sistema exibe o nome da conta editado ${NomeContaEditado}
    Wait Until Element Is Visible      ${contas.Segunda_Lista}        10
    Click Element                      ${contas.Segunda_Lista}  

E exibe uma mensagem "${MsgWelcome}"
    Element Text Should Be             ${contas.Msg_Sucesso}          Conta alterada com sucesso!

Entao o sistema exibe uma mensagem "${MsgSuccess}"
    Wait Until Element Is Visible    ${contas.Msg_Sucesso}        10
    ${mensagem}    Get Text          ${contas.Msg_Sucesso}
    Should Be Equal    ${mensagem}   ${MsgSuccess}
    
