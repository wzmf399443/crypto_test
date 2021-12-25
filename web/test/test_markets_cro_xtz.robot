*** Settings ***
Documentation     Verify cro xtz page in markets page
Resource    ../init.robot

Force Tags    web    market    cro
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Test Setup    Test Setup
Test Teardown    Test Teardown
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

Check the popup message is expected in each order type
    [Template]    Check Each Popup Content Is Expected
    Stop Loss
    Stop Limit
    OCO Limit
    OCO Market

Check the count of order book defaut list is expected
    Check The Element And The Text Is Expected    ${TRADE_SPOT_ORDER_BOOK_TITLE_TEXT}    Order Book
    ${ask_count} =    Get Element Count    ${TRADE_SPOT_ORDER_BOOK_ASK_LIST}/div
    ${buy_count} =    Get Element Count    ${TRADE_SPOT_ORDER_BOOK_BUY_LIST}/div
    ${last_price} =    Get Text    ${TRADE_SPOT_SYMBOL_INFO_ITEM_LAST_PRICE_TEXT}
    @{last_price} =    Split String    ${last_price}
    ${current_price} =    Get Text    ${TRADE_SPOT_ORDER_BOOK_CURRENT_PRICE}
    Should Be Equal As Strings    ${ask_count}    ${order_book_each_list_default_length}
    Should Be Equal As Strings    ${buy_count}    ${order_book_each_list_default_length}
    Should Be Equal As Strings    ${buy_count}    ${ask_count}
    Should Be Equal As Strings    ${last_price[0]}    ${current_price}

Check the value decimal is expected in order book
    [Template]    Check The Order Book Item Should Follow The Decimal Rule
    0.1
    0.01
    0.001

Check submit button will direct to login page when user not login
    Click Specific Element    ${TRADE_SPOT_TRADE_FORM_DISPLAY_TRADE_BLOCK_SUBMIT_BUTTON}
    Check The Element And The Text Is Expected    ${LOGIN_PAGE_LOGIN_BUTTON}    Sign in
    Title Should Be    Crypto.com OAuth
    Location Should Be    https://auth.crypto.com/users/sign_in

Check the favorite button Is Worked
    Enable Or Disable Favorite Button    ${true}
    Go To Markets Page
    Scroll Element Into View    ${MARKETS_PAGE_MARKET_TRADE_LIST_FAVORITES_TITLE_TEXT}
    Click Specific Element    ${MARKETS_PAGE_MARKET_TRADE_LIST_FAVORITES_TITLE_TEXT}
    Clean And Input The Text    ${MARKETS_PAGE_MARKET_TRADE_LIST_SEARCH_INPUT}    ${base_coin}
    Element Text Should Be    ${MARKETS_PAGE_MARKET_TRADE_LIST_FIRST_ROW_INSTRUMENT_NAME_BASE}    ${base_coin}
    Element Text Should Be    ${MARKETS_PAGE_MARKET_TRADE_LIST_FIRST_ROW_INSTRUMENT_NAME_QUOTE}    /${quote_coin}
    [Teardown]    Test Teardown For Un-favorite the item
    
*** Keywords ***
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
        Should Be Equal As Strings    ${total_text}    ${expected_total}[:-1]
    ELSE IF    '${total}' != '${None}'
        Clean And Input The Text    (${TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_INPUT})[3]/input    ${total}
        ${amount_text} =    Get Value    (${TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_INPUT})[2]/input
        ${expected_amount} =    Evaluate    f"{${total} / float(${price}):.3f}"
        Should Be Equal As Strings    ${amount_text}    ${expected_amount}[:-1]
    END

Check The Order Book Item Should Follow The Decimal Rule
    [Arguments]    ${decimal_rule}
    ${decimal_map} =    Create Dictionary    0.1=1    0.01=2    0.001=3
    Select Specific Decimal Rule In Order Book    ${decimal_rule}
    ${ask_items} =    Get WebElements    ${TRADE_SPOT_ORDER_BOOK_ASK_LIST_PRICE_TEXT}
    ${buy_items} =    Get WebElements    ${TRADE_SPOT_ORDER_BOOK_BUY_LIST_PRICE_TEXT}
    ${item_list} =    Combine Lists    ${ask_items}    ${buy_items}
    ${value_list} =    Create List
    FOR    ${item}    IN    @{item_list}
        ${price} =    Get Text    ${item}
        Append To List    ${value_list}    ${price}
        ${expected_price} =    Evaluate    f'{${price}:.${decimal_map["${decimal_rule}"]}f}'
        Should Be Equal As Strings    ${price}    ${expected_price}
    END
    Verify The Value Are Order By DESC    ${value_list}

Check Each Popup Content Is Expected
    [Arguments]    ${order_type}
    Click Order Type Dropdown And Select Specific Type    ${order_type}
    Click Specific Element    ${TRADE_SPOT_TRADE_FORM_ORDER_TYPE_TIP_ICON}
    Check The Element And The Text Is Expected    ${TRADE_SPOT_POPUP_MESSAGE_TITLE}    ${order_type}
    Check The Element And The Text Is Expected    ${TRADE_SPOT_POPUP_MESSAGE_CONTENT}    ${order_type_popup_message["${order_type}"]}
    Click Specific Element    ${TRADE_SPOT_POPUP_CANCEL_BUTTON}
    Wait Until Keyword Succeeds    5s    1s    Element Should Not Be Visible    ${TRADE_SPOT_POPUP_MESSAGE_TITLE}

Suite Setup
    Open Default Browser

Suite Teardown
    Close All Browsers

Test Setup
    Go To Markets Page
    Navigate To Specific Coin Trade Spot From Markets Page    ${base_coin}    ${quote_coin}

Test Teardown
    Run Keyword If Test Failed    Capture Page Screenshot

Test Teardown For Un-favorite the item
    Run Keyword If Test Failed    Capture Page Screenshot
    Go To Markets Page
    Navigate To Specific Coin Trade Spot From Markets Page    ${base_coin}    ${quote_coin}
    Enable Or Disable Favorite Button    ${false}
