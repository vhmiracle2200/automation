
*** Settings ***
Documentation  Simple example using AppiumLibrary
Resource       ../../../Resources/common.robot
Library     AppiumLibrary
Resource    xpath.robot
Library   Process
Library   OperatingSystem

Test Setup           Test Setup For Android    ${ANDDROID_EMULATOR_NAME}    ${APPIUM_PORT}  Fedshi_android_dev

*** Variables ***
${Fedshi_app}       none

*** Test Cases ***

Buy simple product in Fedshi android dev

  Wait Until Keyword Succeeds    500x    5s    Run Keyword and Return Log  Run  adb devices


  ${lys_app}     Open Test Application
  wait until element is visible     //*[@class = 'android.view.ViewGroup' and @resource-id = 'com.fedshi.res.dev:id/parent' and (@text = '' or . = '')]
  Input Text    //*[@class = 'android.widget.EditText' and (@text = '' or . = '')]  vahid_automation
  Sleep  1s

  Click Element         //*[@class = 'android.view.ViewGroup' and @resource-id = 'com.fedshi.res.dev:id/parent' and (@text = '' or . = '')]
  Sleep  1s

  # click buy button
  wait until element is visible          //*[@class = 'android.widget.TextView' and (@text = 'أضف إلى السلة' or . = 'أضف إلى السلة') and @resource-id = 'com.fedshi.res.dev:id/kds_button_text']
  click element          com.fedshi.res.dev:id/kds_button_text
  Sleep  1s

 # click on basket icon
  wait until element is visible          //*[@class = 'android.widget.TextView' and (@text = '1' or . = '1') and @resource-id = 'com.fedshi.res.dev:id/kds_button_badge']
  click element          com.fedshi.res.dev:id/kds_button_badge
  Sleep  3s

## Click on checkout
  wait until element is visible         com.fedshi.res.dev:id/checkout
  click element    com.fedshi.res.dev:id/kds_button_text
  Sleep  1s

  wait until element is visible         //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.LinearLayout[2]/android.view.ViewGroup[1]/android.widget.LinearLayout[2]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.EditText[1]
  Input Text  //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.LinearLayout[2]/android.view.ViewGroup[1]/android.widget.LinearLayout[2]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.EditText[1]  140
  Sleep  1s

# click continue
  wait until element is visible         //*[@class = 'android.widget.TextView' and (@text = 'استمر' or . = 'استمر') and @resource-id = 'com.fedshi.res.dev:id/kds_button_text']
  click element         //*[@class = 'android.widget.TextView' and (@text = 'استمر' or . = 'استمر') and @resource-id = 'com.fedshi.res.dev:id/kds_button_text']
  Sleep  1s

# choose first address
  wait until element is visible         //*[@class = 'android.view.ViewGroup' and (@text = '' or . = '')]
  click element         //*[@class = 'android.view.ViewGroup' and (@text = '' or . = '')]
  Sleep  1s

# Continue in shipping
  click element         com.fedshi.res.dev:id/kds_button_text
  Sleep  3s

# Confirm pay money on receive porduct
  wait until element is visible        //*[@class = 'android.widget.TextView' and (@text = 'الدفع عند الاستلام' or . = 'الدفع عند الاستلام') and @resource-id = 'com.fedshi.res.dev:id/kds_fillable_text']
  click element         com.fedshi.res.dev:id/btnContinue
  Sleep  1s

# Confirm summary
  wait until element is visible        //*[@class = 'android.widget.TextView' and (@text = 'تفاصيل الطلب' or . = 'تفاصيل الطلب')]
  click element         com.fedshi.res.dev:id/kds_button_text
  Sleep  1s

# Confirm confirmation
  wait until element is visible        //*[@class = 'android.widget.TextView' and (@text = 'تأكيد' or . = 'تأكيد') and @resource-id = 'com.fedshi.res.dev:id/title']
  click element         com.fedshi.res.dev:id/button_2
  Sleep  1s

# Back to orders view
  wait until element is visible        //*[@class = 'android.widget.TextView' and (@text = 'عرض التفاصيل' or . = 'عرض التفاصيل') and @resource-id = 'com.fedshi.res.dev:id/view_detail']
  click element         //*[@class = 'android.widget.TextView' and (@text = 'عرض التفاصيل' or . = 'عرض التفاصيل') and @resource-id = 'com.fedshi.res.dev:id/view_detail']
  Sleep  1s

  Sleep  3s
  [Teardown]    Run Keywords       Kill Android      Recorder Stop

*** Keywords ***
Open Test Application
  Open Application  remote_url=http://127.0.0.1:4723/wd/hub    alias=lys_app  appPackage=com.fedshi.res.dev   appActivity=me.kubes.android.MainActivity    automationName=${ANDROID_AUTOMATION_NAME}  deviceName=${ANDROID_DEVICE_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}  noReset=true   fullReset=false