*** Settings ***
Documentation     Verify 9 days forecast
Resource    ../init.robot

Force Tags    api    day_forecast

*** Test Cases ***
/locspc/android_data/fnd_e.xml - Get - should be response 200 ok and expected data
    ${resp} =    Get Nine Day Forecast
    Should Be Equal As Strings    ${resp.status_code}    200
    Verify Json Schema    ${SCHEMA_FOLDER}    schema_day_forecast    9_day_forecast    ${resp.json()}
    Verify The Bulletin Datetime Is Expected    ${resp.json()["bulletin_datetime"]}
    Verify The Count Of Forecase Is Nine    ${resp.json()["forecast_detail"]}
    Verify The Date Of Forecast Is Expected    ${resp.json()["forecast_detail"]}
    Get The Relative Humidity For The Day After Tommorrow    ${resp.json()["forecast_detail"]}
