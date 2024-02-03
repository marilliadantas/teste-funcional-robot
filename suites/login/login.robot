*** Settings ***
Documentation           Suite de Login
Resource     ../../resources/main.robot
Test Teardown    Fechar navegador

*** Test Cases ***
TC01 - Login com sucesso
    Dado que o usuario esta na tela de login
    Quando o usuario insere email valido
    E o usuario insere senha valida
    E clica em "Entrar"
    Entao o sistema redireciona para a página inicial exibindo a mensagem "Bem vindo, Kylian!"

TC02 - Login com email inválido
    Dado que o usuario esta na tela de login
    Quando o usuario insere email invalido
    E o usuario insere senha valida
    E clica em "Entrar"
    Entao o sistema exibe a mensagem "Problemas com o login do usuário"

TC03 - Login com senha inválida
    Dado que o usuario esta na tela de login
    Quando o usuario insere email valido
    E o usuario insere senha invalida
    E clica em "Entrar"
    Entao o sistema exibe a mensagem "Problemas com o login do usuário"

TC04 - Login com email em branco
    Dado que o usuario esta na tela de login
    Quando o usuario nao preenche o campo email
    E o usuario insere senha invalida
    E clica em "Entrar"
    Entao o sistema exibe a mensagem "Email é um campo obrigatório"

TC05 - Login com senha em branco
    Dado que o usuario esta na tela de login
    Quando o usuario insere email valido
    E o usuario nao preenche o campo senha
    E clica em "Entrar"
    Entao o sistema exibe a mensagem "Senha é um campo obrigatório"

TC06 - Login com todos os campos em branco
    Dado que o usuario esta na tela de login
    Quando o usuario nao preenche o campo email
    E o usuario nao preenche o campo senha
    E clica em "Entrar"
    Entao o sistema exibe as mensagens  Email é um campo obrigatório  Senha é um campo obrigatório