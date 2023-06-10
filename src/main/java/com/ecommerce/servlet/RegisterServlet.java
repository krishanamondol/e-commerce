package com.ecommerce.servlet;

import com.ecommerce.entites.User;
import com.ecommerce.helper.FactoryProvider;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;

import static com.ecommerce.entites.User.doHashing;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String hashPassword =  doHashing(userPassword);
            String userPhone = request.getParameter("user_phone");
            String user_Address = request.getParameter("user_address");
//            Creating  User Object To Store Date
                User user = new User(userName,userEmail,hashPassword,userPhone,"default.jpg",user_Address,"normal");
                Session hibernateSession = FactoryProvider.getSessionFactory().openSession();
                Transaction transaction = hibernateSession.beginTransaction();
                int userId = (int) hibernateSession.save(user);
                transaction.commit();
                hibernateSession.close();

                HttpSession session = request.getSession();
                session.setAttribute("message","User Registration Successfully "+userId);
                response.sendRedirect("Sign-Up.jsp");
                return;
//                out.println("successfully user save");
//                out.println("<br> User id is "+userId);
            }catch (Exception e){

                e.printStackTrace();
            }
        }
    }






}







