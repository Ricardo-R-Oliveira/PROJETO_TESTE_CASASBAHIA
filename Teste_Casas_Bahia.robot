*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}  https://www.pontofrio.com.br/
${CAMPO_PESQUISA}  id:search-form-input
${ITEM_PESQUISADO}  celular
${LUPA_PESQUISA}  xpath=//button[@aria-label="Clique para pesquisar"]
${SELECIONAR_ITEM}  id:product-card-72825399
${ADICIONA_ITEM_CARRINHO}  xpath=//button[contains(@class, 'vtex-button__label') and contains(text(), 'Adicionar ao carrinho')]
${VERIFICA_ITEM_CARRINHO}  id:item-quantity-55064353,16,537579413

*** Test Cases ***
Pesquisar e Adicionar Item ao Carrinho
    Abrir Navegador
    Pesquisar Por Item
    Selecionar Item
    Adicionar Item ao Carrinho
    Verifica Item no Carrinho
    Fechar Navegador


*** Keywords ***
Abrir Navegador
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    

Pesquisar Por Item
    Input Text  locator=${CAMPO_PESQUISA}  text=${ITEM_PESQUISADO}
        Click Element    ${LUPA_PESQUISA}


Selecionar Item
    Click Element    locator=${SELECIONAR_ITEM}
  
    
Adicionar Item ao Carrinho
    Click Button  locator=${ADICIONA_ITEM_CARRINHO}
       

Verifica Item no Carrinho

    Element Should Be Visible    locator=${VERIFICA_ITEM_CARRINHO}


Fechar Navegador
    Close Browser
