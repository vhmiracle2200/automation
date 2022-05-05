*** Settings ***
Documentation  Simple example using AppiumLibrary
Library     AppiumLibrary
Resource    lys_android_xpath.robot
Resource    ../../../Resources/common.robot

*** Variables ***
${lys_app}       none
${testcase_spec}  None

*** Test Cases ***

2320_Buy sample product in lys android

  [Tags]   include
  ${testcase_spec}   Get Testcase From Testrail By Id   2320

  ${lys_app}     Open Test Application
  sleep  3s

  wait until element is visible       ${product_loaded}  timeout=10s
  Input Text    ${search_field}  balanced diet
  Sleep  1s

  Click Element         //*[@class = 'android.view.ViewGroup' and @resource-id = 'com.lys.android:id/parent' and (@text = '' or . = '')]
  Sleep  1s


#  scroll down to reach calendar textview
  wait until element is visible        com.lys.android:id/toolbar_normal_title
  Swipe    376    1017    388    233
  #click on calendar textview
  wait until element is visible   ${choose_date}
  Click Element     ${choose_date}
  Sleep  1s

## Click on 1 week
#  wait until element is visible         id=com.lys.android:id/one_week_chip
##  Click Element    id=com.lys.android:id/one_week_chip

  # click confirm button
  wait until element is visible   com.lys.android:id/button_2
  click element          com.lys.android:id/button_2
  Sleep  1s

  # click buy button
  wait until element is visible   com.lys.android:id/kds_button_text
  click element          com.lys.android:id/kds_button_text
  Sleep  1s

 # click on basket icon
  wait until element is visible    ${basket_icon}
  click element     ${basket_icon}
  Sleep  3s

# Click on checkout
  wait until element is visible  com.lys.android:id/kds_button_text
  click element         com.lys.android:id/kds_button_text
  Sleep  1s

# Choose Alergies
  wait until element is visible  com.lys.android:id/kds_button_text
  click element         com.lys.android:id/kds_button_text
  Sleep  1s

# Choose address
  wait until element is visible  com.lys.android:id/kds_fillable_action_icon
  click element         com.lys.android:id/kds_fillable_action_icon
  Sleep  1s

# choose first address
  wait until element is visible  com.lys.android:id/available
  click element         com.lys.android:id/text
  Sleep  1s
  click element         com.lys.android:id/kds_button_text

# Choose delivery time
  wait until element is visible          //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.ScrollView[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[2]/android.view.ViewGroup[1]/android.widget.ImageView[1]
  click element         //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.ScrollView[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[2]/android.view.ViewGroup[1]/android.widget.ImageView[1]
  Sleep  1s


# choose first delivery time
  wait until element is visible          com.lys.android:id/title
  click element         com.lys.android:id/text
  wait until element is visible          com.lys.android:id/checkbox
  click element         com.lys.android:id/button_2
  Sleep  1s

# Continue in shipping
  click element         com.lys.android:id/kds_button_text
  Sleep  3s

# Select Credit card
  wait until element is visible          com.lys.android:id/kds_fillable_text
  click element         com.lys.android:id/kds_fillable_text
  Sleep  1s

# choose first card
  wait until element is visible  //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]
  click element         //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]
  Sleep  1s
  click element         com.lys.android:id/kds_button_text

# Continue to payment
  click element         com.lys.android:id/kds_button_text
  Sleep  1s

# Pay on summary
  wait until element is visible          com.lys.android:id/summary_title
  click element         com.lys.android:id/kds_button_text
  Sleep  1s

# Confirm confirmation
#  wait until element is visible          com.lys.android:id/checkbox
#  click element         com.lys.android:id/button_2
#  Sleep  1s

  Sleep  3s
  [Teardown]  Run Keywords  Add Result To Testrail Lys


2321_Search sample product

  [Tags]   include
  ${lys_app}     Open Test Application
  sleep  3s

  wait until element is visible       //*[@class = 'android.view.ViewGroup' and @resource-id = 'com.lys.android:id/parent' and (@text = '' or . = '')]  timeout=10s
  Input Text    //*[@class = 'android.widget.EditText' and (@text = '' or . = '')]  balanced diet
  Sleep  1s

#  element should be visible     //*[@class = 'android.view.ViewGroup' and @resource-id = 'com.lys.android:id/parent' and (@text = '' or . = '')]
  verifyElementPresent   //*[@class = 'android.view.ViewGroup' and @resource-id = 'com.lys.android:id/parent' and (@text = '' or . = '')]
  Sleep  3s
  [Teardown]  Run Keywords  Add Result To Testrail Lys

*** Keywords ***
Open Test Application
  Open Application  remote_url=http://127.0.0.1:4723/wd/hub    alias=lys_app  appPackage=com.lys.android   appActivity=me.kubes.android.MainActivity    automationName=${ANDROID_AUTOMATION_NAME}  deviceName=${ANDROID_DEVICE_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}  noReset=true   fullReset=false