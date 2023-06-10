package com.ecommerce.entites;

import jakarta.persistence.*;
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ProductId;
    private String ProductName;
    @Column(length = 500)
    private String productDescription;
    private String productPhoto;
    private int productPrice;
    private int productDiscount;
    private int productQuantity;
    @ManyToOne
    private Category category;

    public Product() {
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Product(String productName, String productDescription, String productPhoto, int productPrice, int productDiscount, int productQuantity, Category category) {
        ProductName = productName;
        this.productDescription = productDescription;
        this.productPhoto = productPhoto;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.productQuantity = productQuantity;
        this.category = category;
    }

    public Product(int productId, String productName, String productDescription, String productPhoto, int productPrice, int productDiscount, int productQuantity) {
        ProductId = productId;
        ProductName = productName;
        this.productDescription = productDescription;
        this.productPhoto = productPhoto;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.productQuantity = productQuantity;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int productId) {
        ProductId = productId;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String productName) {
        ProductName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductPhoto() {
        return productPhoto;
    }

    public void setProductPhoto(String productPhoto) {
        this.productPhoto = productPhoto;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductDiscount() {
        return productDiscount;
    }

    public void setProductDiscount(int productDiscount) {
        this.productDiscount = productDiscount;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }


    public int getPriseAfterDiscount(){
   int discount = (int) ((this.getProductDiscount() / 100.0 )* this.getProductPrice());
        return this.getProductPrice() - discount;
    }
}


