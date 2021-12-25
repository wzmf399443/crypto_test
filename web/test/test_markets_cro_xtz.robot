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
${order_book_each_list_default_length}    ${9}

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

Check input of trade block limit is expected in trade form
    [Template]    Check The Input And Auto Fill In Limit Is Worked
    ${20}
    ${2.5}
    total=${30}
    total=${20.77}

Check the count order book defaut list is expected
    Check The Element And The Text Is Expected    ${TRADE_SPOT_ORDER_BOOK_TITLE_TEXT}    Order Book
    ${ask_count} =    Get Element Count    ${TRADE_SPOT_ORDER_BOOK_ASK_LIST}/div
    ${buy_count} =    Get Element Count    ${TRADE_SPOT_ORDER_BOOK_BUY_LIST}/div
    ${last_price} =    Get Text    ${TRADE_SPOT_SYMBOL_INFO_ITEM_LAST_PRICE_TEXT}
    @{last_price} =    Split String    ${last_price}
    ${current_price} =    Get Text    ${TRADE_SPOT_ORDER_BOOK_ASK_LIST_CURRENT_PRICE}
    Should Be Equal As Strings    ${ask_count}    ${order_book_each_list_default_length}
    Should Be Equal As Strings    ${buy_count}    ${order_book_each_list_default_length}
    Should Be Equal As Strings    ${buy_count}    ${ask_count}
    Should Be Equal As Strings    ${last_price[0]}    ${current_price}
    
    
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

Check The Input And Auto Fill In Limit Is Worked
    [Arguments]    ${amount}=${None}    ${total}=${None}
    Click Specific Element    ${TRADE_SPOT_TRADE_FORM_ORDER_TYPE_LIMIT}
    Element Attribute Value Should Be    ${TRADE_SPOT_TRADE_FORM_ORDER_TYPE_LIMIT}    class    e-tabs__nav-item active
    ${price} =    Get Value    (${TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_INPUT})[1]/input
    IF    '${amount}' != '${None}'
        Clean And Input The Text    (${TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_INPUT})[2]/input    ${amount}
        ${total_text} =    Get Value    (${TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_INPUT})[3]/input
        ${expected_total} =    Evaluate    f"{float(${price}) * ${amount}:.4f}"
        Capture Page Screenshot
        Should Be Equal As Strings    ${total_text}    ${expected_total}[:-1]
    ELSE IF    '${total}' != '${None}'
        Clean And Input The Text    (${TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_INPUT})[3]/input    ${total}
        ${amount_text} =    Get Value    (${TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_INPUT})[2]/input
        ${expected_amount} =    Evaluate    f"{${total} / float(${price}):.3f}"
        Capture Page Screenshot
        Should Be Equal As Strings    ${amount_text}    ${expected_amount}[:-1]
    END

Check The Order Book Item Should Follow The Decimal Rule
    ${price} =    Get Text    (${TRADE_SPOT_ORDER_BOOK_ASK_LIST_PRICE_TEXT})[1]
    ${expected_price} =    Evaluate    f'{${price}:.3f}'
    Should Be Equal As Strings    ${price}    ${expected_price}
