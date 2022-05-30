import os
from time import sleep

import pytest
from selenium.webdriver import ActionChains
from selenium.webdriver.chrome import webdriver
from selenium.webdriver.common import keys
from src.main.constants.locator_type import LocatorType
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from uiautomation import Keys

from src.main.pages.testenv_page import TestEnvPage

@pytest.fixture()
def resource():
    print("setup is running...")
    os.system('docker-compose up -d')

    yield "resource"
    print("teardown is running...")


class TestSemantic:



    # def test_select_checkboxes(self):
    #     test_page = TestEnvPage()
    #
    #     test_page.open_browser()
    #
    #     # res=test_page.find_test_element(LocatorType.xpath, "//*[@id='change_id']")
    #     test_page.driver.find_element(By.ID, "change_id").click()
    #     # test_page.driver.find_element_by_id("//*[@id='change:name']")
    #     sleep(5)
    #     test_page.driver.refresh()
    #     sleep(5)
    #     test_page.click_submit_btn()
    #     sleep(5)
    #     # res2= test_page.find_test_element(LocatorType.xpath, "//*[@id='change:name']")
    #     test_page.driver.find_element(By.ID, "change_id").click()
    #     sleep(5)
    #     test_page.close()

    def test_buy(self, resource):
       test_page = TestEnvPage()
       test_page.open_browser()
       # test_page.driver.set_window_size(1111, 591)

       # try:
       #     element = WebDriverWait(test_page.driver, 10).until(
       #         EC.presence_of_element_located((By.ID, "input-458"))
       #     )
       # except:
       #     pass
       test_page.driver.find_element(By.ID, "input-458").click()
       sleep(5)
       test_page.driver.execute_script("arguments[0].click();", test_page.driver.find_element(By.ID, "input-458"))



       test_page.driver.find_element(By.CSS_SELECTOR, ".DeliveryDatesModal__confirm > .BaseBtn__contents").click()
       test_page.driver.find_element(By.CSS_SELECTOR, ".BaseBtn__contents").click()
       element =test_page.driver.find_element(By.CSS_SELECTOR, ".BaseBtn__contents")
       actions = ActionChains(test_page.driver)
       actions.move_to_element(element).perform()
       element =test_page.driver.find_element(By.CSS_SELECTOR, "body")
       actions = ActionChains(test_page.driver)
       # actions.move_to_element(element, 0, 0).perform()
       test_page.driver.find_element(By.CSS_SELECTOR, "nav:nth-child(3) .maf-1").click()
       test_page.driver.execute_script("window.scrollTo(0,0)")
       test_page.driver.find_element(By.CSS_SELECTOR, ".BaseBtn__contents").click()
       test_page.driver.find_element(By.CSS_SELECTOR, ".v-select__slot:nth-child(1) > .v-select__selections").click()
       test_page.driver.find_element(By.CSS_SELECTOR, ".w-100").click()
       test_page.driver.find_element(By.CSS_SELECTOR, ".v-select__slot:nth-child(2) > .v-select__selections").click()
       test_page.driver.find_element(By.CSS_SELECTOR,
                                 "#list-item-729-0 .text-subtitle:nth-child(1) > .py-1 > span:nth-child(1)").click()
       test_page.driver.execute_script("window.scrollTo(0,133.14285278320312)")
       test_page.driver.find_element(By.CSS_SELECTOR, ".BaseBtn--block .text-button-1").click()
       test_page.driver.find_element(By.CSS_SELECTOR, ".v-select__selections").click()
       test_page.driver.find_element(By.CSS_SELECTOR, "#list-item-810-0 > .d-flex").click()
       test_page.driver.find_element(By.CSS_SELECTOR, ".BaseBtn--block .text-button-1").click()
       test_page.driver.find_element(By.CSS_SELECTOR,
                                 ".FoodIntoleranceModal__btn:nth-child(2) > .BaseBtn__contents").click()
       test_page.driver.find_element(By.CSS_SELECTOR, ".text-button-1").click()


