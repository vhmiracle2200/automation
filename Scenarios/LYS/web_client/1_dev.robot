
*** Variables ***


*** Keywords ***


*** Settings ***
Library  SeleniumLibrary
Resource       ../../../Resources/common.robot
Resource    Element_xpaths.robot

Test Setup           Test Setup For Web    ${WEB_URL_DEV}    ${CHROME_LOCAL_PORT}


*** Test Cases ***
buy_product_dev

    [Tags]   buy_product_dev
    Chrome Setup
    Recorder Start      buy_product_chrome_web_dev


    sleep       5

    # Click to Product
    run script      window.scrollTo(0,247.3333282470703)
    run script      window.scrollTo(0,580.6666870117188)
    run script      window.scrollTo(0,920)
    click       css=.col-sm-6:nth-child(12) .v-responsive__sizer
#    click       ${sample_product}

    # Choose days
    click       ${choose_days}

    # Send Postal code
    ${Postalcode_present}=  Run Keyword And Return Status    Element Should Be Visible   ${Postalcode_input}
    ${input_value_postalcode}   get element attribute    ${Postalcode_input}      value
    Run Keyword If    '${input_value_postalcode}'=='None'    type      ${Postalcode_input}        ${valid_postal_code}


    # Click to 1 Week without postal code

    Run Keyword Unless    ${Postalcode_present}    click      ${one_week_button_without_postcode}
    # Click to 1 Week with postal code
    Run Keyword IF   ${Postalcode_present}     click        ${one_week_button_with_postcode}
    # Click to Confirm with postal code
    Run Keyword If    ${Postalcode_present}     click       ${confirm_button_with_postcode}
    # Click to Confirm without postal code
    Run Keyword Unless   ${Postalcode_present}  click    ${confirm_button_without_postcode}


    #Add to basket
    click    ${add_to_basket_button}

    # Click to Basket icon
    open       ${basket_url}

    # Click Checkout
    click    ${checkout_button}

    # Click to Address input
    click    ${address_input}
    # Choose default address
    click    ${choose_default_address}

    # Click to Add delivery note area
    click    ${delivery_note_area}
    # Type sample note
    type     ${delivery_note_area}    this is from automation

    # Click Continue shipping
    click    ${continue_shipping}

    # Click Credit Card
    click       ${credit_card}
    # Click default card
    click       ${default_credit_card}

    # Click continue Payment
    click       ${continue_payment}

    # Click Onion Allergy
    click       ${oniion_allergy_button}
    # Click Add Allergy
    click       ${add_allergy_button}

    # Click Agreement In summary
    click    ${aggreement_in_summary}

    # Click Pay
    click       ${pay_button}

   # End of order and back to home page
    wait until element is visible       ${end_of_pay_back_to_home}
    click    ${end_of_pay_back_to_home}


#    [Teardown]    Run Keywords       Kill Browser      Recorder Stop


