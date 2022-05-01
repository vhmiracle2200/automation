*** Setting ***
Documentation     Setting metadata for test suite directory
Suite Setup       Login To Testrail Server  ${TESTRAIL_LYS_URL}  ${TESTRAIL_USERNAME}  ${TESTRAIL_PASSWORD}
Suite Teardown    Suit Teardown    Teardown of    test suite directory
Test Setup        Set Testcase Inputs  ${testrun_id}  ${TEST NAME}  3  not set yet
#Test Teardown     Test Teardown2  Teardown00
Force Tags        suite force
Test Timeout      13 days 6 hours 50 minutes
Library           OperatingSystem
Resource          ../../../Resources/common.robot
Resource          xpath.robot
Default Tags      Not allowed
Test Template     Not allowed

*** Variable ***
${default}        default
${default_tag_2}    suite${default}2

*** Keyword ***
My Setup
    [Arguments]    ${msg}
    Log    ${msg}

Suit Teardown
    [Arguments]    @{msg_parts}
    ${msg} =    Create Message    @{msg_parts}
    Log   ${msg}
    Run Keywords       Kill Android      Recorder Stop

    Directory Should Not Be Empty    ${CURDIR}    Test that OS lib was imported



Create Message
    [Arguments]    @{msg_parts}
    ${msg} =    Catenate    @{msg_parts}
    [Return]    ${msg}