package starter.lamiappsteps;

import io.cucumber.java.en.When;

public class ParticipationStepdefs {

    LamiApp lamiApp = new LamiApp();

    @When("I send GET Request for events participations")
    public void iSendGETRequestForEventsParticipations() {
        lamiApp.getEventsParticipations();
    }
}
