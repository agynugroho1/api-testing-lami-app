package starter.lamiappsteps;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.util.Objects;

import static net.serenitybdd.rest.SerenityRest.restAssuredThat;
import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;
import static net.serenitybdd.rest.SerenityRest.when;
import static org.hamcrest.Matchers.equalTo;

public class RegisterLamiAppStepdefs {

    LamiApp lamiApp = new LamiApp();
    public static String type;

    @When("I send POST request for {string} with data")
    public void iSendPOSTRequestForWithData(String REG) {
        if (Objects.equals(REG, "register")){
            type = REG;
            lamiApp.postSuccessRegister(REG);
        } else if (Objects.equals(REG, "login")) {
            type = REG;
            lamiApp.postSuccessLogin(REG);
        }

    }

    @Then("The response status code {int}")
    public void theResponseStatusCode(int statusCode) {
        restAssuredThat(validatableResponse -> validatableResponse.statusCode(statusCode));
    }

    @And("Return body should be with jsonSchema {string}")
    public void returnBodyShouldBeWithJsonSchema(String File) {
        String path = "schema/"+type+"/"+File;
        restAssuredThat(validatableResponse -> validatableResponse.assertThat().body(matchesJsonSchemaInClasspath(path)));
    }

    @When("I send POST request for {string} with validation {string}")
    public void iSendPOSTRequestForWithValidation(String ket, String validation) {
        if (Objects.equals(ket, "register")) {
            if (Objects.equals(validation, "same email")) {
                lamiApp.postSameEmail(ket);
            } else if (Objects.equals(validation, "invalid email")) {
                lamiApp.postInvalidEmail(ket);
            } else if (Objects.equals(validation, "special char")) {
                lamiApp.postSpecialCharName(ket);
            } else if (Objects.equals(validation, "numeric")) {
                lamiApp.postNumericName(ket);
            }
        } else if (Objects.equals(ket, "login")) {
            if (Objects.equals(validation, "invalid email")) {
                lamiApp.postInvalidEmailLogin(ket);
            } else if (Objects.equals(validation, "invalid password")) {
                lamiApp.postInvalidPassword(ket);
            } else if (Objects.equals(validation, "invalid data")) {
                lamiApp.postInvalidData(ket);
            }
        }
        type = ket;
    }

}
