*** Settings ***
Library    RequestsLibrary
Library    Collections
#Suite Setup    Authenticate as Admin

*** Variables ***
${base_url}     https://restful-booker.herokuapp.com
${firstname}    porag
*** Test Cases ***
Create a Booking at Restful Booker

    create session    AddData   ${Base_URL}
    ${booking_dates}   create dictionary    checkin=2022-12-47    checkout=2023-01-01
    ${body}    create dictionary    firstname=hdhf    lastname=fvtv    totalprice=415    depositpaid=false    bookingdates=${booking_dates}
    ${header}=  create dictionary    Cotent-Type=application/json
    ${response}=    POST On Session    url=https://restful-booker.herokuapp.com/booking     json=${body}   headers=${header}
    ${id}    set variable    ${response.json()}[bookingid]
    set suite variable    ${id}


    ${response}    GET On Session    https://restful-booker.herokuapp.com/booking/${id}
    log to console    ${response.json()}




#    ${response}    POST    url=https://restful-booker.herokuapp.com/booking    json=${body}
#    ${header}=  create dictionary   Content-Type=application/json
#    ${response}=    POST On Session    mysession      /booking/   data=${body}    headers=${header}
#
#    log to console     ${response.status_code}
#    log to console    ${response.content}
#
#    #validations
#    ${status_code}=     convert to string    ${response.status_code}
#    should be equal    ${status_code}   200

#    ${body}=    ${response.content}
#    should contain     ${body}      Porag