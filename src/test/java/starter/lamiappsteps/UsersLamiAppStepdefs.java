package starter.lamiappsteps;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.io.File;

import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;
import static net.serenitybdd.rest.SerenityRest.restAssuredThat;
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
            case "put" :
                lamiapp.putProfileUser();
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
        restAssuredThat(validatableResponse -> validatableResponse.body(actualRole, equalTo(expectedRole)));
    }

    @And("I set body with {string}")
    public void iSetBodyWith(String body) {
        String path = "src/test/resources/payload/"+body;
        File file = new File(String.format(path));
        lamiapp.bodyPutProfileUser(file);
    }
}
