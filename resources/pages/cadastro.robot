*** Settings ***
Resource    ../main.robot

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{selecionar_times}
...          //option[contains(.,'Programação')]
...          //option[contains(.,'Front-End')]
...          //option[contains(.,'Data Science')]
...          //option[contains(.,'Devops')] 
...          //option[contains(.,'UX e Design')]
...          //option[contains(.,'Mobile')]
...          //option[contains(.,'Inovação e Gestão')]
${CARD}                   class:colaborador
${ERRO_NOME}              id:form-nome-erro
${ERRO_CARGO}             id:form-cargo-erro
${ERRO_TIME}              id:form-times-erro

*** Keywords ***
Preencher campos do formulario corretamente
    ${Nome}              FakerLibrary.First Name
    Input Text           ${CAMPO_NOME}    ${Nome}
    ${Cargo}             FakerLibrary.Job
    Input Text           ${CAMPO_CARGO}    ${Cargo}
    ${Imagem}            FakerLibrary.Image Url
    Input Text           ${CAMPO_IMAGEM}    ${Imagem} width=100 height=100
    Click Element        ${CAMPO_TIME}
    Click Element        ${selecionar_times}[0]
Clicar em criar card
    Click Element    ${BOTAO_CARD}

Verificar card criado
    Element Should Be Visible    ${CARD}

Verificar 3 cards criados no time esperado
    FOR    ${i}    IN RANGE    1    3
        Preencher campos do formulario corretamente
        Clicar em criar card
        
    END
    Sleep    10
Verificar erro de preenchimento do formulario
    Element Should Be Visible    ${ERRO_NOME}
    Element Should Be Visible    ${ERRO_CARGO}
    Element Should Be Visible    ${ERRO_TIME}

Criar e identificar 1 card em cada time
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
        Preencher campos do formulario corretamente
        Click Element    ${time}
        Clicar em criar card
        
    END
