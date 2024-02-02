*** Settings ***
Resource    ../main.robot

*** Variables ***
&{geral}
...     URL=https://seubarriga.wcaquino.me/login
...     Browser=chrome
...     Headless=add_argument("--headless")
