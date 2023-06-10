package com.ecommerce.entites;

import jakarta.persistence.*;

import java.security.MessageDigest;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10, name = "user_id")
    private int userId;
    @Column(length = 100, name = "user_name")
    private String userName;
    @Column(length = 100, name = "user_email")
    private String userEmail;
    @Column(length = 100, name = "user_password")
    private String userPassword;
    @Column(length = 12, name = "user_phone")
    private String userPhone;
    @Column(length = 100, name = "user_picture")
    private String userPicture;
    @Column(length = 1500, name = "user_address")
    private String userAddress;
    @Column(length = 50, name = "user_type")
    private String userType;

    public User() {
    }
    public User(String userName, String userEmail, String userPassword, String userPhone, String userPicture, String userAddress,String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPicture = userPicture;
        this.userAddress = userAddress;
        this.userType = userType;
    }

    public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String userPicture, String userAddress,String userType) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPicture = userPicture;
        this.userAddress = userAddress;
        this.userType = userType;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPicture() {
        return userPicture;
    }

    public void setUserPicture(String userPicture) {
        this.userPicture = userPicture;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }
    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }




    public static String doHashing(String password){
        try{
            MessageDigest messageDigest = MessageDigest.getInstance("SHA");
            messageDigest.update(password.getBytes());
            byte [] bytes = messageDigest.digest();
            StringBuilder stringBuilder = new StringBuilder();
            for (byte b : bytes) {
                stringBuilder.append(String.format("%02x",b));
            }
            return stringBuilder.toString();
        }catch (Exception exception){
            exception.printStackTrace();
        }

        return "";
    }


}
