*** Settings ***
Resource    ../main.robot

*** Keywords ***
Acesso ao organo
    Open Browser    url=http://localhost:3000/    browser=Firefox

Fechar o navegador
    Close Browser