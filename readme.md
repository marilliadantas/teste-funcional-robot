# Projeto - Automação de Testes com Robot Framework

- Este projeto visa automatizar testes no site Sr. Barriga utilizando Robot Framework.
O Sr. Barriga é uma aplicação web fictícia utilizada para práticas de automação de testes.

## Ferramentas utilizadas:
- [Robot Framework](https://robotframework.org/robotframework/ "Robot Framework")
- [Selenium](https://www.seleniumhq.org/ "Selenium")
- [Cucumber](https://cucumber.io/ "Cucumber")

## Bibliotecas utilizadas:
- [Selenium Library](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html "Selenium Library")
- [Faker Library](https://pypi.org/project/robotframework-faker/ "Faker Library")

## Pré-Requisito
- Tenha uma IDE instalada (Vs code, por exemplo)
- [Baixe o python](https://www.python.org/downloads/ "Python") e Instale (caso não tenha em sua máquina)

## Instalando o Robot Framework
Você pode instalar as bibliotecas Python necessárias executando o seguinte comando no terminal ou prompt de comando:

        pip install robotframework

## Instalando a biblioteca do Selenium
        pip install robotframework-seleniumlibrary
        
## Instalando a biblioteca Faker no Robot Framework
        pip install robotframework-faker

## Arquitetura:
```
.
├── readme.md
└── resources
    ├── data
    │   ├── geral.robot
    │   ├── login.robot
    │   └── registro.robot
    ├── pages
    │   ├── login_page.robot
    │   └── registro_page.robot
    ├── shared
    │   └── setup_teardown.robot
    └── main.robot
└── suites
    ├── login
    │   └── login.robot
    └── registro
        └── registro.robot
```