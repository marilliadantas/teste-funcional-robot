*** Settings ***
Library    SeleniumLibrary

#Data
Resource   data/geral.robot
Resource   data/registro.robot
Resource   data/login.robot

#Shared
Resource   shared/setup_teardown.robot

#Pages
Resource   pages/login_page.robot
Resource   pages/registro_page.robot
