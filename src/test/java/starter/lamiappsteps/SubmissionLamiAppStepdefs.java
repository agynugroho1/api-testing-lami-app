package starter.lamiappsteps;

import io.cucumber.java.en.When;

public class SubmissionLamiAppStepdefs {

    LamiApp lamiapp = new LamiApp();

    @When("I send GET request to view list {string} with params {string} is {string} and {string} is {string}")
    public void iSendGETRequestToViewListSubmissionWithParamsAnd(String type, String page, String valPage, String limit, String valLimit) {
        if (type.equalsIgnoreCase("submission")) {
            lamiapp.GetListSubmission(page, valPage, limit, valLimit);
        } else {
            lamiapp.GetListEvent(page, valPage, limit, valLimit);
        }
    }

    @When("I send PUT request to update status store userID is {string}")
    public void iSendPUTRequestToUpdateStatusStoreUser(String valUser) {
        lamiapp.PutUpdateUserStore(valUser);
    }

    @When("I send GET request to update status store userID is {string}")
    public void iSendGETRequestToUpdateStatusStoreUserIDIs(String ID) {
        lamiapp.GetDetailEventID(ID);
    }

    @When("I send GET request to update status event eventID is {string}")
    public void iSendGETRequestToUpdateStatusEventEventIDIs(String eventID) {
        lamiapp.GetDetailEventID(eventID);
    }

    @When("I send PUT request to update status event eventID is {string}")
    public void iSendPUTRequestToUpdateStatusEventEventIDIs(String updateEventID) {
        lamiapp.PutUpdateEventID(updateEventID);
    }
}
