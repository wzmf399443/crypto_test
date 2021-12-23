*** Settings ***
Documentation     Verify cro xtz page in markets page
Resource    ../init.robot

Force Tags    web    market    cro
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Test Setup    Test Setup
Test Timeout    ${TIMEOUT}

*** Variables ***

*** Test Cases ***
Check the text and the elements is expected in symbol info
    [Template]    Check The Element And The Text Is Expected
    ${TRADE_SPOT_TOGGLE_TEXT}    XTZ/CRO

*** Keywords ***
Suite Setup
    Open Default Browser

Suite Teardown
    Close All Browsers

Test Setup
    Go To Markets Page
    Click Specific Element    ${MARKETS_PAGE_MARKET_TRADE_LIST_CRO_TITLE_TEXT}
    Clean And Input The Text    ${MARKETS_PAGE_MARKET_TRADE_LIST_SEARCH_INPUT}    xtz
    Element Text Should Be    ${MARKETS_PAGE_MARKET_TRADE_LIST_FIRST_ROW_INSTRUMENT_NAME_BASE}    XTZ
    Element Text Should Be    ${MARKETS_PAGE_MARKET_TRADE_LIST_FIRST_ROW_INSTRUMENT_NAME_QUOTE}    /CRO
    Click Specific Element    ${MARKETS_PAGE_MARKET_TRADE_LIST_FIRST_ROW_TRADE_BUTTON}
    Wait Until Element Is Visible    ${TRADE_SPOT_TOGGLE_TEXT}
    Capture Page Screenshot

Check The Element And The Text Is Expected
    [Arguments]    ${location}    ${text}
    Wait Until Element Is Visible    ${location}
    Element Text Should Be    ${location}    ${text}
