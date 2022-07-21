package starter.lamiappsteps;

import io.cucumber.java.en.And;
import io.cucumber.java.en.When;

import static net.serenitybdd.rest.SerenityRest.restAssuredThat;

public class CulturesStepdefs {

    LamiApp lamiApp = new LamiApp();

    @When("I send GET Request to List Culture with query {string} is {string} and {string} is {string}")
    public void iSendGETRequestToListCultureWithQueryIsAndIs(String page, String valPage, String limit, String valLimit){
        lamiApp.getListCultures(page, valPage, limit, valLimit);
    }

    @When("I send GET Request for culture detail using path {string}")
    public void iSendGETRequestForCultureDetailUsingPath(String path) {
        lamiApp.getCultureDetails(path);
    }

    @When("I send {string} culture with {string} is {string}, {string} is {string}, {string} is {string}, {string} is {string}")
    public void iSendPOSTRequestForCreateCultureWithIsIsIsIs(String type, String keyName, String valName, String keyImage, String valImage, String keyCity, String valCity, String keyDetails, String valDetails) {
        if (type.contains("POST")){
            lamiApp.postCultures(keyName, valName, keyImage, valImage, keyCity, valCity, keyDetails, valDetails);
        } else {
            lamiApp.putCultures(keyName, valName, keyImage, valImage, keyCity, valCity, keyDetails, valDetails);
        }

    }

    @And("I set path {string}")
    public void iSetPath(String arg0) {
        LamiApp.wpath = arg0;
    }

    @When("I send DELETE Request culture")
    public void iSendDELETERequestCulture() {
        lamiApp.deleteCulture();
    }

    @When("I POST request for report culture with message is {string}")
    public void iPOSTRequestForReportCultureWithMessageIs(String arg0) {
        lamiApp.postReportCulture(arg0);
    }

    @When("I GET Request for report cultures")
    public void iGETRequestForReportCultures() {
        lamiApp.getReportCulture();
    }
}
