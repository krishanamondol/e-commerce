package com.ecommerce.servlet;

import com.ecommerce.dao.CategoryDao;
import com.ecommerce.dao.ProductDao;
import com.ecommerce.entites.Category;
import com.ecommerce.entites.Product;
import com.ecommerce.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet(name = "ProductOperationServlet", value = "/ProductOperation")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Product Operation Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            String operation = request.getParameter("operation");
            HttpSession session = request.getSession();
            if (operation.trim().equals("addCategory")) {
                String Title = request.getParameter("categoryTitle");
                String Description = request.getParameter("categoryDescription");
                Category category = new Category();
                category.setCategoryTitle(Title);
                category.setCategoryDescription(Description);
                CategoryDao dao = new CategoryDao(FactoryProvider.getSessionFactory());
                Integer categoryID = dao.saveCategory(category);

                if (categoryID != null) {
                    session.setAttribute("success", "data-insert");
                    response.sendRedirect("Admin.jsp");
                } else if (categoryID == null) {
                    session.setAttribute("error", "error");
                    response.sendRedirect("Admin.jsp");
                }


            } else if (operation.trim().equals("addProduct")) {
                String productName = request.getParameter("productName");
                String productDescription = request.getParameter("productDescription");
                int productPrise = Integer.parseInt(request.getParameter("productPrise"));
                int productDiscount = Integer.parseInt(request.getParameter("productDiscount"));
                int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
                int categoryID = Integer.parseInt(request.getParameter("categoryID"));
                Part part = request.getPart("productPicture");
                Product product = new Product();
                product.setProductName(productName);
                product.setProductDescription(productDescription);
                product.setProductPrice(productPrise);
                product.setProductDiscount(productDiscount);
                product.setProductQuantity(productQuantity);
                product.setProductPhoto(part.getSubmittedFileName());
                //get CategoryById
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getSessionFactory());
                Category category = categoryDao.getCategoryById(categoryID);
                product.setCategory(category);
//              product save
                ProductDao productDao = new ProductDao(FactoryProvider.getSessionFactory());
                boolean f = productDao.saveProduct(product);
//                set discount prise
                int newPrise =  productDao.calculateDiscountPercentage(productPrise,productDiscount);
//                String path = "C:\\apache-tomcat-10.0.26\\webapps\\E_Commerce_war\\images\\products"+File.separator+part.getSubmittedFileName();
//                String path = getServletContext().getRealPath("images")+File.separator+"products"+File.separator+part.getSubmittedFileName();
                String path = "C:\\Java Project\\E-Commerce\\target\\E-Commerce-1.0-SNAPSHOT\\images\\products" + File.separator + part.getSubmittedFileName();
                System.out.println("This is path " + path);
                InputStream inputStream = null;
                FileOutputStream fileOutputStream = null;
                try {
                    fileOutputStream = new FileOutputStream(path);
                    inputStream = part.getInputStream();
                    byte[] data = new byte[inputStream.available()];
                    inputStream.read(data);
                    fileOutputStream.write(data);


                } catch (Exception exception) {
                    exception.printStackTrace();
                } finally {
                    inputStream.close();
                    fileOutputStream.close();
                }
                if (f) {
                    session.setAttribute("addProduct", "data-insert");
                    response.sendRedirect("Admin.jsp");
                } else {
                    session.setAttribute("errorProduct", "error");
                    response.sendRedirect("Admin.jsp");
                }
                out.println("Product save Successfully");
            }
            out.println("</body>");
            out.println("</html>");
        }

    }
}

