*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Get Wikipedia Summary for Python
    Create Session    wiki    https://en.wikipedia.org/api/rest_v1/
    ${response}=    GET On Session    wiki    /page/summary/Python_(programming_language)
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.json()}
