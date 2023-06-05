*** Settings ***
Documentation  Simple example using AppiumLibrary
Library  AppiumLibrary

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=10}
${INPUT_PASSWORD_ID}    com.android.settings:id/ui_manager_pwd_edit
${INPUT_PASSWORD}    	android:id/alertTitle
${PRESS_THE_BUTTON_ID}    android:id/button1
${PRESS_THE_BUTTON}    com.android.settings:id/icon_frame  
${CLICK_THE_BUTTON_ID}    //android.widget.ImageButton[@content-desc="Navigate up"]            
${MESSAGE}    New error message
*** Test Cases ***
Should send keys to search box and then check the value
  Open Test Application
  Verify Element Exist    Input password
  Input Search Query  350000
  Submit Search
  


*** Keywords ***
Open Test Application
  Open Application  http://127.0.0.1:4723/wd/hub 
  ...  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  
  ...  platformVersion=${ANDROID_PLATFORM_VERSION} 
  ...  appPackage=com.android.settings
  ...  appActivity=.Settings

  # "appium:appPackage": "com.android.settings",
  # "platformName": "Android",
  # "appium:platformVersion": "10",
  # "appium:appActivity": "com.android.settings.Settings",
  # "appium:automationName": "Uiautomator2"

Input Search Query
  [Arguments]  ${INPUT_PASSWORD_TEXT}
  Input Text  ${INPUT_PASSWORD_ID}    ${INPUT_PASSWORD_TEXT}

Submit Search
  Click Element  ${PRESS_THE_BUTTON_ID}
  Click Element    ${PRESS_THE_BUTTON}
  Wait Until Page Contains Element    ${PRESS_THE_BUTTON} 
  Click Element    ${CLICK_THE_BUTTON_ID}                     

Verify Element Exist
  [Arguments]  ${text} 
  Element Text Should Be    ${INPUT_PASSWORD}     ${text}    ${MESSAGE}

