*** Settings ***
Resource    ../resources/main.robot
Test Setup    Acesso ao organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Verificando formulario de criação de cards do organo
    Clicar em criar card
    Verificar erro de preenchimento do formulario

