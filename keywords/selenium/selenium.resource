*** Variables ***
${CHROME_DRIVER_PATH_WINS}    ${CURDIR}${/}..${/}..${/}driver${/}win32${/}chromedriver102.exe
${CHROME_DRIVER_PATH_Linux}    ${/}usr${/}local${/}bin${/}chromedriver${/}

*** Keywords ***
Create Chrome Driver
    [Documentation]  create new driver with options
    [Arguments]  ${url}    ${speed}=0.1
    ${system}    Evaluate    platform.system()    platform
    ${chrome_option}    Evaluate    sys.modules['selenium.driver'].ChromeOptions()    sys
    Call Method    ${chrome_option}    add_experimental_option    useAutomationExtension    ${False}
    Call Method    ${chrome_option}    add_agrument    --headless
    Call Method    ${chrome_option}    add_agrument    --test-type
    Call Method    ${chrome_option}    add_agrument    --ignore-certificate-errors
    Call Method    ${chrome_option}    add_agrument    --disable-gpu
    Call Method    ${chrome_option}    add_agrument    -no-sandbox
    Run Keyword If    '${system}'=='Linux'
    ...    Run Keywords    Call Method    ${chrome_option}    add_agrument    --test-type
    ...    AND            Call Method    ${chrome_option}    add_agrument    --disable-extensions
    ...    AND            Call Method    ${chrome_option}    add_agrument    --headless
    ...    AND            Call Method    ${chrome_option}    add_agrument    --window-size\=1600,1200
    ${driver_path}=    Run Keywod If    '${system}'=='Linux'    Set Variable    ${CHROME_DRIVER_PATH_Linux}