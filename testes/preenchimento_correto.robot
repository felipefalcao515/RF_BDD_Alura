*** Settings ***
Resource    ../resources/main.robot
Test Setup           Acesso ao organo
Test Teardown        Fechar o navegador

*** Test Cases ***
Verificando formulario de criação de cards do organo
    Preencher campos do formulario corretamente
    Clicar em criar card
    Verificar 3 cards criados no time esperado

Verificar criação de cards em cada time
    Preencher campos do formulario corretamente
    Criar e identificar 1 card em cada time
