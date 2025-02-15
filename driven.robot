*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library    String

*** Variables ***
${CSV_FILE}    data2.csv

*** Test Cases ***
Search Wikipedia From CSV
    ${content}=    Get File    ${CSV_FILE}    # Read the entire CSV content as a string
    @{lines}=      Split String    ${content}    \n    # Split the content by new lines to get individual rows
    FOR    ${line}    IN    @{lines}    # Loop through each line (row) of the CSV
        ${columns}=    Split String    ${line}    ,    # Split each row by commas
        ${topic}=      Get From List    ${columns}    0    # Extract the topic from the first column (index 0)
        Open Browser    https://www.wikipedia.org/    chrome
        Input Text    id=searchInput    ${topic}
        Click Button    xpath=//button[@type='submit']
        Wait Until Page Contains    ${topic}
        Close Browser
    END
