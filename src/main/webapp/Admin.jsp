<%@ page import="com.ecommerce.entites.User" %>
<%@ page import="com.ecommerce.entites.Category" %>
<%@ page import="com.ecommerce.dao.CategoryDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.helper.FactoryProvider" %>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "you are not log in ");
        response.sendRedirect("Login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "you are normal , not admin");
            response.sendRedirect("Login.jsp");
            return;
        }
    }

%>

<html>
<head>
    <%@include file="components/All-Important-link.jsp" %>
    <title>Title</title>
</head>
<body>
<jsp:include page="components/Navbar.jsp"/>
<div class="container admin">
    <div class="row mt-3 ">
        <div class="col-md-4">
            <div class="card  text-center">
                <div class="card-body">
                    <div class="container">
                        <img src="images/user-line.svg" style="max-width: 150px" class="img-fluid">
                    </div>
                    <h1>User : 3423</h1>
                </div>
            </div>
        </div>
        <div class="col-md-4 ">
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img src="images/arrow-up-double-line.svg" class="img-fluid " style="max-width:150px">
                    </div>

                    <h1>Category :44 </h1>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <div class="container">
                        <img src="images/product-hunt-line.svg" class="img-fluid" style="max-width: 150px">

                    </div>
                    <h1>Products</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-6">
            <div class="card text-center" data-toggle="modal" data-target="#exampleModal">
                <div class="card-body">
                    <div class="container">
                        <img src="images/add-circle-fill.svg" class="img-fluid" style="max-width: 150px">
                    </div>
                    <h1>Add Category</h1>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card text-center" data-toggle="modal" data-target="#addProduct">
                <div class="card-body">
                    <div class="container">
                        <img src="images/file-add-fill.svg" class="img-fluid" style="max-width: 150px">
                    </div>
                    <h1>Add Products</h1>
                </div>
            </div>
        </div>
    </div>
</div>








<%-----------Modal Start For Add Category -----------%>
<div class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content bg-success">
            <div class="modal-header ">
                <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body ">
                <form action="ProductOperation" method="post">
                    <div class="form-group">
                        <input type="hidden" value="addCategory" name="operation">
                        <input name="categoryTitle" id="title" type="text" id="form3Example1"
                               class="form-control bg-danger text-white" placeholder="Enter Title"/>
                        <textarea name="categoryDescription" id="CategoryDescription"
                                  class="form-control bg-danger text-white" cols="3"
                                  style="min-width: 300px; min-height: 150px;margin-top: 10px"
                                  placeholder="Enter CategoryDescription"></textarea>
                    </div>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-success  btn-danger">Add Category</button>
                    </div>
                </form>
            </div>

            <br>
        </div>
    </div>
</div>

<%

    String green = (String) session.getAttribute("success");
    if (green != null) {
%>
<script>
    swal("Success!", "You Created Category !", "success");
</script>

<%
        session.removeAttribute("success");
    }
%>

<%

    String error = (String) session.getAttribute("error");
    if (error != null) {
%>
<script>
    swal("Error!", "Something Went Wrong !", "error");
</script>

<%
        session.removeAttribute("error");
    }
%>
<%-----------------Modal Close----------------%>

<%--------------------Mondal Start For Add Product ----------------------%>

<div class="modal fade" id="addProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-primary">
            <div class="modal-header text-center">
                <h2 class="text-success">Add Product Modal</h2>
            </div>
            <div class="modal-body">
                <form action="ProductOperation" method="post" enctype="multipart/form-data">
                    <input type="hidden" value="addProduct" name="operation">
                    <%--                    add product title--%>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Enter Product Name" name="productName"/>
                    </div>
                    <%--                        product description --%>
                    <div class="form-group">
                        <textarea class="form-control" name="productDescription"></textarea>
                    </div>
                    <%--                        product prise--%>
                    <div class="form-group">
                        <input type="number" class="form-control" placeholder="Enter Product Prise"
                               name="productPrise"/>
                    </div>
                    <%--                        product discount prise--%>
                    <div class="form-group">
                        <input type="number" class="form-control" placeholder="Enter Product Discount Prise"
                               name="productDiscount"/>
                    </div>
                    <%--                        product quantity --%>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Enter Product Quantity"
                               name="productQuantity"/>
                    </div>
                    <%--                        product category --%>
                    <%
                        CategoryDao dao = new CategoryDao(FactoryProvider.getSessionFactory());
                        List<Category> list = dao.getCategories();
                    %>
                    <div class="from-group">
                        <select name="categoryID" class="from-control">
                            <%
                                for (Category c : list) {


                            %>
                            <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle() %>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="from-group">
                        <input type="file" name="productPicture " required/>
                    </div>
                    <div class="container text-center bg-success">
                        <button type="submit" class="btn btn-primary ms-4">Save Change</button>
                        <button type="button" class="btn btn-secondary me-5" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>



<%

    String addProduct = (String) session.getAttribute("addProduct");
    if (addProduct != null) {
%>
<script>
    swal("Success!", "You Added Product !", "success");
</script>

<%
        session.removeAttribute("addProduct");
    }
%>

<%

    String errorProduct = (String) session.getAttribute("errorProduct");
    if (errorProduct != null) {
%>
<script>
    swal("Error!", "Something Went Wrong !", "error");
</script>

<%
        session.removeAttribute("errorProduct");
    }
%>
<%--------------------Mondal Close For Add Product ----------------------%>

</body>
</html>
