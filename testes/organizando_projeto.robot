*** Settings ***
Resource    ../resources/main.robot

*** Test Cases ***
Verificando formulario de criação de cards do organo
    Abrir o Organo
    Preencher campos do formulario corretamente
    Clicar em criar card
    Verificar card criado
    

*** Keywords ***
Abrir o Organo
    Open Browser    ${URL}    browser=Firefox

Preencher campos do formulario corretamente
    Input Text    ${CAMPO_NOME}    TFelipe
    Input Text    ${CAMPO_CARGO}    Dev
    Input Text    ${CAMPO_IMAGEM}    text link de imagem
    Click Element    ${CAMPO_TIME}
    Click Element    @{selecionar_times}[0]

Clicar em criar card
    Click Element    ${BOTAO_CARD}

Verificar card criado
    Element Should Be Visible    ${CARD}