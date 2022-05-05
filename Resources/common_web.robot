*** Variables ***
${recorder_obj}

*** Settings ***
Library        chrome_web_driver.py
Library        setup_for_web.py
Library        SeleniumLibrary
Library        testrail.py

*** Keywords ***
_ChromeBrowser
    [Arguments]           ${port}   ${connect_existing}
    ${result} =    create_chrome      ${port}    ${connect_existing}
    [Return]       ${result}


Test Setup For Web
        [Arguments]    ${WEB_URL}       ${port}     ${movie_name}
         Run Chrome On Local Port   ${WEB_URL}     ${port}
         Recorder Start  ${movie_name}

Chrome Setup
             ${chromeOptions}    ChromeBrowser  ${CHROME_LOCAL_PORT}   ${CONNECT_TO_EXISTING_BROWSER}
#             setSpeedAndWait     1000
             Create Webdriver    Chrome  chrome_options=${chromeOptions}
             SeleniumLibrary.Wait Until Page Contains      About Us
             Set Selenium Speed      1.5
