package starter.lamiappsteps;

import io.cucumber.java.en.When;

public class CartStepdefs {

    LamiApp lamiApp = new LamiApp();

    @When("I set POST Request add to cart product with id {int}")
    public void iSetPOSTRequestAddToCartProductWithId(int i) {
        lamiApp.postAddToCart(i);
    }

    @When("I set POST Request add to cart product with id {string}")
    public void iSetPOSTRequestAddToCartProductWithId(String i) {
        lamiApp.postAddToCart(i);
    }

    @When("I set GET Request for list cart")
    public void iSetGETRequestForListCart() {
        lamiApp.getMyCart();
    }

    @When("I set PUT Request for update quantity is {int}")
    public void iSetPUTRequestForUpdateQuantityIs(int i) {
        lamiApp.updateCart(i);
    }

    @When("I set PUT Request for update quantity is {string}")
    public void iSetPUTRequestForUpdateQuantityIs(String i) {
        lamiApp.updateCart(i);
    }

    @When("I send DELETE Request for remove data in cart page")
    public void iSendDELETERequestForRemoveDataInCartPage() {
        lamiApp.deleteCart();
    }
}
