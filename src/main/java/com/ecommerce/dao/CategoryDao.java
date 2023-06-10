package com.ecommerce.dao;

import com.ecommerce.entites.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class CategoryDao {
    private SessionFactory sessionFactory;

    public CategoryDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public int saveCategory(Category category) {
        Integer categoryId = null;
        try {
            Session session = this.sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            categoryId = (int) session.save(category);
            transaction.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return categoryId;
    }

    public List<Category> getCategories() {
        Session session = this.sessionFactory.openSession();
        Query query = session.createQuery("from Category ");
        List<Category> list = query.list();
        return list;
    }




    public Category getCategoryById(int categoryId){
        Category category = null;
        try {
            Session session = this.sessionFactory.openSession();
            category = session.get(Category.class, categoryId);
            session.close();
        }catch (Exception exception){
            exception.printStackTrace();
        }
        return category;
    }








}





