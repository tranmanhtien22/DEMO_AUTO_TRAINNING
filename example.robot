*** Settings ***
Documentation  Simple example using AppiumLibrary
Library  AppiumLibrary

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${CLICK_BUTTON}    com.bluestacks.filemanager:id/fragment_side_bar_container
${CLICK_SEARCH_ BUTTON}    	com.bluestacks.filemanager:id/search_button
${SEARCH_BAR}    com.bluestacks.filemanager:id/search_src_text



*** Test Cases ***
Should send keys to search box and then check the value
  Open Test Application
  Submit Search
  Input Search Query  Movies


*** Keywords ***
Open Test Application
  Open Application  http://127.0.0.1:4723/wd/hub  
  ...  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  
#   ...  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  appPackage=com.bluestacks.filemanager
  ...  appActivity=.MainActivity

Input Search Query
  [Arguments]  ${query}
  Input Text    ${SEARCH_BAR}  ${query}

Submit Search
  Click Element  ${CLICK_BUTTON}
  Click Element  ${CLICK_SEARCH_BUTTON}
  
# Search Query Should Be Matching
#   [Arguments]  ${text}
#   Wait Until Page Contains Element  android:id/search_src_text
#   Element Text Should Be  android:id/search_src_text  ${text}