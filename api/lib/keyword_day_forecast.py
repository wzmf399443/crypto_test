from request_init import RequestInit
from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword


class DayForecast:
    def __init__(self) -> None:
        host = BuiltIn().get_variable_value("${API_HOST}")
        self.init = RequestInit(host)

    @keyword("Get Nine Day Forecast")
    def get_nine_day_forecast(self, cache: str = None, if_modified: str = None) -> object:
        if cache and if_modified:
            self.init.headers(
                {"Cache-Control": cache, "If-Modified-Since": if_modified}
            )
        resp = self.init.request(
            "get",
            "/locspc/android_data/fnd_e.xml"
        )
        print(resp.json())
        return resp


def main():
    pass
