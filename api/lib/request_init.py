#!/usr/bin/env python
# -*- coding: utf-8 -*-
import requests
import requests.packages.urllib3
requests.packages.urllib3.disable_warnings()


class RequestInit(object):

    def __init__(self, host: str = "", content: bool = True) -> None:
        self.SESSION = requests.Session()
        self.HOST = host

        if content:
            self.SESSION.headers.update({
                "Content-Type": "application/json; charset=utf-8"
            })

    def headers(self, token: str = None, host: str = None, content_type: str = None, others: dict = None) -> None:
        if host:
            self.SESSION.headers.update({
                "Host": host
            })
        if content_type:
            self.SESSION.headers.update({
                "Content-Type": content_type
            })
        if type(others) == dict:
            self.SESSION.headers.update(others)

    def request(self, method: str, append: str = '', verify: bool = False, timeout: int = 60, **kwargs) -> object:
        ''' method:
                e.g.: get post patch delete
            append:
                e.g.: /solution
            **kwargs:
                e.g.: data={"name":"qa"} or json={"name":"qa"}
        '''
        url = self.HOST + append
        print(url)
        resp = self.SESSION.request(method, url, verify=verify, timeout=timeout, **kwargs)
        return resp


def main():
    pass
