*** Settings ***
Documentation  Simple example using SeleniumLibrary
Library     SeleniumLibrary
Resource    lys_web_xpath.robot
Resource          ../../../Resources/common.robot
Resource          ../../../Resources/common_web.robot

*** Variables ***
${testcase_spec}  None


*** Test Cases ***
2323_Buy sample product on web client

    [Tags]   exclude
    ${testcase_id}   Create Testcase With Params   ${LYS_shop_section_id}  Buy sample product on web client  1  3
#    wait until element is visible  xpath=//div[contains(text(),'Fresh Meal Plans')]
    sleep  5
    scroll element into view  //p[normalize-space()='Balanced Diet']
    wait until element is visible   xpath=(//div[@class="v-responsive__sizer"])[9]
#
    wait until element is visible  id=input-564
    Wait Until Element Is Clickable    id=input-564
    clickAndWait   id=input-564
    sleep  5
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

    [Teardown]  Run Keywords  Add Result To Testrail Lys  ${testcase_id}

