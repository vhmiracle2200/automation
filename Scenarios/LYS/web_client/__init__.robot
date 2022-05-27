*** Setting ***
Documentation     This suit is created for checking functionality of all LYS pages
Suite Setup       Suit Setup
Suite Teardown    Suit Teardown
Test Setup        Set Testcase Inputs  ${LYS_testrun_id}  ${TEST NAME}  3  not set yet
Test Teardown     Close Window
Force Tags        exclude
Test Timeout      13 days 6 hours 50 minutes
Library           OperatingSystem
Resource          ../../../Resources/common_web.robot
Resource          ../../../Resources/common.robot
Resource          lys_web_xpath.robot
Resource          ../../../Resources/config.robot

*** Variable ***

*** Keyword ***

Suit Teardown
    Run Keywords    Recorder Stop
#    Run Keywords    close all browsers

Suit Setup
    Login To Testrail Server  ${TESTRAIL_URL}  ${TESTRAIL_USERNAME}  ${TESTRAIL_PASSWORD}  ${LYS_project_id}

#    Test Setup For Web    ${WEB_URL_DEMO}    ${CHROME_LOCAL_PORT}       TestResults/LYS_web
#    Chrome Setup
    Start Google Chrome Remote  ${WEB_DRIVER_REMOTE_ADDRESS}  ${WEB_URL_DEMO}