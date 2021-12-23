*** Keywords ***
Open Default Browser
    [Documentation]    Open default browser
    [Arguments]    ${browser_url}=https://crypto.com/exchange/markets    ${browser_name}=chrome
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
# -------- Element --------
# -------- Verify --------
