
*** Variables ***


*** Keywords ***


*** Settings ***
Library  SeleniumLibrary
Resource       ../../../Resources/common.robot

Test Setup           Test Setup For Web    ${WEB_URL_DEMO}    ${CHROME_LOCAL_PORT}


*** Test Cases ***
Buy sample product on web client


    [Tags]   buy_product_LYS_webclient_demo
    Chrome Setup
    Recorder Start      buy_product_chrome_web_dev


    click    xpath=//div[@id='__layout']/div/div/div/div/div/div/div/a/div[2]/p
    click    id=input-524
    click    xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[3]/button[2]/div/p
    click    xpath=//div[@id='__layout']/div/div/div/main/div/div/div[2]/button/div/p
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Shop'])[1]/following::*[name()='svg'][1]
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Contact us'])[1]/following::*[name()='svg'][1]
    click    xpath=//div[@id='__layout']/div/div/div/main/div[2]/div[2]/a/div
    click    xpath=//div[@id='list-item-677-0']/div/div/p
    click    xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div/div[3]/label/div/div/div/div/div[2]/div
    click    xpath=//div[@id='list-item-683-0']/div/div/ul[2]/li
    click    xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div[2]/aside/a/div/p
    click    xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div/section/div/label/div/div/div/div/div[2]/div
    click    xpath=//div[@id='list-item-752-0']/div/span[2]
    click    xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div[2]/aside/a/div/p
    click    xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[3]/button[2]/div/p
    click    xpath=//div[@id='__layout']/div/div/div/main/div[2]/div/div/div/div/button/div/p
#    click    xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[3]/button[2]/div/p
#    open    https://3ds2-sandbox.ckotech.co/interceptor/3ds_yhlu2pyjev7e7knq7wdldocygi
#    selectFrame    index=0
#    type    id=password    Checkout1!
#    click    id=txtButton
#    open    https://web.demo.lys.ice.global/shop/payment-result/?id=41123&status=success
#    selectFrame    relative=parent
#    click    xpath=//div[@id='__layout']/div/div/div/main/section/a/div/p

    [Teardown]  Run Keywords   Kill Browser    Recorder Stop

