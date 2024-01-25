*** Settings ***
Resource    ../resources/main.robot
Test Setup    Acesso ao organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Abrir navegador e acessar o organo
    Open Browser    url=http://localhost:3000/    browser=Firefox

Preencher os campos do formulario
    Input Text    id:form-nome    TFelipe
    Input Text    id:form-cargo    Dev
    Input Text    id:form-imagem    text link de imagem
    Click Element    class:lista-suspensa
    Click Element    //option[contains(.,'Programação')]
    Sleep    10s
    Click Element    id:form-botao
    Element Should Be Visible    class:colaborador
    Sleep    5s
