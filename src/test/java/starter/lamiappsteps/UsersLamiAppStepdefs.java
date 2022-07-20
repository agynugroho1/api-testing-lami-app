package starter.lamiappsteps;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.io.File;
import java.util.List;
import java.util.Map;

import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;
import static net.serenitybdd.rest.SerenityRest.restAssuredThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.equalTo;

public class UsersLamiAppStepdefs {

    LamiApp lamiapp = new LamiApp();


    @Given("I set Bearer Token with {string} which is in line {int}")
    public void iSetBearerTokenWith(String token, int line) {
        LamiApp.fileToken = "src/test/resources/bearer/"+token;
        LamiApp.line = line-1;
    }

    @When("I send {string} request for profile user")
    public void iSendRequestForProfileUser(String type) {
        switch (type.toLowerCase()){
            case "get" :
                lamiapp.getProfileUser();
                break;
            case "post" :
                break;
            case "delete" :
                lamiapp.deleteProfileUser();
                break;
            default:
        }
    }

    @Then("Response code is {int}")
    public void responseCodeIs(int status) {
        restAssuredThat(validatableResponse -> validatableResponse.statusCode(status));
    }

    @And("Response body should be with jsonSchema {string}")
    public void responseBodyShouldBeWithJsonSchema(String file) {
        String path = "schema/"+file;
        restAssuredThat(validatableResponse -> validatableResponse.assertThat().body(matchesJsonSchemaInClasspath(path)));
    }

    @And("Response body with jsonPath {string} should be equal {string}")
    public void responseBodyWithJsonPathShouldBeEqual(String actualRole, String expectedRole) {
        restAssuredThat(validatableResponse -> validatableResponse.body(actualRole, containsString(expectedRole)));
    }

    @When("I send PUT request for profile user with data {string} is {string}, {string} is {string}, {string} is {string}, and {string} is {string}")
    public void iSendPUTRequestForProfileUserWithDataIsIsIsAndIs(String keyImage, String valueImage, String keyName, String valueName, String keyEmail, String valueEmail, String keyPassword, String valuePassword) {
        lamiapp.putProfileUser(keyImage, valueImage, keyName, valueName, keyEmail, valueEmail, keyPassword, valuePassword);
    }
}
