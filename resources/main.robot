*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR

#Data
Resource   data/geral.robot
Resource   data/registro.robot
Resource   data/login.robot

#Shared
Resource   shared/setup_teardown.robot

#Pages
Resource   pages/login_page.robot
Resource   pages/registro_page.robot
Resource   pages/contas_page.robot
