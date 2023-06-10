package com.ecommerce.servlet;

import com.ecommerce.dao.UserDao;
import com.ecommerce.entites.Cart;
import com.ecommerce.entites.User;
import com.ecommerce.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "AddToCartServlet", value = "/AddToCartServlet")

public class AddToCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Login  Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            ArrayList<Cart> cartArrayList = new ArrayList<>();
            int productId = Integer.parseInt(request.getParameter("id")) ;
            Cart cart = new Cart();
            cart.setProductId(productId);
            cart.setQuantity(1);
            HttpSession session = request.getSession();
            ArrayList<Cart> carts =(ArrayList<Cart>) session.getAttribute("cartArrayList");
            if (carts == null){
                cartArrayList.add(cart);
                out.println("add the list");
                session.setAttribute("cartArrayList",cartArrayList);

            }else {
                cartArrayList = carts;
                boolean exist = false;
                for (Cart c :carts){
                    if (c.getProductId() == productId){
                        exist = true;
                        out.println("item already exist");
                    }
                }
                if (!exist){
                    cartArrayList.add(cart);
                    response.sendRedirect("index.jsp");
                }
            }
            out.println("</body>");
            out.println("</html>");
        }

    }
}
