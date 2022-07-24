package starter.lamiappsteps;

import io.cucumber.java.en.When;

public class EventsLamiAppStepdefs {

    LamiApp lamiapp = new LamiApp();
    @When("I send GET request to detail event by eventID is {string}")
    public void iSendGETRequestToDetailEventByEventIDIs(String eventID) {
        lamiapp.GetDetEventID(eventID);
    }

    @When("I send GET request to view event list with params {string} is {string},{string} is {string},{string} is {string},{string} is {string}")
    public void iSendRequestToViewEventListWithParamsIsIsIsIs(String page, String valPage, String limit, String valLimit, String name, String valName, String city, String valCity) {
        lamiapp.GetEventList(page, valPage, limit, valLimit, name, valName, city, valCity);
    }

    @When("I send POST Request for create event with {string} is {string}, {string} is {string},{string} is {string},{string} is {string},{string} is {string},{string} is {string}, {string} is {string},{string} is {string},{string} is {string},{string} is {string},{string} is {string}")
    public void iSendPOSTRequestForCreateEventWithIsIsIsIsIsIsIsIsIsIsIs(String image, String falImage, String doc, String falDoc, String name, String falName, String hostedBy, String falHostedBy, String phone, String falPhone, String startDate, String falStartDate, String endDate, String falEndDate, String city, String falCity, String location, String falLoc, String details, String falDetails, String price, String falPrice) {
        lamiapp.PostCreateEvent(image, falImage, doc, falDoc, name, falName, hostedBy, falHostedBy, phone, falPhone, startDate, falStartDate, endDate, falEndDate, city, falCity, location, falLoc, details, falDetails, price, falPrice);
  }

    @When("I send DELETE request for event by eventID {string}")
    public void iSendDELETERequestForEventByEventID(String DelEventID) {
        lamiapp.deleteEventID();
    }
}
