import os
import subprocess
import threading

import selenium


class Android:

    android_thread = threading.Thread()

    def __init__(self, android_emulator_name, appium_port):
        self.appium_port = appium_port
        self.android_emulator_name = android_emulator_name

    def run_appium(self):
        if not selenium.webdriver.common.utils.is_url_connectable(self.appium_port):
            os.system('Appium --log-level error')

    def execute_genymobile_vm_emulator(self):
       kill_adb_thread()
       if 'genymotion' not in os.environ['PATH']:
        os.system('setx PATH "%ProgramFiles%\Genymobile\Genymotion" /M')

        os.system('gmtool.exe admin start ' + self.android_emulator_name)


def check_appium_on_local_port(android_emulator_name, appium_port):
    android_obj = Android(android_emulator_name, appium_port)
    Android.android_thread = threading.Thread(target=android_obj.run_appium)
    Android.android_thread.start()

def run_genymobile_vm(android_emulator_name, appium_port):
    android_obj = Android(android_emulator_name, appium_port)
    Android.android_thread = threading.Thread(target=android_obj.execute_genymobile_vm_emulator)
    Android.android_thread.start()


def kill_android_thread():
    subprocess.call("TASKKILL /f  /IM  node.exe")

def kill_adb_thread():
    subprocess.call("TASKKILL /f  /IM  adb.exe")