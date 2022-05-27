*** Settings ***
Documentation  Test suit for testing Fedshi
Resource    fedshi_xpath.robot
Resource    ../../../Resources/common.robot
Library     DependencyLibrary
Library     AppiumLibrary

*** Variables ***
${Fedshi_app}       none
${testcase_spec}

*** Test Cases ***

2322_Buy simple product_in Fedshi android demo

  [Tags]   include
  ${testcase_id}   Create Testcase With Params   ${Fedshi_shop_section_id}  Buy simple product_in Fedshi android demo  1  3
  
  Go To Shop Page

  Search Product  vahid_automation

  # Click on founded product
  Click Element         ${founded_product_in_shop}

  # click add to basket button
  wait until element is visible       ${add_to_basket}  20s
  click element          com.fedshi.res.dev:id/kds_button_text

  # some sleep for skip toast message
  sleep  3s

 # click on basket icon
  wait until element is visible    ${basket_icon}  20s
  click element          com.fedshi.res.dev:id/kds_button_badge

## Click on checkout
  wait until element is visible   com.fedshi.res.dev:id/checkout  20s
  click element    com.fedshi.res.dev:id/kds_button_text

  wait until element is visible   ${input_price}  20s
  Input Text  ${input_price}  150


# click continue
  wait until element is visible   //*[@class = 'android.widget.TextView' and (@text = 'استمر' or . = 'استمر') and @resource-id = 'com.fedshi.res.dev:id/kds_button_text']  10
  click element         //*[@class = 'android.widget.TextView' and (@text = 'استمر' or . = 'استمر') and @resource-id = 'com.fedshi.res.dev:id/kds_button_text']

# choose first address
  wait until element is visible   ${first_address}  10s
  click element         ${first_address}

# Continue in shipping
  click element         com.fedshi.res.dev:id/kds_button_text

# Confirm pay money on receive porduct
  wait until element is visible        ${confirm_get_money_on_recevie_product}    5s
  click element         com.fedshi.res.dev:id/btnContinue

# Confirm summary
  wait until element is visible           //*[@class = 'android.widget.TextView' and (@text = 'تفاصيل الطلب' or . = 'تفاصيل الطلب')]
  click element         com.fedshi.res.dev:id/kds_button_text

# Confirm confirmation
  wait until element is visible           //*[@class = 'android.widget.TextView' and (@text = 'تأكيد' or . = 'تأكيد') and @resource-id = 'com.fedshi.res.dev:id/title']
  click element         com.fedshi.res.dev:id/button_2

# Back to orders view
  wait until element is visible           //*[@class = 'android.widget.TextView' and (@text = 'عرض التفاصيل' or . = 'عرض التفاصيل') and @resource-id = 'com.fedshi.res.dev:id/view_detail']
  click element         //*[@class = 'android.widget.TextView' and (@text = 'عرض التفاصيل' or . = 'عرض التفاصيل') and @resource-id = 'com.fedshi.res.dev:id/view_detail']
  
  [Teardown]  Add Result To Testrail Fedshi  ${testcase_id}



2325_Check_save_itemes _in Fedshi android demo

  [Tags]    exclude
  Log  ${TEST NAME}
  ${testcase_id}   Create Testcase With Params   ${Fedshi_shop_section_id}  Check save itemes in Fedshi android  1  3
  
  Go To Shop Page

  Search Product  vahid_automation

#   Click on save icon in a product area
  Click Element         ${save_icon_in_shop}

  # Click on 'حسابی'
  Click Element  ${navigation_you}

  # Click on 'قایمه المحفوظات'
  wait until element is visible  ${save_products_you}
  Click Element  ${save_products_you}

  # The product must be shown
  wait until element is visible  ${product_in_save_product_page}
  element should be visible  ${product_in_save_product_page}

  # Click again on save button for safe area for next test runs
  click element  ${save_product_icon_in_save_product_page}

  #Back to  you
  click element  ${toolbar_back_button}
  wait until element is visible  ${save_products_you}

  [Teardown]  Add Result To Testrail Fedshi  ${testcase_id}

2326_Check search function_in Fedshi android demo

  [Tags]    exclude
  Log  ${TEST NAME}
  ${testcase_id}   Create Testcase With Params   ${Fedshi_shop_section_id}  Check search function_in Fedshi android demo  1  3
  
  Go To Shop Page

  Search Product  vahid_automation

  # The product must be shown
  element should be visible    ${founded_product_in_shop}

    # Clear search area
  Clear Text  ${search_field}

  Search Product  vahid_automation_fake

  # The product must not be shown
  page should not contain element  ${founded_product_in_shop}

    # Clear search area
  Input Text  ${search_field}  ${EMPTY}
  
  [Teardown]  Add Result To Testrail Fedshi  ${testcase_id}

2327_Check scroll down for load new products_in Fedshi android demo

  [Tags]    exclude
  Log  ${TEST NAME}
  ${testcase_id}   Create Testcase With Params   ${Fedshi_shop_section_id}  Check scroll down for load new products_in Fedshi android demo  1  3
  
  Go To Shop Page

  # Try to scroll down for loading new products
  Swipe    376    1017    388    233
  wait until element is visible   ${product_loaded}  timeout=10s
  Swipe    376    1017    388    233
  element should be visible    ${founded_product_in_shop}
  Swipe    376    1017    388    233
  element should be visible    ${founded_product_in_shop}

  [Teardown]  Add Result To Testrail Fedshi  ${testcase_id}

2328_Check the category works fine or not_in Fedshi android demo

  [Tags]    exclude
  Log  ${TEST NAME}
  ${testcase_id}   Create Testcase With Params   ${Fedshi_shop_section_id}  Check the category works fine or not_in Fedshi android demo  1  3
  
  Go To Shop Page

  # Click on 'لمنزل و المطبخ' category
  Click Element  ${catetory_home_kitchen_in_shop}
  wait until element is visible  ${founded_product_in_shop}  10s

  Search Product  vahid_automation

  # The product must be shown
  element should be visible    ${founded_product_in_shop}

  # Change category to 'ملابس'
  click element    ${catetory_clothes_in_shop}
  sleep  2s

  # The product must not be shown in this category
  page should not contain element    ${founded_product_in_shop}
  
  [Teardown]  Add Result To Testrail Fedshi  ${testcase_id}

2329_Check the basket icon in shop page_in Fedshi android demo

  [Tags]    exclude
  Log  ${TEST NAME}
  ${testcase_id}   Create Testcase With Params   ${Fedshi_shop_section_id}  Check the basket icon in shop page_in Fedshi android demo  1  3
  
  Go To Shop Page

  # Click on basket icon
  Click Element  ${basket_icon_in_shop}

  wait until element is visible    ${empty_image_in_shop}
  # The product must be shown
  element should be visible    ${empty_image_in_shop}


  [Teardown]  Add Result To Testrail Fedshi  ${testcase_id}

2330_Check the sub_category_in shop page_in Fedshi android demo

  [Tags]    exclude
  Log  ${TEST NAME}
  ${testcase_id}   Create Testcase With Params   ${Fedshi_shop_section_id}  Check the sub_category_in shop page_in Fedshi android demo  1  3

  Go To Shop Page

  # Click on 'المنزل و المطبخ' category
  Click Element  ${catetory_home_kitchen_in_shop}

  Search Product  vahid_automation

  # click on 'اجهزه المطبخ' sub category
  Click Element    ${sub_catetory_kitchen_in_shop}
  wait until element is visible  ${founded_product_in_shop}  10s

  page should contain element    ${founded_product_in_shop}


   # click on 'اجهزه المنزل' sub category
  Click Element    ${sub_catetory_home_in_shop}

  sleep  3s
  page should not contain element    ${founded_product_in_shop}

  [Teardown]  Add Result To Testrail Fedshi  ${testcase_id}

################################# Order view ##########

2324_Order list can open or not_in Fedshi android demo

  [Tags]   exclude
  Log  ${TEST NAME}
  depends on test   2322_Buy simple product_in Fedshi android demo

  ${testcase_id}   Create Testcase With Params   ${Fedshi_order_section_id}  Order list can open or not  1  3

  Go To Shop Page

  # Click on 'الطلبات'
  Click Element         ${orderlist_button}
  sleep  3s

  # Orders must be shown
  element should be visible    ${order_view_group}

  [Teardown]  Add Result To Testrail Fedshi  ${testcase_id}

2332_Check the created order parameters _in Fedshi android demo

  [Tags]    exclude
  Log  ${TEST NAME}
  depends on test   2322_Buy simple product_in Fedshi android demo
  ${testcase_id}   Create Testcase With Params   ${Fedshi_order_section_id}  Check the created order parameters _in Fedshi android demo  1  3

  Go To Shop Page

  # Click on 'الطلبات'
  Click Element         ${orderlist_button}
  sleep  3s

  # Orders must be shown
  wait until element is visible   ${order_view_group}
  element should be visible    ${order_view_group}

  # Check order parameters
  element text should be  ${order_status_in_order_page}  قيد المعالجة
  element text should be  ${order_item_count_in_order_page}  1 منتج
  element text should be  ${order_commission_in_order_page}  ربحك 0 د.ع.
  element text should be  ${order_price_in_order_page}  150 د.ع.

  [Teardown]  Add Result To Testrail Fedshi  ${testcase_id}


*** Keywords ***
Is Element Visible in Page
  [Arguments]    ${locator}
  ${result} =    get matching xpath count   ${locator}

  [Return]       ${result}

Search Product
  [Arguments]    ${product_name}
  Input Text  ${search_field}     ${product_name}
  sleep  2s


Go To Shop Page
  ${home_nav_is_seen}=  Is Element Visible in Page  ${navigation_home}
  Run Keyword If  '${home_nav_is_seen}'=='0'   Open Fedshi App
  Run Keyword If  '${home_nav_is_seen}'!='None'   click element   ${navigation_home}
  wait until element is visible     ${founded_product_in_shop}

#   Clear search area
  Clear Text  ${search_field}

Open Fedshi App

  open application  remote_url=http://127.0.0.1:4723/wd/hub    alias=fedshi_app  appPackage=com.fedshi.res.dev   appActivity=me.kubes.android.MainActivity    automationName=${ANDROID_AUTOMATION_NAME}  deviceName=${ANDROID_DEVICE_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}  noReset=true   fullReset=false

  wait until element is visible  ${founded_product_in_shop}  timeout=10s



