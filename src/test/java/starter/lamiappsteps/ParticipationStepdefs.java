package starter.lamiappsteps;

import io.cucumber.java.en.And;
import io.cucumber.java.en.When;

public class ParticipationStepdefs {

    LamiApp lamiApp = new LamiApp();

    @When("I send {string} Request for events participations")
    public void iSendGETRequestForEventsParticipations(String type) {
        switch (type.toLowerCase()){
            case "get" :
                lamiApp.getEventsParticipations();
                break;
            case "post" :
                lamiApp.postEventsParticipations();
                break;
            default:
        }
    }
}
