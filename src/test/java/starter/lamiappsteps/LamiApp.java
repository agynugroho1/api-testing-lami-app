package starter.lamiappsteps;

import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import net.serenitybdd.rest.SerenityRest;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

public class LamiApp {
    public static String fileToken;
    public static Integer line;
    File bodys;

    public RequestSpecification setBearerToken() {
        String data = "";
        try {
            data = Files.readAllLines(Paths.get(fileToken)).get(line);
            return SerenityRest.given().header("Authorization", "Bearer "+data).body("");
        } catch (IOException | NullPointerException e) {
            return SerenityRest.given();
        }
    }

    public void getProfileUser() {
        Response response = (Response) setBearerToken().get("/users").getBody();
        response.prettyPrint();
    }

    public RequestSpecification bodyPutProfileUser(File body) {
        bodys = body;
        return setBearerToken().header("Content-type", "application/json")
                .body(body);
    }

    public void putProfileUser() {
        Response response = (Response) bodyPutProfileUser(bodys).put("/users");
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
}
