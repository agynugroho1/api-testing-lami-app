package starter.lamiappsteps;

import io.cucumber.java.en.When;

public class ProductStepdefs {

    LamiApp lamiApp = new LamiApp();

    @When("I send {string} with data {string} is {string}, {string} is {string}, {string} is {string}, {string} is {string}, and {string} is {string}")
    public void iSendWithDataIsIsIsIsAndIs(String type, String keyImage, String valImage, String keyName, String valName, String keyDetails, String valDetails, String keyPrice, String valPrice, String keyStock, String valStock) {
        if (type.contains("POST")) {
            lamiApp.posAddProduct(keyImage, valImage, keyName, valName, keyDetails, valDetails, keyPrice, valPrice, keyStock, valStock);
        } else {
            lamiApp.putUpdateProduct(keyImage, valImage, keyName, valName, keyDetails, valDetails, keyPrice, valPrice, keyStock, valStock);
        }
    }

    @When("I send GET Request for list product with query {string} is {string} and {string} is {string}")
    public void iSendGETRequestForListProductWithQueryIsAndIs(String query, String val, String query1, String val1) {
        lamiApp.getListProduct(query, val, query1, val1);
    }

    @When("I send GET Request for detail product with path {string}")
    public void iSendGETRequestForDetailProductWithPath(String path) {
        lamiApp.getDetailProduct(path);
    }

    @When("I send GET Request for my product")
    public void iGETRequestForMyProduct() {
        lamiApp.getMyProduct();
    }

    @When("I send DELETE Request for delete product")
    public void iSendDELETERequestForDeleteProduct() {
        lamiApp.deleteMyProduct();
    }

    @When("I send POST Request for add rating product")
    public void iSendPOSTRequestForAddRatingProduct() {
        lamiApp.postAddRating();
    }

    @When("I send GET Request for rating my product")
    public void iSendGETRequestForRatingMyProduct() {
        lamiApp.getRating();
    }
}
