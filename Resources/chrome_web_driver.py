import unittest
from selenium import webdriver


class ChromeBrowser(unittest.TestCase):

    def create(self, port, connect_to_existing=True):
        options = webdriver.ChromeOptions()
        options.add_argument("--start-maximized")
        options.add_argument("--disable-web-security")
        options.add_argument("--start-maximized")
        options.add_argument("--allow-running-insecure-content")
        options.add_argument("--safebrowsing-disable-extension-blacklist")
        options.add_argument("--safebrowsing-disable-download-protection")
        options.add_argument("--disable-xss-auditor")
        options.add_argument("--disable-web-security")
        if connect_to_existing:
            options.add_experimental_option("debuggerAddress", "127.0.0.1:" + port)
        options.add_argument("--no-sandbox")
        options.add_argument("--disable-setuid-sandbox")
        options.add_argument("--disable-webgl")
        options.add_argument("--disable-popup-blocking")
        options.binary_location = "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"

        return options


def create_chrome(port, connect_to_existing):
    chrome_obj = ChromeBrowser()
    return chrome_obj.create(port, connect_to_existing=connect_to_existing)
