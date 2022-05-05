import os
import subprocess
import threading


class Chrome:

    web_is_setup = False
    chrome_thread = threading.Thread()

    def __init__(self, url, port):
        self.port = port
        self.url = url


    def execute_chrome(self):
        os.system('chrome ' + self.url + ' --remote-debugging-port=' +
                  self.port+ ' --start-maximized')


def run_chrome_on_local_port(url, port):
    kill_browser_thread()
    chrome_obj = Chrome(url, port)
    Chrome.chrome_thread = threading.Thread(target=chrome_obj.execute_chrome)
    Chrome.chrome_thread.start()


def kill_browser_thread():
    subprocess.call("TASKKILL /f  /IM  CHROME.EXE")
    subprocess.call("TASKKILL /f  /IM  CHROMEDRIVER.EXE")

def web_setup_completed():
    Chrome.web_is_setup = True

def get_web_is_setup():
    return(Chrome.web_is_setup)