# this file use  for constant tag define by XPATH

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=10.0}
${ANDROID_DEVICE_NAME}   192.168.154.102:5555    device


##############  Elements   #######################

${orderlist_button}  com.fedshi.res.dev:id/nav_graph_order
${product_loaded}  com.fedshi.res.dev:id/selling_price
${search_field}  //*[@class = 'android.widget.EditText' and (@text = '' or . = '')]
${add_to_basket}  //*[@class = 'android.widget.TextView' and (@text = 'أضف إلى السلة' or . = 'أضف إلى السلة') and @resource-id = 'com.fedshi.res.dev:id/kds_button_text']
${basket_icon}  com.fedshi.res.dev:id/kds_button_start_icon
${input_price}  //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.LinearLayout[2]/android.view.ViewGroup[1]/android.widget.LinearLayout[2]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.EditText[1]
${first_address}  //*[@class = 'android.view.ViewGroup' and (@text = '' or . = '')]
${confirm_get_money_on_recevie_product}  //*[@class = 'android.widget.TextView' and (@text = 'الدفع عند الاستلام' or . = 'الدفع عند الاستلام') and @resource-id = 'com.fedshi.res.dev:id/kds_fillable_text']

##############  Order_page   #######################
${order_view_group}  //*[@class = 'android.view.ViewGroup' and (@text = '' or . = '')]
${order_status_in_order_page}  com.fedshi.res.dev:id/statusTxt
${order_item_count_in_order_page}  com.fedshi.res.dev:id/itemCount
${order_commission_in_order_page}  com.fedshi.res.dev:id/commission
${order_price_in_order_page}  com.fedshi.res.dev:id/price
${order_orderid_in_order_page}  com.fedshi.res.dev:id/resellerOrderId

##############  Shop_page   #######################
${save_icon_in_shop}  //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.FrameLayout[2]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.ImageView[1]
${founded_product_in_shop}  //*[@class = 'android.view.ViewGroup' and @resource-id = 'com.fedshi.res.dev:id/parent' and (@text = '' or . = '')]
${catetory_home_kitchen_in_shop}  //*[@class = 'android.widget.TextView' and (@text = 'المنزل و المطبخ' or . = 'المنزل و المطبخ')]
${catetory_clothes_in_shop}  //*[@class = 'android.widget.TextView' and (@text = 'ملابس' or . = 'ملابس')]
${sub_catetory_kitchen_in_shop}  //*[@class = 'android.widget.TextView' and (@text = 'اجهزة المطبخ' or . = 'اجهزة المطبخ')]
${sub_catetory_home_in_shop}  //*[@class = 'android.widget.TextView' and (@text = 'اجهزة المنزل' or . = 'اجهزة المنزل')]
${basket_icon_in_shop}  //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.LinearLayout[1]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]
${clear_search_icon_in_search_in_shop}  //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[3]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.ImageView[1]
${empty_image_in_shop}  com.fedshi.res.dev:id/kds_empty_basket_imageview

##############  navigation_bar   #######################
${navigation_you}  com.fedshi.res.dev:id/nav_graph_you
${navigation_home}  //*[@class = 'android.widget.FrameLayout' and @resource-id = 'com.fedshi.res.dev:id/nav_graph_home' and (@text = '' or . = '')]

##############  toolbar_bar   #######################
${toolbar_back_button}  //*[@class = 'android.widget.FrameLayout' and @resource-id = 'com.fedshi.res.dev:id/toolbar_icon' and (@text = '' or . = '')]

##############  You_page   #######################
${save_products_you}  //*[@class = 'android.widget.TextView' and (@text = 'قائمة المحفوظات' or . = 'قائمة المحفوظات') and @resource-id = 'com.fedshi.res.dev:id/kds_fillable_text']

##############  Save_produts_page   #######################
${save_product_area_in_save_product_page}  com.fedshi.res.dev:id/parent
${save_product_icon_in_save_product_page}  //hierarchy/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.FrameLayout[2]/android.view.ViewGroup[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.ImageView[1]
${product_in_save_product_page}  //*[@class = 'android.view.ViewGroup' and @resource-id = 'com.fedshi.res.dev:id/parent' and (@text = '' or . = '')]

##############  basket_page   #######################
${toolbar_in_basket_page}  //*[@class = 'android.widget.TextView' and (@text = 'سلة التسوق' or . = 'سلة التسوق') and @resource-id = 'com.fedshi.res.dev:id/toolbar_normal_title']