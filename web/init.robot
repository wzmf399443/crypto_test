*** Settings ***
Library     BuiltIn
Library     Collections
Library     SeleniumLibrary
Library     String
 
Resource     ${CURDIR}/lib/keywords_common.robot
Resource     ${CURDIR}/lib/keywords_trade_spot.robot

Variables    variables.py
Variables    res/location/markets_page.py
Variables    res/location/trade_spot_page.py
