package com.ecommerce.servlet;

import com.ecommerce.dao.UserDao;
import com.ecommerce.entites.User;
import com.ecommerce.helper.FactoryProvider;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

import static com.ecommerce.entites.User.doHashing;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Login  Servlet</title>");
            out.println("</head>");
            out.println("<body>");
//
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            String takePassword = doHashing(password);
            UserDao dao = new UserDao(FactoryProvider.getSessionFactory());
            User user = dao.getUserEmailAndPassword(email, takePassword);

            HttpSession session = request.getSession();
            if (user == null) {
                session.setAttribute("message", "Invalid Details ! Try with another ");
                response.sendRedirect("Login.jsp");
                    return;
            } else {
                session.setAttribute("current-user",user);
                if (user.getUserType().equals("admin")) {
//                    redirect admin page
                    response.sendRedirect("Admin.jsp");

                } else if (user.getUserType().equals("normal")){
                    response.sendRedirect("Normal.jsp");

               }else {
                    out.println("We have not identified user type");
                }
                out.println("</body>");
                out.println("</html>");
            }

        }
    }
}
