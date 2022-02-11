# this file use  for constant tag define by XPATH

*** Variables ***
${sample_product}    xpath=//div[@id='__layout']/div/div/div/div/div/div/a/div/div/div/div[3]
${choose_days}    xpath=//div[@id='__layout']/div/div/div/main/div/div/div[2]/div/div[2]/div[2]/label/div/div/div/div/input

${valid_postal_code}          NW10 6PU
${Postalcode_input}    //div[@id='__layout']/div/div[2]/div[2]/div/div/div[2]/div[2]/label/div/div/div/div/input
${one_week_button_without_postcode}     xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[2]/div/div/button
${one_week_button_with_postcode}     xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[3]/div/div/button
${confirm_button_with_postcode}     xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[4]/button[2]/div/p
${confirm_button_without_postcode}     xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[3]/button[2]/div/p
${add_to_basket_button}       xpath=//div[@id='__layout']/div/div/div/main/div/div/div[2]/button/div

${basket_url}       https://web.dev.lys.ice.global/cart

${checkout_button}       xpath=//div[2]/a/div

${address_input}       xpath=//label/div/div/div/div/div
${choose_default_address}       xpath=(.//*[normalize-space(text()) and normalize-space(.)='Privacy Policy'])[1]/following::div[4]
${delivery_note_area}       xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div/div[5]/label/div/div/div/div/textarea
${continue_shipping}       xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div[2]/aside/a/div

${credit_card}       xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div/section/div/label/div/div/div/div[2]/div
${default_credit_card}       xpath=(.//*[normalize-space(text()) and normalize-space(.)='Privacy Policy'])[1]/following::div[4]
${continue_payment}       xpath=//div[@id='__layout']/div/div/div/div/form/main/div[2]/div[2]/aside/a/div
${oniion_allergy_button}       xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/ul/li[4]/button
${add_allergy_button}       xpath=//div[@id='__layout']/div/div[2]/div[2]/div/div/div[4]/button[2]/div

${aggreement_in_summary}       xpath=//div[@id='__layout']/div/div/div/main/div[2]/div/div/div/div/div/div/div/label/div/span/span
${pay_button}       xpath=//div[@id='__layout']/div/div/div/main/div[2]/div/div/div/div[2]/button/div

${end_of_pay_back_to_home}       xpath=//div[@id='__layout']/div/div/div/main/section/a/div

