package com.ecommerce.dao;

import com.ecommerce.entites.User;
import com.ecommerce.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory sessionFactory;

    public UserDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public User getUserEmailAndPassword(String email,String password){
        User user = null;
         try {
             String query = "from User  where userEmail =: email and userPassword =: password";
             Session session = this.sessionFactory.openSession();
             Query q = session.createQuery(query);
             q.setParameter("email",email);
             q.setParameter("password",password);
             user = (User) q.uniqueResult();
             session.close();
         }catch (Exception e){
             e.printStackTrace();
         }

         return user;
    }
}
