package starter.lamiappsteps;

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

    @When("I send POST Request for create culture with {string} is {string}, {string} is {string}, {string} is {string}, {string} is {string}")
    public void iSendPOSTRequestForCreateCultureWithIsIsIsIs(String keyName, String valName, String keyImage, String valImage, String keyCity, String valCity, String keyDetails, String valDetails) {
        lamiApp.postCultures(keyName, valName, keyImage, valImage, keyCity, valCity, keyDetails, valDetails);
    }
}
