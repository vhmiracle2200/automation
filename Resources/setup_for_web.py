import os
import subprocess
import threading


class Chrome:

    chrome_thread = threading.Thread()

    def __init__(self, url, port):
        self.port = port
        self.url = url


    def execute_chrome(self):
        os.system('chrome ' + self.url + ' --remote-debugging-port=' + self.port)


def run_chrome_on_local_port(url, port):
    kill_browser_thread()
    chrome_obj = Chrome(url, port)
    Chrome.chrome_thread = threading.Thread(target=chrome_obj.execute_chrome)
    Chrome.chrome_thread.start()


def kill_browser_thread():
    subprocess.call("TASKKILL /f  /IM  CHROME.EXE")
    subprocess.call("TASKKILL /f  /IM  CHROMEDRIVER.EXE")