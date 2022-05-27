*** Variables ***
${recorder_obj}

*** Settings ***
Resource       config.robot
Library        video_recorder.py
Library        setup_for_android.py
Library        testrail.py

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

wait until page contains element
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

Wait Untill page load
    [Arguments]    ${time}
    Wait Until Page Contains       ${time}

_VideoRecorder
    [Arguments]    ${video_name}
    ${result} =    create_recorder      ${video_name}
    [Return]       ${result}

Test Setup For Android
        [Arguments]    ${android_emulator_name}       ${appium_port}   ${movie_name}
         Run Genymobile Vm   ${android_emulator_name}     ${appium_port}
         Check Appium On Local Port   ${android_emulator_name}     ${appium_port}
         Recorder Start  ${movie_name}


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

Get Testcase From Testrail By Id
             [Arguments]    ${testcase_id}
             Get Testcase By Id      ${testcase_id}
             [Return]       ${testcase_spec}

Create Testcase With Params
             [Arguments]    ${section_id}  ${title}  ${type_id}  ${priority_id}
             ${testcase_params}  Create Test Case    ${section_id}  ${title}  ${type_id}  ${priority_id}
             ${testcase_id}=   evaluate   $testcase_params.get("id")
             ${testcase_id}=  Convert To String  ${testcase_id}
             ${testcase_spec}   Get Testcase From Testrail By Id   ${testcase_id}
             [Return]       ${testcase_id}

Checking Testcase
  [Arguments]    ${section_id}  ${title}  ${type_id}  ${priority_id}

  [Return]       ${testcase_params}

Set Current Testcase Inputs
            [Arguments]    ${testrun_id}  ${testcase_id}  ${testcase_status}  ${testcase_status_comment}
             Set Testcase Inputs

Add Result To Testrail Lys
    [Arguments]    ${testcase_id}
    Set Testcase Inputs   ${LYS_testrun_id}  ${testcase_id}  ${TEST STATUS}  ${TEST MESSAGE}
    Set Testcase Result By Id

Add Result To Testrail Fedshi
    [Arguments]    ${testcase_id}
    Set Testcase Inputs   ${Fedshi_testrun_id}  ${testcase_id}  ${TEST STATUS}  ${TEST MESSAGE}
    Set Testcase Result By Id

Android Setup Be Completed
    Android Setup Completed

Get Android Setup Status
    ${android_status}  Get Android Is Setup
    [Return]       ${android_status}
