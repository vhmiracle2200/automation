*** Setting ***
Documentation     This suit is created for checking functionality of all Fedshi pages
Suite Setup       Suit Setup
Suite Teardown    Suit Teardown
Test Setup        Set Testcase Inputs  ${Fedshi_testrun_id}  ${TEST NAME}  3  not set yet
Force Tags        include
Test Timeout      13 days 6 hours 50 minutes
Library           OperatingSystem
Library           AppiumLibrary
Resource          ../../../Resources/common.robot
Resource          ../../../Resources/config.robot
Resource          fedshi_xpath.robot


*** Variable ***

*** Keyword ***
Open Fedshi Application

  Open Application  remote_url=http://127.0.0.1:4723/wd/hub    alias=fedshi_app  appPackage=com.fedshi.res.dev   appActivity=me.kubes.android.MainActivity    automationName=${ANDROID_AUTOMATION_NAME}  deviceName=${ANDROID_DEVICE_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}  noReset=true   fullReset=false

  wait until element is visible  ${founded_product_in_shop}

Suit Teardown
    Run Keywords    Recorder Stop

Suit Setup
    Login To Testrail Server  ${TESTRAIL_URL}  ${TESTRAIL_USERNAME}  ${TESTRAIL_PASSWORD}
    Wait Until Keyword Succeeds    500x    5s    Run Keyword and Return Log  Run  adb devices
    Test Setup For Android    ${ANDDROID_EMULATOR_NAME}    ${APPIUM_PORT}  TestResults/Fedshi_android
    Set Appium Timeout  15
    ${Fedshi_app}     Open Fedshi Application
    Sleep  5s