
*** Variables ***


*** Keywords ***


*** Settings ***
Library  SeleniumLibrary
Resource       ../../../Resources/common.robot

Test Setup           Test Setup For Web    ${WEB_URL_DEMO}    ${CHROME_LOCAL_PORT}


*** Test Cases ***
buy_product_demo

#    [Tags]   buy_product_demo
    [Tags]   exclude_folder
    Chrome Setup
    Recorder Start      buy_product_chrome_demo


    sleep       5
    click    xpath=//div[@id='__layout']/div/div/div/div/div/div/a/div/div/div/div[3]
    click    xpath=//div[@id='__layout']/div/div/div/main/div/div/div[2]/div/div[2]/div[2]/label/div/div/div/div/input
    click    xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[2]/div[2]/label/div/div/div/div/input
    type    xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[2]/div[2]/label/div/div/div/div/input    123456A12343444123455A
    click    xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[3]/div/div/button
    click    xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[4]/button[2]/div
    click    xpath=//div[@id='__layout']/div/div/div/main/div/div/div[2]/button/div
    click    css=a.d-block > svg.BaseIcon
    click    xpath=//div[2]/a/div
    click    xpath=//label/div/div/div/div/div
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Privacy Policy'])[1]/following::div[4]
    click    xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div/div[5]/label/div/div/div/div/textarea
    type    xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div/div[5]/label/div/div/div/div/textarea    this is from automation
    click    xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div[2]/aside/a/div
    click    xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div/section/div/label/div/div/div/div[2]/div
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Privacy Policy'])[1]/following::div[4]
    click    xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div[2]/aside/a/div
    click    xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/ul/li[4]/button
    click    xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[4]/button[2]/div
    click    xpath=//div[@id='__layout']/div/div/div/main/div[2]/div/div/div/div/div/div/div/label/div/span/span
    click    xpath=//div[@id='__layout']/div/div/div/main/div[2]/div/div/div/div[2]/button/div
    click    xpath=//div[@id='__layout']/div/div/div/main/section/a/div


    [Teardown]    Run Keywords       Kill Browser      Recorder Stop


