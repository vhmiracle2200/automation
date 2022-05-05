*** Setting ***
Documentation     This suit is created for ending all suits
Suite Teardown    Suit Teardown
Library           OperatingSystem
Resource          ../../../Resources/common.robot


*** Variable ***

*** Keyword ***

Suit Teardown
    Run Keywords   Kill Browser    Recorder Stop  Kill Android

*** Test Cases ***
6666_ This suit is created for ending all suits
    [Tags]    include
    Log  This message is for ending test run.