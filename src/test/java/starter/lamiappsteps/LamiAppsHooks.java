package starter.lamiappsteps;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import net.serenitybdd.rest.SerenityRest;
import org.json.JSONObject;

import java.io.*;

public class LamiAppsHooks {
    @Before
    public void beforeScenario(){
        RestAssured.baseURI = "http://3.88.194.152:80";
    }

    @Before("@MustLogin")
    public void beforeActivities(){
        String path = "src/test/resources/payload/login/login-success.json";
        File file = new File(String.format(path));
        Response response = SerenityRest.given().header("Content-type", "application/json")
                .body(file)
                .post("/login");
        JsonPath jsonPath = response.jsonPath();
        LamiApp.token = jsonPath.get("data.token");
    }

    @Before("@MustLoginAdmin")
    public void beforeAdminActivities(){
        File file = new File("src/test/resources/payload/login/login-admin.json");
        Response response = SerenityRest.given().header("Content-type", "application/json")
                .body(file)
                .post("/login");
        JsonPath jsonPath = response.jsonPath();
        LamiApp.token = jsonPath.get("data.token");
    }

    @Before("@ForDelete")
    public void accountForDelete(){
        File file = new File("src/test/resources/payload/login/login-for-delete.json");
        Response response = SerenityRest.given().header("Content-type", "application/json")
                .body(file)
                .post("/login");
        JsonPath jsonPath = response.jsonPath();
        LamiApp.token = jsonPath.get("data.token");
    }

    @Before("@InvalidToken")
    public void invalidToken(){
        LamiApp.token = "invalid16348923702730oyh9y9800dkljdjdzfs";
    }

    @Before("@MustLoginUMKM")
    public void accountUMKM(){
        JSONObject json = new JSONObject();
        json.put("email", "rizqi2@mail.com");
        json.put("password", "1234");
        Response response = SerenityRest.given().header("Content-type", "application/json")
                .body(json.toString())
                .post("/login");
        JsonPath jsonPath = response.jsonPath();
        LamiApp.token = jsonPath.get("data.token");
    }

    @After
    public void afterScenario(){
        LamiApp.isToken = false;
    }
}
