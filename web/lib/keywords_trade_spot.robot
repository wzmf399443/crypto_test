*** Keywords ***
Check The Defaut Price Is Not Empty
    [Documentation]     Check the defaut price in trade form is displayed
    ${price} =    Get Value    (${TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_INPUT})[1]/input
    Should Not Be Empty    ${price}

Verify The Value Are Order By DESC
    [Arguments]    ${value_list}
    ${origin_list} =    Copy List    ${value_list}
    Sort List    ${value_list}
    Lists Should Be Equal    ${origin_list}    ${value_list[::-1]}

Verify Buy And Sell Tab Is Worked In Trade Form
    [Documentation]    Check the tab works by checking trade type and amount
    [Arguments]    ${tab_type}    ${base_coin}    ${quote_coin}
    Element Text Should Be    ${TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_TYPE}    ${tab_type} ${base_coin}
    IF    '${tab_type}' == 'Buy'
        Element Text Should Be    ${TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_TYPE_AMOUNT}    -- ${quote_coin}
    ELSE IF    '${tab_type}' == 'Sell'
        Element Text Should Be    ${TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_TYPE_AMOUNT}    -- ${base_coin}
    END
