

*** Settings ***
Library        chrome_web_driver.py

*** Variables ***
${BROWSER}   chrome
${SELSPEED}  0.7s
${ANDDROID_EMULATOR_NAME}      custom_ver_11
${APPIUM_PORT}      4723
${WEB_URL_DEV}      https://web.dev.lys.ice.global/
${WEB_URL_DEMO}      https://web.demo.lys.ice.global/
${CHROME_LOCAL_PORT}     9222
${CONNECT_TO_EXISTING_BROWSER}     True