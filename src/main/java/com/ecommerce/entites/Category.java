package com.ecommerce.entites;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
@Entity

public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String categoryTitle;
    private String categoryDescription;

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @OneToMany(mappedBy = "category")
    private List<Product> products = new ArrayList<>();

    public Category() {
    }

    public Category(String categoryTitle, String categoryDescription, List<Product> products) {
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
        this.products = products;
    }

    public Category(int categoryId, String categoryTitle, String categoryDescription,List<Product> products) {
        this.categoryId = categoryId;
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
        this.products = products;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTitle() {
        return categoryTitle;
    }

    public void setCategoryTitle(String categoryTitle) {
        this.categoryTitle = categoryTitle;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }
}
