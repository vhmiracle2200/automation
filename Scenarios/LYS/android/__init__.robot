*** Setting ***
Documentation     This suit is created for checking functionality of all LYS pages on android
Suite Setup       Suit Setup
Suite Teardown    Suit Teardown
Test Setup        Set Testcase Inputs  ${LYS_testrun_id}  ${TEST NAME}  3  not set yet
Force Tags        exclude
Test Timeout      13 days 6 hours 50 minutes
Library           OperatingSystem
Library           AppiumLibrary
Resource          ../../../Resources/common.robot
Resource          lys_android_xpath.robot

*** Variable ***

*** Keyword ***

Suit Teardown
    Run Keywords    Recorder Stop

Suit Setup
    Login To Testrail Server  ${TESTRAIL_URL}  ${TESTRAIL_USERNAME}  ${TESTRAIL_PASSWORD}  ${LYS_project_id}
    Wait Until Keyword Succeeds    500x    5s    Run Keyword and Return Log  Run  adb devices
    Test Setup For Android    ${ANDDROID_EMULATOR_NAME}    ${APPIUM_PORT}  TestResults/LYS_android
    AppiumLibrary.Set Appium Timeout  10
