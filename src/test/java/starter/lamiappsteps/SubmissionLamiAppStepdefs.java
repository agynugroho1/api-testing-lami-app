package starter.lamiappsteps;

import io.cucumber.java.en.When;

public class SubmissionLamiAppStepdefs {

    LamiApp lamiapp = new LamiApp();

    @When("I send GET request to view list submission with params {string} is {string} and {string} is {string}")
    public void iSendGETRequestToViewListSubmissionWithParamsAnd(String page, String valPage, String limit, String valLimit) {
        lamiapp.GetListSubmission(page, valPage, limit, valLimit);
        lamiapp.GetListEvent(page, valPage, limit, valLimit);
    }

    @When("I send PUT request to update status store userID is {string}")
    public void iSendPUTRequestToUpdateStatusStoreUser(String valUser) {
        lamiapp.PutUpdateUserStore(valUser);
    }

    @When("I send GET request to update status store userID is {string}")
    public void iSendGETRequestToUpdateStatusStoreUserIDIs(String ID) {
        lamiapp.GetDetailEventID(ID);
    }
}
