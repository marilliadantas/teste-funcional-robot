*** Settings ***
Resource     ../../resources/main.robot
Test Teardown    Fechar navegador

*** Test Cases ***
TC01 - Cadastro com sucesso
    Dado que o usuario esta na tela inicial do site
    E clica no link "Novo Usuário?"
    Quando preenche o campo nome
    E preenche o campo email
    E preenche o campo senha
    E clica no botao cadastrar
    Então o sistema exibe a mensagem "Usuário inserido com sucesso"

TC02 - Cadastro com sucesso - ENTER
    Dado que o usuario esta na tela inicial do site
    E clica no link "Novo Usuário?"
    Quando preenche o campo nome
    E preenche o campo email
    E preenche o campo senha
    E pressiona ENTER no teclado
    Então o sistema exibe a mensagem "Usuário inserido com sucesso"

TC03 - Cadastro com usuário existente
    Dado que o usuario esta na tela inicial do site
    E clica no link "Novo Usuário?"
    Quando preenche o campo nome
    E preenche o campo email com email ja cadastrado
    E preenche o campo senha
    E pressiona ENTER no teclado
    Então o sistema exibe a mensagem "Endereço de email já utilizado"

TC04 - Cadastro com nome em branco
    Dado que o usuario esta na tela inicial do site
    E clica no link "Novo Usuário?"
    Quando preenche nao preenche o campo nome
    E preenche o campo email
    E preenche o campo senha
    E pressiona ENTER no teclado
    Então o sistema exibe a mensagem "Nome é um campo obrigatório"

TC05 - Cadastro com email em branco
    Dado que o usuario esta na tela inicial do site
    E clica no link "Novo Usuário?"
    Quando preenche o campo nome
    E nao preenche o campo email
    E preenche o campo senha
    E pressiona ENTER no teclado
    Então o sistema exibe a mensagem "Email é um campo obrigatório"

TC06 - Cadastro com senha em branco
    Dado que o usuario esta na tela inicial do site
    E clica no link "Novo Usuário?"
    Quando preenche o campo nome
    E preenche o campo email
    E nao preenche o campo senha
    E pressiona ENTER no teclado
    Então o sistema exibe a mensagem "Senha é um campo obrigatório"

TC07 - Cadastro com todos os campos em branco
    Dado que o usuario esta na tela inicial do site
    E clica no link "Novo Usuário?"
    Quando preenche nao preenche o campo nome
    E nao preenche o campo email
    E nao preenche o campo senha
    E pressiona ENTER no teclado
    Então o sistema exibe as mensagens  Nome é um campo obrigatório  Email é um campo obrigatório  Senha é um campo obrigatório
