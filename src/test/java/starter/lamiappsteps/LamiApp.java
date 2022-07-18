package starter.lamiappsteps;

import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import net.serenitybdd.rest.SerenityRest;
import org.json.JSONObject;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

public class LamiApp {

    public static String fileToken;
    public static Integer line;

    public RequestSpecification setBearerToken() {
        String data = "";
        try {
            data = Files.readAllLines(Paths.get(fileToken)).get(line);
            return SerenityRest.given().header("Authorization", "Bearer "+data);
        } catch (IOException | NullPointerException e) {
            return SerenityRest.given();
        }
    }

    public void getProfileUser() {
        Response response = (Response) setBearerToken().get("/users").getBody();
        response.prettyPrint();
    }

    public void putProfileUser(String keyImage, String valueImage, String keyName, String valueName, String keyEmail, String valueEmail, String keyPassword, String valuePassword){
            String path = "src/test/resources/payload/image-profile.png";
            File file = new File(String.format(path));
            Response response = setBearerToken().multiPart(keyImage, file)
                    .formParams(keyName, valueName)
                    .formParams(keyEmail, valueEmail)
                    .formParams(keyPassword, valuePassword)
                    .put("/users");
            response.prettyPrint();
    }

    public void deleteProfileUser() {
        Response response = (Response) setBearerToken().delete("/users");
        if (response.statusCode() == 200) {
            File inputFile = new File(String.format(fileToken));
            File tempFile = new File(String.format(fileToken.replaceAll("bearer-for-delete-user", "tempFile")));

            try {
                BufferedReader reader = new BufferedReader(new FileReader(inputFile));
                BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));
                String lineToRemove = Files.readAllLines(Paths.get(fileToken)).get(line);

                String currentLine;

                while ((currentLine = reader.readLine()) != null) {
                    // trim newline when comparing with lineToRemove
                    String trimmedLine = currentLine.trim();
                    if (trimmedLine.equals(lineToRemove)) continue;
                    writer.write(currentLine + System.getProperty("line.separator"));
                }
                writer.close();
                reader.close();
                boolean successful = tempFile.renameTo(inputFile);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }


    public void postSuccessRegister(String reg) {
        File bodyDataregissucces = new File("src/test/resources/payload/register/REG-success.json");
        SerenityRest.given()
                .header("Content-type", "application/json")
                .body(bodyDataregissucces)
                .post("/" + reg);
    }

    public void postSameEmail(String reg) {
        File bodySameEmail = new File("src/test/resources/payload/register/REG-sameEmail.json");
        SerenityRest.given()
                .header("Content-type", "application/json")
                .body(bodySameEmail)
                .post("/" + reg);
    }

    public void postInvalidEmail(String reg) {
        File bodyInvalidEmail = new File("src/test/resources/payload/register/REG-invalidemail.json");
        SerenityRest.given()
                .header("Content-type", "application/json")
                .body(bodyInvalidEmail)
                .post("/" + reg);
    }

    public void postSpecialCharName(String reg) {
        File bodySpecialChar = new File("src/test/resources/payload/register/REG-specialchar.json");
        SerenityRest.given()
                .header("Content-type", "application/json")
                .body(bodySpecialChar)
                .post("/" + reg);
    }

    public void postNumericName(String reg) {
        File bodyNumericName = new File("src/test/resources/payload/register/REG.numericname.json");
        SerenityRest.given()
                .header("Content-type", "application/json")
                .body(bodyNumericName)
                .post("/" + reg);
    }

    public void postSuccessLogin(String login) {
        File bodyDataLogin = new File("src/test/resources/payload/login/login-success.json");
        SerenityRest.given()
                .header("Content-type", "application/json")
                .body(bodyDataLogin)
                .post("/" + login);
    }

    public void postInvalidEmailLogin(String login) {
        File bodyInvalidEmailLogin = new File("src/test/resources/payload/login/login-invalidemail.json");
        SerenityRest.given()
                .header("Content-type", "application/json")
                .body(bodyInvalidEmailLogin)
                .post("/" + login);
    }

    public void postInvalidPassword(String login) {
        File bodyInvalidPasswordLogin = new File("src/test/resources/payload/login/login-invalidpassword.json");
        SerenityRest.given()
                .header("Content-type", "application/json")
                .body(bodyInvalidPasswordLogin)
                .post("/" + login);
    }

    public void postInvalidData(String login) {
        File bodyInvalidDataLogin = new File("src/test/resources/payload/login/login-invaliddata.json");
        SerenityRest.given()
                .header("Content-type", "application/json")
                .body(bodyInvalidDataLogin)
                .post("/" + login);
    }
}
