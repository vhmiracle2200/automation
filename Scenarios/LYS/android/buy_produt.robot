
*** Settings ***
Documentation  Simple example using AppiumLibrary
Resource       ../../../Resources/common.robot
Library     AppiumLibrary
Resource    xpath.robot
Library   Process
Library   OperatingSystem

Test Setup           Test Setup For Android    ${ANDDROID_EMULATOR_NAME}    ${APPIUM_PORT}

*** Variables ***
${lys_app}       none

*** Test Cases ***

Buy simple product in lys android

  Wait Until Keyword Succeeds    500x    5s    Run Keyword and Return Log  Run  adb devices


  ${lys_app}     Open Test Application
  wait until element is visible     //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.FrameLayout[2]/android.view.ViewGroup[1]/android.widget.ImageView[1]
  click element          //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.FrameLayout[2]/android.view.ViewGroup[1]/android.widget.ImageView[1]



#  wait until element is visible          //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.LinearLayout[2]/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.TextView[1]
  wait until element is visible          //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/androidx.viewpager.widget.ViewPager[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.ImageView[1]
#  scroll down   //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.TextView[1]
  click element     //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.TextView[1]

# Click on 1 week
  wait until element is visible          //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.RelativeLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.CompoundButton[1]
  click element          //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.RelativeLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.CompoundButton[1]

  wait until element is visible          com.lys.android:id/kds_button_text
  click element          com.lys.android:id/kds_button_text
#
  wait until element is visible          com.lys.android:id/kds_fillable_text
  click element          com.lys.android:id/kds_fillable_text
#

  wait until element is visible         com.lys.android:id/text
  click element         com.lys.android:id/text
#
  wait until element is visible         com.lys.android:id/kds_button_text
  click element         com.lys.android:id/kds_button_text
#
  wait until element is visible         com.lys.android:id/kds_fillable_text
  click element         com.lys.android:id/kds_fillable_text
#
  wait until element is visible         com.lys.android:id/text
  click element         com.lys.android:id/text
#
  wait until element is visible         com.lys.android:id/kds_button_text
  click element         com.lys.android:id/kds_button_text
#
  wait until element is visible         com.lys.android:id/kds_button_text
  click element         com.lys.android:id/kds_button_text
#
  wait until element is visible         com.lys.android:id/kds_button_text
  click element         com.lys.android:id/kds_button_text

  [Teardown]    Run Keywords       Kill Android      Recorder Stop

*** Keywords ***
Open Test Application
  Open Application  remote_url=http://127.0.0.1:4723/wd/hub  app_package=com.lys.android   app_activity=me.kubes.android.MainActivity    alias=lys_app  automationName=${ANDROID_AUTOMATION_NAME}  deviceName=${ANDROID_DEVICE_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}