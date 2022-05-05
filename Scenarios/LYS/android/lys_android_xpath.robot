# this file use  for constant tag define by XPATH

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=10.0}
${ANDROID_DEVICE_NAME}   192.168.154.102:5555    device

${product_loaded}  //*[@class = 'android.view.ViewGroup' and @resource-id = 'com.lys.android:id/parent' and (@text = '' or . = '')]
${search_field}  //*[@class = 'android.widget.EditText' and (@text = '' or . = '')]
${choose_date}  //*[@text='Choose dates']
${basket_icon}  com.lys.android:id/kds_button_badge