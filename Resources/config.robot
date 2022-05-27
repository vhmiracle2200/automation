

*** Settings ***

*** Variables ***
${BROWSER}   chrome
${SELSPEED}  0.7s
${ANDDROID_EMULATOR_NAME}      custom_ver_11
${APPIUM_PORT}      4723
${WEB_URL_DEV}      https://web.dev.lys.ice.global/shop
${WEB_URL_DEMO}      https://web.demo.lys.ice.global/shop
${Prod_URL_DEMO}      https://web.lys.ice.global/shop/

#This is healenium server that run on docker
${WEB_DRIVER_REMOTE_ADDRESS}    http://localhost:8085

#${TESTRAIL_URL}     https://alamivahid.testrail.io
#${TESTRAIL_USERNAME}     vahid.alami@ice.global
#${TESTRAIL_PASSWORD}     Alami.vahid2200
#${LYS_testrun_id}=     17
#${Fedshi_testrun_id}=     18

${TESTRAIL_URL}     https://qaiceglobal.testrail.io
${TESTRAIL_USERNAME}     vh.miracle2200@gmail.com
${TESTRAIL_PASSWORD}     Alami.vahid2200
${LYS_testrun_id}=     2
${LYS_project_id}=     2
${LYS_shop_section_id}=     7

${Fedshi_testrun_id}=     5
${Fedshi_project_id}=     3
${Fedshi_shop_section_id}=     5
${Fedshi_order_section_id}=     6