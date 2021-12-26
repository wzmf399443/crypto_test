*** Variables ***
${SCHEMA_FOLDER}    ${CURDIR}/res/schema

*** Settings ***
Library     BuiltIn
Library     Collections
Library     DateTime
Library     String
 
Resource    ${CURDIR}/lib/keywords_day_forecast.robot

Library     ${CURDIR}/lib/common.py
Library     ${CURDIR}/lib/keyword_day_forecast.py

Library     keyword_day_forecast.DayForecast

Variables    variables.py
