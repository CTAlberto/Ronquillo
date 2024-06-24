package com.dev.ronquillo.services;

import com.dev.ronquillo.entity.Product;
import com.dev.ronquillo.repository.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProductServices {

    @Autowired
    protected ProductRepo productRepo;

    @Value("${APP_USERNAME}")
    private String appUsername;

    @Value("${APP_PASSWORD}")
    private String appPassword;

    public void addProduct(String name, String type, double quantity, String description, String quantityType){
        productRepo.addProduct(name, type, quantity, description, quantityType);
    }

    public boolean userValidation(String username, String password) {
        return username.equals(appUsername) && password.equals(appPassword);
    }
    public void modifyQuantity(int id, double quantity) {
        productRepo.modifyQuantity(id, quantity);
    }
    public void updateProduct(int id) {
        System.out.println("Product updated");
        productRepo.updateProduct(id);
    }

    public List<Product> listProducts(String type) {
        System.out.println("Product listed");
        return productRepo.listProducts(type);
    }
    public void activateProduct(int id) {
        productRepo.activateProduct(id);
    }
    public void deactivateProduct(int id) {
        productRepo.deactivateProduct(id);
    }
    public void addFavourite(int id) {
        productRepo.addFavourite(id);
    }
    public void quitFavourite(int id) {
        productRepo.quitFavourite(id);
    }
    public List<Product> searchProduct(String name) {
        return productRepo.searchProduct(name);
    }
    public void listProductsByType(String type) {
        System.out.println("Product listed by type");
        productRepo.listProductsByType(type);
    }
}
