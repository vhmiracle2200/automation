*** Variables ***
${recorder_obj}

*** Settings ***
Library        chrome_web_driver.py
Resource       config.robot
Library        video_recorder.py
Library        setup_for_web.py
Library        setup_for_android.py

*** Keywords ***
open
    [Arguments]    ${element}
    Go To          ${element}

clickAndWait
    [Arguments]    ${element}
    Click Element  ${element}

click
    [Arguments]    ${element}
    Click Element  ${element}

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys     ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text     ${element}    ${value}

selectAndWait
    [Arguments]        ${element}  ${value}
    Select From List   ${element}  ${value}

select
    [Arguments]        ${element}  ${value}
    Select From List   ${element}  ${value}

verifyValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

verifyTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertConfirmation
    [Arguments]                  ${value}
    Alert Should Be Present      ${value}

assertText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

assertTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

waitForTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

doubleClick
    [Arguments]           ${element}
    Double Click Element  ${element}

doubleClickAndWait
    [Arguments]           ${element}
    Double Click Element  ${element}

goBack
    Go Back

goBackAndWait
    Go Back

runScript
    [Arguments]         ${code}
    Execute Javascript  ${code}

runScriptAndWait
    [Arguments]         ${code}
    Execute Javascript  ${code}

setSpeed
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

setSpeedAndWait
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

verifyAlert
    [Arguments]              ${value}
    Alert Should Be Present  ${value}

_ChromeBrowser
    [Arguments]           ${port}   ${connect_existing}
    ${result} =    create_chrome      ${port}    ${connect_existing}
    [Return]       ${result}

Wait Untill page load
    [Arguments]    ${time}
    Wait Until Page Contains       ${time}

_VideoRecorder
    [Arguments]    ${video_name}
    ${result} =    create_recorder      ${video_name}
    [Return]       ${result}

Test Setup For Android
        [Arguments]    ${android_emulator_name}       ${appium_port}
         Run Genymobile Vm   ${android_emulator_name}     ${appium_port}


         Check Appium On Local Port   ${android_emulator_name}     ${appium_port}

Test Setup For Web
        [Arguments]    ${WEB_URL}       ${port}
         Run Chrome On Local Port   ${WEB_URL}     ${port}


Chrome Setup
             ${chromeOptions}    ChromeBrowser  ${CHROME_LOCAL_PORT}   ${CONNECT_TO_EXISTING_BROWSER}
#             setSpeedAndWait     1000
             Create Webdriver    Chrome  chrome_options=${chromeOptions}
             Wait Untill page load      Term & Conditions
             Set Selenium Speed      2

Recorder Start
             [Arguments]    ${video_name}
             VideoRecorder      ${video_name}

Recorder Stop
             Stop Recorder

Kill Browser
             Kill Browser Thread

Kill Android
             Kill Android Thread

Run Keyword and Return Log
    [Arguments]    @{keyword}
    ${status}    ${output}=    Run Keyword And Ignore Error    Run Keyword    @{keyword}
    Log    ${status}
    ${return code}=    Set Variable If    "${status}" == "PASS"    0    -1
    Should Contain  ${output}  device
#    [Return]    ${output}    ${return code}  ${is_matched}