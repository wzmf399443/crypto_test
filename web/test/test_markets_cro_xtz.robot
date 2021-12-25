*** Settings ***
Documentation     Verify cro xtz page in markets page
Resource    ../init.robot

Force Tags    web    market    cro
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Test Setup    Test Setup
Test Timeout    ${TIMEOUT}

*** Variables ***
${base_coin}    XTZ
${quote_coin}    CRO

*** Test Cases ***
Check the text and the elements is expected in symbol info
    [Template]    Check The Element And The Text Is Expected
    ${TRADE_SPOT_SYMBOL_INFO_DROPDOWN_TEXT}    XTZ/CRO
    ${TRADE_SPOT_SYMBOL_INFO_TITLE_TEXT_CHANGE}    Change
    ${TRADE_SPOT_SYMBOL_INFO_TITLE_TEXT_HIGH}    High
    ${TRADE_SPOT_SYMBOL_INFO_TITLE_TEXT_LOW}    Low
    ${TRADE_SPOT_SYMBOL_INFO_TITLE_TEXT_24H}    24H Vol

Check the defaut tab is buy and could be switched in trade form
    Element Attribute Value Should Be    ${TRADE_SPOT_TRADE_FORM_BUTTON_TAB_BUY}    class    button-tab active
    Verify Buy And Sell Tab Is Worked In Trade Form    Buy    ${base_coin}    ${quote_coin}
    Click Specific Element    ${TRADE_SPOT_TRADE_FORM_BUTTON_TAB_SELL}
    Verify Buy And Sell Tab Is Worked In Trade Form    Sell    ${base_coin}    ${quote_coin}

*** Keywords ***
Suite Setup
    Open Default Browser

Suite Teardown
    Close All Browsers

Test Setup
    Go To Markets Page
    Navigate To Specific Coin Trade Spot From Markets Page    ${base_coin}    ${quote_coin}

Check The Element And The Text Is Expected
    [Arguments]    ${location}    ${text}
    Wait Until Element Is Visible    ${location}
    Element Text Should Be    ${location}    ${text}
