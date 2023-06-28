<%@ page import="com.ecommerce.entites.User" %><%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/6/2023
  Time: 2:55 PM
  To change this template use File | Settings | File Templates.
--%>

<%
    User usernav = (User) session.getAttribute("current-user");
%>


<section id="header">
    <nav class="navbar navbar-expand-lg ">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <img src="./images/favicon.png" class="img-fluid" alt="nav-img">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class=" navbar-toggler-icon"><img src="./images/menu-fill.png" alt="menu-img"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav  mr-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#products">Products Page</a>
                    </li>
                    <li class="nav-item">
                    <li class="nav-item">
                        <a class="nav-link" href="#testimonial">Testimonials</a>
                    </li>
                </ul>

                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#cart-item"><i
                                class="ri-shopping-cart-line" style="font-size: 22px"><span style="font-size: 22px"
                                                                                            class="cart-items">{}</span>
                        </i></a>
                    </li>
                    <%
                        if (usernav != null) {
                    %>
                    <li class="nav-item">
                        <a class="nav-link " href="LogOutServlet"> Log Out </a>
                    </li>

                    <% } else {%>
                    <li class="nav-item">
                        <a class="nav-link " href="Sign-Up.jsp" style="text-decoration: none"> Sign UP</a>
                    </li>
                    <% }
                    %>
                </ul>

            </div>
        </div>
    </nav>
</section>


<!-- Cart Modal -->
<div class="modal fade" id="cart-item" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="head text-center"><h1 class="text-center">YOUR CART</h1></div>

            </div>
            <div class="modal-body">

                <div class="card-body">

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary check-out-btn">Check Out</button>
            </div>
        </div>
    </div>
</div>
<script defer>

    function add_to_cart(productsId, productsName, productsPrise) {
        let cart = localStorage.getItem("cart");
        if (cart == null) {
            let products = [];
            let product = {
                productId: productsId,
                productName: productsName,
                productPrise: productsPrise,
                productQuantity: 1
            }
            products.push(product);
            localStorage.setItem("cart", JSON.stringify(products))
            console.log("product added for first time")
        } else {
            let productCart = JSON.parse(cart);
            let oldProduct = productCart.find((item) => item.productId === productsId)
             console.log(oldProduct)
            if (oldProduct) {
                oldProduct.productQuantity = oldProduct.productQuantity + 1;
                productCart.map((item) => {
                    if (item.productId === oldProduct.productId) {
                        item.productQuantity = oldProduct.productQuantity;
                    }
                })
                localStorage.setItem("cart", JSON.stringify(productCart));
                console.log("product quantity is increases")
            } else {
                let product = {
                    productId: productsId,
                    productName: productsName,
                    productPrise: productsPrise,
                    productQuantity: 1
                }
                productCart.push(product);
                localStorage.setItem("cart", JSON.stringify(productCart))
                console.log("product added for second  time")
            }

        }  // this is else section bracket


    }  //this is function bracket


    // update cart
    function updateCart() {
        let cartString = localStorage.getItem("cart");
        let cart = JSON.parse(cartString);
        if (cart == null) {
            console.log("cart is empty  & update cart method");
            $(".cart-items").html("{ 0 }");
            $(".card-body").html('<p>No Cart Item Found</p>');
            $(".check-out-btn").addClass('btn btn-danger');
        } else {
             // console.log(cart)

            cart.map(arr => {
                console.log(arr)

            })
            $(".cart-items").html(${('cart.length')}) ;
            let table = `
            <table class ='table'>
            <thread class ='thread-light'>
            <tr>
            <th> Item Name</th>
            <th> Price</th>
            <th> Quantity</th>
            <th> Total Prise</th>
            <th> Action</th>
            </tr>
            </thread>


            `


            cart.map((data) => {
                // console.log(item);

                table +=`<tr>
                <td> $({data:cart.productName}) <p>Acer Aspair 5 515 i3 11th gen windows 11 </p></td>
                <td> ${item.productsPrise} </td>
                <td> ${item.productQuantity} </td>
                <td> ${item.productQuantity * productPrise} </td>
               </tr>`
            });

            table = table + ' </table>';
            $(".card-body").html(table);
        }
    }

    $(document).ready(function () {
        console.log("ready!");
        updateCart();
    });
</script>




