package starter.lamiappsteps;

import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import net.serenitybdd.rest.SerenityRest;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

public class LamiApp {

    public static Boolean isToken = false;
    public static String token;
    public static String wpath;

    public RequestSpecification setBearerToken() {
        if (!isToken) {
            return SerenityRest.given();
        } else {
            return SerenityRest.given().header("Authorization", "Bearer " + token);
        }
    }

    public void getProfileUser() {
        Response response = (Response) setBearerToken().get("/users").getBody();
        response.prettyPrint();
    }

    public void putProfileUser(String keyImage, String valueImage, String keyName, String valueName, String keyEmail, String valueEmail, String keyPassword, String valuePassword) {
        if (valueImage.isEmpty()) {
            Response response = setBearerToken().multiPart(keyName, valueName)
                    .formParams(keyEmail, valueEmail)
                    .formParams(keyPassword, valuePassword)
                    .put("/users");
            response.prettyPrint();
        } else {
            String path = "src/test/resources/payload/" + valueImage;
            File file = new File(String.format(path));
            Response response = setBearerToken().multiPart(keyImage, file)
                    .formParams(keyName, valueName)
                    .formParams(keyEmail, valueEmail)
                    .formParams(keyPassword, valuePassword)
                    .put("/users");
            response.prettyPrint();
        }

    }

    public void deleteProfileUser() {
        Response response = (Response) setBearerToken().delete("/users");
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

    public void postUpgradeAccount(String keyStoreName, String valueStoreName, String keyOwner, String valueOwner, String keyPhone, String valuePhone, String keyAddress, String valueAddress, String keyCity, String valueCity, String keyDocument, String valueDocument) {
        String path = "src/test/resources/payload/pdf-test.pdf";
        File file = new File(String.format(path));
        Response response = setBearerToken().multiPart(keyDocument, file)
                .formParams(keyStoreName, valueStoreName)
                .formParams(keyOwner, valueOwner)
                .formParams(keyPhone, valuePhone)
                .formParams(keyAddress, valueAddress)
                .formParams(keyCity, valueCity)
                .post("/users/stores");
        response.prettyPrint();
    }

    public void getListCultures(String page, String valPage, String limit, String valLimit) {
        setBearerToken().get("/cultures?" + page + "=" + valPage + "&" + limit + "=" + valLimit).getBody();
    }

    public void getCultureDetails(String path) {
        setBearerToken().get("/cultures" + path).getBody();
    }

    public void postCultures(String keyName, String valName, String keyImage, String valImage, String keyCity, String valCity, String keyDetails, String valDetails) {
        if (valImage.isEmpty()) {
            Response response = setBearerToken().multiPart(keyName, valName)
                    .formParams(keyCity, valCity)
                    .formParams(keyDetails, valDetails)
                    .post("/cultures");
            response.prettyPrint();
        } else {
            String path = "src/test/resources/payload/" + valImage;
            File file = new File(String.format(path));
            Response response = setBearerToken().multiPart(keyImage, file)
                    .formParams(keyName, valName)
                    .formParams(keyCity, valCity)
                    .formParams(keyDetails, valDetails)
                    .post("/cultures");
            response.prettyPrint();
        }
    }

    public void GetListSubmission(String page, String valPage, String limit, String valLimit) {
        Response response = (Response) setBearerToken().get("/stores/submissions?" + page + "=" + valPage + "&" + limit + "=" + valLimit).getBody();
        response.prettyPrint();
    }

    public void PutUpdateUserStore(String valUser) {
        File bodyUpdateUserStore = new File("src/test/resources/payload/submission/put-update-store.json");
        setBearerToken()
                .header("Content-type", "application/json")
                .body(bodyUpdateUserStore)
                .put("/stores/submissions/" + valUser);
    }

    public void GetListEvent(String page, String valPage, String limit, String valLimit) {
        Response response = (Response) setBearerToken().get("/events/submissions?" + page + "=" + valPage + "&" + limit + "=" + valLimit).getBody();
        response.prettyPrint();
    }

    public void GetDetailEventID(String ID) {
        Response response = (Response) setBearerToken().get("/events/submissions/"+ID).getBody();
        response.prettyPrint();
    }

    public void putCultures(String keyName, String valName, String keyImage, String valImage, String keyCity, String valCity, String keyDetails, String valDetails) {
        if (valImage.isEmpty()) {
            Response response = setBearerToken().multiPart(keyName, valName)
                    .formParams(keyCity, valCity)
                    .formParams(keyDetails, valDetails)
                    .put("/cultures" + wpath);
            response.prettyPrint();
        } else {
            String path = "src/test/resources/payload/" + valImage;
            File file = new File(String.format(path));
            Response response = setBearerToken().multiPart(keyImage, file)
                    .formParams(keyName, valName)
                    .formParams(keyCity, valCity)
                    .formParams(keyDetails, valDetails)
                    .put("/cultures" + wpath);
            response.prettyPrint();
        }
    }

    public void deleteCulture() {
        Response response = setBearerToken().delete("/cultures" + wpath);
        response.prettyPrint();
    }

    public void postReportCulture(String path) {
        File file = new File("src/test/resources/payload/" + path);
        Response response = setBearerToken().contentType("application/json")
                .body(file)
                .post("/cultures/reports" + wpath);
        response.prettyPrint();
    }

    public void getReportCulture() {
        Response response = setBearerToken().get("/cultures/reports" + wpath);
        response.prettyPrint();
    }

    public void PutUpdateEventID(String updateEventID) {
        File bodyUpdateEventID = new File("src/test/resources/payload/submission/put-update-eventid.json");
        setBearerToken()
                .header("Content-type", "application/json")
                .body(bodyUpdateEventID)
                .put("/events/submissions/" + updateEventID);
    }

    public void GetDetEventID(String eventID) {
        Response response = (Response) setBearerToken().get("/events/"+eventID).getBody();
        response.prettyPrint();

    }

    public void GetEventList(String page, String valPage, String limit, String valLimit, String name, String valName, String city, String valCity) {
        Response response = (Response) setBearerToken().get("/events?" + limit + "=" + valLimit + "&" + page + "=" + valPage + "&" + name + "=" + valName+ "&" + city + "=" + valCity).getBody();
        response.prettyPrint();
    }

    public void getEventsParticipations(){
        setBearerToken().get("/events/participations");
    }

    public void PostCreateEvent(String image, String falImage, String doc, String falDoc, String name, String falName, String hostedBy, String falHostedBy, String phone, String falPhone, String startDate, String falStartDate, String endDate, String falEndDate, String city, String falCity, String location, String falLoc, String details, String falDetails, String price, String falPrice) {
        String pathimg = "src/test/resources/payload/" + falImage;
        File fileimage = new File(String.format(pathimg));

        String pathdoc = "src/test/resources/payload/" + falDoc;
        File filedoc = new File(String.format(pathdoc));

        if (falImage.isEmpty()){
            if (falDoc.isEmpty()){
                Response response = setBearerToken().formParams(name, falName)
                        .formParams(hostedBy, falHostedBy)
                        .formParams(phone, falPhone)
                        .formParams(startDate, falStartDate)
                        .formParams(endDate, falEndDate)
                        .formParams(city, falCity)
                        .formParams(location, falLoc)
                        .formParams(details, falDetails)
                        .formParams(price, falPrice)
                        .post("/events");
                response.prettyPrint();
            }else {
                    Response response = setBearerToken().multiPart(doc,filedoc)
                            .formParams(name, falName)
                            .formParams(hostedBy, falHostedBy)
                            .formParams(phone, falPhone)
                            .formParams(startDate, falStartDate)
                            .formParams(endDate, falEndDate)
                            .formParams(city, falCity)
                            .formParams(location, falLoc)
                            .formParams(details, falDetails)
                            .formParams(price, falPrice)
                            .post("/events");
                    response.prettyPrint();
                    }
        } else if (falDoc.isEmpty()){

            Response response = setBearerToken().multiPart(image, fileimage)
                    .formParams(name, falName)
                    .formParams(hostedBy, falHostedBy)
                    .formParams(phone, falPhone)
                    .formParams(startDate, falStartDate)
                    .formParams(endDate, falEndDate)
                    .formParams(city, falCity)
                    .formParams(location, falLoc)
                    .formParams(details, falDetails)
                    .formParams(price, falPrice)
                    .post("/events");
            response.prettyPrint();
        } else {
            Response response = setBearerToken().multiPart(image, fileimage)
                    .multiPart(doc,filedoc)
                    .formParams(name, falName)
                    .formParams(hostedBy, falHostedBy)
                    .formParams(phone, falPhone)
                    .formParams(startDate, falStartDate)
                    .formParams(endDate, falEndDate)
                    .formParams(city, falCity)
                    .formParams(location, falLoc)
                    .formParams(details, falDetails)
                    .formParams(price, falPrice)
                    .post("/events");
            response.prettyPrint();
        }
    }

    public void deleteEventID() {
        Response response = setBearerToken().delete("/events" + wpath);
        response.prettyPrint();
    }
}