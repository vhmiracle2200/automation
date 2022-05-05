*** Settings ***
Documentation  Simple example using SeleniumLibrary
Library     SeleniumLibrary
Resource    lys_web_xpath.robot
Resource          ../../../Resources/common.robot

*** Variables ***
${testcase_spec}  None


*** Test Cases ***
2323_Buy sample product on web client

    [Tags]   include
    ${testcase_spec}   Get Testcase From Testrail By Id   2323
    sleep  3s

    wait until element is visible  xpath=//div[@id='__layout']/div/div/div/div/div/div/div/a/div/div/div/div[3]
    click  xpath=//div[@id='__layout']/div/div/div/div/div/div/div/a/div/div/div/div[3]
    click  id=input-525
    click  xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[3]/button[2]/div
    click  xpath=//div[@id='__layout']/div/div/div/main/div/div/div[2]/button/div/p
    click  xpath=//div[@id='__layout']/div/div/header/div/nav[2]/a/div/span/span/span/span
    click  xpath=//div[@id='__layout']/div/div/div/main/div[2]/div[2]/a/div/p
    click  xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div/div/label/div/div/div/div/div/div
    click  xpath=//div[@id='list-item-756-0']/div
    click  xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div/div[3]/label/div/div/div/div/div[2]/div
    click  xpath=//div[@id='list-item-762-0']/div/div/ul[2]/li
    click  xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div[2]/aside/a/div/p
    click  xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div/section/div/label/div/div/div/div/div[2]/div
    click  xpath=//div[@id='list-item-842-0']/div
    click  xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div[2]/aside/a/div
    click  xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[3]/button[2]/div/p
#    click    xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[3]/button[2]/div/p
#    open    https://3ds2-sandbox.ckotech.co/interceptor/3ds_yhlu2pyjev7e7knq7wdldocygi
#    selectFrame    index=0
#    type    id=password    Checkout1!
#    click    id=txtButton
#    open    https://web.demo.lys.ice.global/shop/payment-result/?id=41123&status=success
#    selectFrame    relative=parent
#    click    xpath=//div[@id='__layout']/div/div/div/main/section/a/div/p

    [Teardown]  Run Keywords  Add Result To Testrail Lys  Recorder Stop

