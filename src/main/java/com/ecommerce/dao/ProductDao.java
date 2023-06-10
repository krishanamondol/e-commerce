package com.ecommerce.dao;

import com.ecommerce.entites.Cart;
import com.ecommerce.entites.Category;
import com.ecommerce.entites.Product;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import jakarta.servlet.http.HttpServlet;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.mapping.Join;
import org.hibernate.query.Query;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private SessionFactory sessionFactory;
    public ProductDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public boolean saveProduct(Product product){
        boolean f = false;
        try {
            Session session = this.sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            session.save(product);
            transaction.commit();
            session.close();
            f = true;
        }catch (Exception exception){
            exception.printStackTrace();
           f = false;
        }
        return  f;
    }


    public List<Product> getAllProducts(){
        Session session = this.sessionFactory.openSession();
        Query query = session.createQuery("from Product ");
        List<Product> list = query.list();
        return list;
    }

    public List<Product> getAllProductsById(int categoryId){
        Session session = this.sessionFactory.openSession();
        Query query = session.createQuery("from Product as prodcuct where prodcuct .category .categoryId =: id");
        query.setParameter("id",categoryId);
        List<Product> list = query.list();
        return list;
    }


    public static int calculateDiscountPercentage(int originalPrice, int discountedPrice) {
        int discount = originalPrice - discountedPrice;
        int discountPercentage = (discount / originalPrice) * 100;
        return discountPercentage;
    }

    public List<Cart> getCartProduct(ArrayList<Cart>cartArrayList){
        List<Cart> products = new ArrayList<>();
        try {
            if(cartArrayList.size()>0){
                for (Cart item:cartArrayList){
                    String  query = "select * from product where id=?";

                }
            }
        }catch (Exception exception){
            exception.printStackTrace();
        }
        return products;
    }
}
