from time import sleep

from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from src.main.pages.testenv_page import TestEnvPage


class TestSemantic:


    def test_semantic_id(self):
        test_page = TestEnvPage()

        test_page.open_browser()

        try:
            element = WebDriverWait(test_page.driver, 10).until(
                EC.presence_of_element_located((By.ID, "input-458"))
            )
        except :
            pass
        sleep(3)
        test_page.driver.find_element_by_id("input-458").click()
        sleep(10)



