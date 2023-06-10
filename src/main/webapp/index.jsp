<%@ page import="com.ecommerce.helper.FactoryProvider" %>
<%@ page import="com.ecommerce.dao.ProductDao" %>
<%@ page import="com.ecommerce.entites.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.dao.CategoryDao" %>
<%@ page import="com.ecommerce.entites.Category" %>
<%@ page import="com.ecommerce.helper.Helper" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <title>JSP - Hello World</title>
    <%@include file="components/All-Important-link.jsp" %>

</head>
<body>
<jsp:include page="components/Navbar.jsp"/>
<%
    String message = (String) session.getAttribute("noProduct");
    if(message!=null){

//    print
%>
<script>
    swal("Error!", "No Product Found!", "error");
</script>
<%                           session.removeAttribute("noProduct");
}
%>
<div class="row px-3">
    <%
        String categoryId = request.getParameter("category");
        ProductDao productDao = new ProductDao(FactoryProvider.getSessionFactory());
        List<Product> allProducts = null;
        if (categoryId == null || categoryId.trim().equals("all")) {
            allProducts = productDao.getAllProducts();
        } else {
            int categoryid = Integer.parseInt(categoryId.trim());
            allProducts = productDao.getAllProductsById(categoryid);
        }



        CategoryDao categoryDao = new CategoryDao(FactoryProvider.getSessionFactory());
        List<Category> categoryList = categoryDao.getCategories();

    %>
    <div class="col-md-2">
        <div class="list-group">
            <a href="index.jsp?category=all" class="list-group-item active" aria-current="true">All Product</a>

            <%
                for (Category category : categoryList) {%>
            <a href="index.jsp?category=<%=category.getCategoryId()%>" class="list-group-item list-group-item-action"><%=category.getCategoryTitle()%>
            </a>

            <% }
            %>
        </div>
    </div>
    <div class="col-md-8">
        <div class="row">
            <div class="com-md-12">
                <div class="card-columns">
                <%
                    for (Product product: allProducts ) {%>
                <div class="card" style="width: 18rem;">
                 <img src="images/products/<%=product.getProductPhoto()%>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5><%=product.getProductName()%></h5>
                        <p class="card-text"><%=Helper.get20Word(product.getProductDescription())%></p>

                        <p><%=product.getProductPhoto()%></p>
                    </div>
                    <div class="footer">
                        <div class="container ">
                            <a id="cart" class="btn btn-success" onclick="add_to_cart(<%=product.getProductId()%>,'<%=product.getProductName()%>',<%=product.getPriseAfterDiscount()%>)" > Add to Cart</a>
                            <a class="btn btn-danger "><del><%=product.getProductPrice()%></del> <%=product.getPriseAfterDiscount()%>&#2547; <span class="text-secondary discount-text"> <%=product.getProductDiscount()%>% Discount</span></a>
                      </div>
                    </div>
                </div>



                  <%}
                    if (allProducts.size() == 0){
                        session.setAttribute("noProduct","No Product Found");
                        response.sendRedirect("index.jsp");
                    }

                %>
                </div>
            </div>
        </div>
    </div>
</div>
<h2>Hello World</h2>
</body>
</html>