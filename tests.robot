*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Search Wikipedia for Python
    Open Browser    https://www.wikipedia.org/    chrome
    Input Text    id=searchInput    Python
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Python 
    Close Browser
