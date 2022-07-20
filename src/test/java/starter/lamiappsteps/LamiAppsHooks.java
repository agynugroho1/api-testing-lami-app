package starter.lamiappsteps;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import net.serenitybdd.rest.SerenityRest;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

public class LamiAppsHooks {
    @Before
    public void beforeScenario(){
        RestAssured.baseURI = "http://3.88.194.152:80";
    }

    @Before("@MustLogin")
    public void beforeActivities(){
        File file = new File("src/test/resources/payload/login/login-success.json");
        Response response = SerenityRest.given().header("Content-type", "application/json")
                .body(file)
                .post("/login");
        JsonPath jsonPath = response.jsonPath();
        String token = jsonPath.get("data.token");
        File inputFile = new File("src/test/resources/bearer/bearer-login.txt");
        File tempFile = new File("src/test/resources/bearer/tempFile");
        try {
            BufferedReader reader = new BufferedReader(new FileReader(inputFile));
            BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));
            String lineToRemove = Files.readAllLines(Paths.get("src/test/resources/bearer/bearer-login.txt")).get(0);

            String currentLine;

            while ((currentLine = reader.readLine()) != null) {
                // trim newline when comparing with lineToRemove
                String trimmedLine = currentLine.trim();
                if (trimmedLine.equals(lineToRemove)) continue;
                writer.write(currentLine + System.getProperty("line.separator"));
            }
            writer.write(token);
            writer.close();
            reader.close();
            boolean successful = tempFile.renameTo(inputFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Before("@MustLoginAdmin")
    public void beforeAdminActivities(){
        File file = new File("src/test/resources/payload/login/login-admin.json");
        Response response = SerenityRest.given().header("Content-type", "application/json")
                .body(file)
                .post("/login");
        JsonPath jsonPath = response.jsonPath();
        String token = jsonPath.get("data.token");
        File inputFile = new File("src/test/resources/bearer/bearer-admin.txt");
        File tempFile = new File("src/test/resources/bearer/tempFile");
        try {
            BufferedReader reader = new BufferedReader(new FileReader(inputFile));
            BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));
            String lineToRemove = Files.readAllLines(Paths.get("src/test/resources/bearer/bearer-admin.txt")).get(0);

            String currentLine;

            while ((currentLine = reader.readLine()) != null) {
                // trim newline when comparing with lineToRemove
                String trimmedLine = currentLine.trim();
                if (trimmedLine.equals(lineToRemove)) continue;
                writer.write(currentLine + System.getProperty("line.separator"));
            }
            writer.write(token);
            writer.close();
            reader.close();
            boolean successful = tempFile.renameTo(inputFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @After
    public void afterScenario(){
        LamiApp.fileToken = null;
        LamiApp.line = null;
    }
}
