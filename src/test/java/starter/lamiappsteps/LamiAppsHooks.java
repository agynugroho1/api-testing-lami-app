package starter.lamiappsteps;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.restassured.RestAssured;

public class LamiAppsHooks {
    @Before
    public void beforeScenario(){
        RestAssured.baseURI = "http://3.88.194.152:80";
    }
    @After
    public void afterScenario(){
        LamiApp.fileToken = null;
        LamiApp.line = null;
    }
}
