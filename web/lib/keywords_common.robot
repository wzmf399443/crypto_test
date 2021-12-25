*** Keywords ***
Go To Markets Page
    Go To    https://crypto.com/exchange/markets
    Wait Until Element Is Visible    ${MARKETS_PAGE_MARKET_TITLE_TEXT}

Navigate To Specific Coin Trade Spot From Markets Page
    [Arguments]    ${base_coin}    ${quote_coin}    
    Scroll Element Into View    ${MARKETS_PAGE_MARKET_TRADE_LIST_${quote_coin}_TITLE_TEXT}
    Click Specific Element    ${MARKETS_PAGE_MARKET_TRADE_LIST_${quote_coin}_TITLE_TEXT}
    Clean And Input The Text    ${MARKETS_PAGE_MARKET_TRADE_LIST_SEARCH_INPUT}    ${base_coin}
    Element Text Should Be    ${MARKETS_PAGE_MARKET_TRADE_LIST_FIRST_ROW_INSTRUMENT_NAME_BASE}    ${base_coin}
    Element Text Should Be    ${MARKETS_PAGE_MARKET_TRADE_LIST_FIRST_ROW_INSTRUMENT_NAME_QUOTE}    /${quote_coin}
    Click Specific Element    ${MARKETS_PAGE_MARKET_TRADE_LIST_FIRST_ROW_TRADE_BUTTON}
    Wait Until Keyword Succeeds    10s    1s    Check The Defaut Price Is Not Empty

Open Default Browser
    [Documentation]    Open default browser 
    ...                if ${BROWSER_PORT} is true, will use docker browser. 
    ...                if not, will use local browser driver
    [Arguments]    ${browser_url}=https://crypto.com/exchange/    ${browser_name}=chrome
    Run Keyword IF    '${BROWSER_PORT}'=='None'    Open Local Browser    ${browserURL}    ${browserName}
    ...    ELSE    Open Docker Browser    ${browserURL}    ${browserName}
    Set Window Size    ${WINDOW_WEIGHT}    ${WINDOW_HEIGHT}

Open Docker Browser
    [Arguments]    ${browserURL}    ${browserName}=${None}
    ${capabilities} =    Create Dictionary
    Set To Dictionary    ${capabilities}    browserName    ${DEFAULT_BROWSER}
    ${executor} =    Evaluate    str("http://127.0.0.1:${BROWSER_PORT}/wd/hub")
    ${webdriver} =    Create Webdriver    Remote    alias=${browserName}    desired_capabilities=${capabilities}    command_executor=${executor}
    Go to    ${browserURL}

Open Local Browser
    [Arguments]    ${browserURL}    ${browserName}=${None}
    Open Browser    ${browserURL}    ${DEFAULT_BROWSER}    alias=${browserName}

Clean And Input The Text
    [Arguments]    ${element}    ${text}
    Wait Until Element Is Visible    ${element}
    Clear Element Text    ${element}
    Input Text    ${element}    ${text}

Click Specific Element
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    Click Element    ${element}

# -------- Verify --------
