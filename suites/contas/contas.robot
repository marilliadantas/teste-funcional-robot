*** Settings ***
Resource     ../../resources/main.robot
Test Setup       Acessar o site e logar
Test Teardown    Fechar navegador

*** Test Cases ***
TC01 - Criar conta com sucesso
    Dado que o usuario esta logado
    Quando clicar em contas
    E clicar em adicionar
    E inserir o nome da conta
    E clicar em salvar
    Entao o sistema exibe uma mensagem "Conta adicionada com sucesso!"

TC02 - Listar conta - Segunda da Lista
    Dado que o usuario esta logado
    Quando clicar em contas
    E clicar em listar
    Entao o sistema exibe uma conta "Nubank"

TC03 - Editar conta - Segunda da Lista
    Dado que o usuario esta logado
    Quando clicar em contas
    E clicar em listar
    E clicar em editar
    E editar o nome da conta
    E clicar em salvar
    Entao o sistema exibe o nome da conta editado "Inter"
    E exibe uma mensagem "Conta alterada com sucesso!"

TC04 - Remover conta - Segunda da Lista
    Dado que o usuario esta logado
    Quando clicar em contas
    E clicar em listar
    E clicar em remover conta
    Entao o sistema exibe uma mensagem "Conta removida com sucesso!"