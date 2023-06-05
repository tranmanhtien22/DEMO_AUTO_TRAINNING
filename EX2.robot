*** Settings ***
Documentation  Simple example using AppiumLibrary
Library  AppiumLibrary

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
# ${ANDROID_APP}                ${CURDIR}/demoapp/ApiDemos-debug.apk
${ANDROID_PLATFORM_NAME}      Android
# ${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=8}
${INPUT_TEXT_ID}    com.bluestacks.filemanager:id/search_src_text
${PRESS_ICON_FIND}    com.bluestacks.filemanager:id/search_button
${PRESS_ICON_EXPLORE}   com.bluestacks.filemanager:id/fragment_side_bar_listview
${PRESS_ICON_ANDROID}    com.bluestacks.filemanager:id/folderPreview
${message}    Eroll
*** Test Cases ***
Should send keys to search box and then check the value
  Open Test Application
  Submit Search1
  Input Search Query    Android
  Submit Search2
  Search Query Should Be Matching  data


*** Keywords ***
Open Test Application
  Open Application  http://127.0.0.1:4723/wd/hub  
  ...  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  
  # ...  platformVersion=${ANDROID_PLATFORM_VERSION}
  # ...  app=${ANDROID_APP}  
  ...  appPackage=com.bluestacks.filemanager
  ...  appActivity=.MainActivity

Input Search Query
  [Arguments]  ${INPUT_TEXT_NAME}
  Input Text  ${INPUT_TEXT_ID}  ${INPUT_TEXT_NAME}
  Wait Until Page Contains Element     ${PRESS_ICON_ANDROID}
Submit Search1
  Click Element  ${PRESS_ICON_EXPLORE}
  Click Element  ${PRESS_ICON_FIND}
Submit Search2
  Click Element  ${PRESS_ICON_ANDROID}
  Wait Until Page Contains Element     ${PRESS_ICON_ANDROID}
Search Query Should Be Matching
  [Arguments]  ${query}        
  Element Text Should Be  com.bluestacks.filemanager:id/folderLabel   ${query}     ${message}