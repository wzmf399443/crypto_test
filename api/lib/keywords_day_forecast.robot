*** Keywords ***
# -------- Verify --------
Get The Relative Humidity For The Day After Tommorrow
    [Arguments]    ${forecast_list}
    ${expected_date} =    Get From List    ${forecast_list}    ${1}
    ${relative_humidity} =    Create Dictionary    min=${expected_date["min_rh"]}    max=${expected_date["max_rh"]}
    LOG    Min: ${expected_date["min_rh"]} ~ Max: ${expected_date["max_rh"]}
    [Return]    ${relative_humidity}

Verify The Bulletin Datetime Is Expected
    [Arguments]    ${resp_time}
    ${current_time} =    Get Current Date    result_format=%Y%m%d%H%M
    ${current_time_int} =    Evaluate    int(${current_time})
    ${resp_time_int} =    Evaluate    int(${resp_time})
    Should Be True    ${current_time_int} >= ${resp_time_int}

Verify The Count Of Forecase Is Nine
    [Arguments]    ${forecast_list}
    ${forecast_list_count} =    Get Length    ${forecast_list}
    Should Be Equal As Strings    9    ${forecast_list_count}

Verify The Date Of Forecast Is Expected
    [Arguments]    ${forecast_list}
    ${current_time} =    Get Current Date    result_format=%s
    FOR    ${index}    ${item}    IN ENUMERATE    @{forecast_list}
        ${expected_date} =    Evaluate    datetime.datetime.fromtimestamp(${current_time}) + dateutil.relativedelta.relativedelta(days=(${index} + 1))    dateutil, datetime
        ${expected_date} =    Convert Date    ${expected_date}    result_format=%Y%m%d    date_format=%Y%m%d %H:%M:%S
        ${week_day} =    Convert Date    ${item["forecast_date"]}    result_format=%w    date_format=%Y%m%d
        Should Be Equal As Strings    ${expected_date}    ${item["forecast_date"]}
        Should Be Equal As Strings    ${week_day}    ${item["forecast_day_of_week"]}
    END
