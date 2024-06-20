package com.dev.ronquillo.services;

import com.dev.ronquillo.entity.Product;
import com.dev.ronquillo.repository.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServices {

    @Autowired
    protected ProductRepo productRepo;

    public void addProduct(String name, String type, double quantity, String description, String quantityType){
        productRepo.addProduct(name, type, quantity, description, quantityType);
    }

    public boolean userValidation(String username, String password) {
        if (username.equals("narikiki65") && password.equals("narikiki65")) {
            return true;
        }
        return false;

    }
    public void modifyQuantity(int id, double quantity) {
        productRepo.modifyQuantity(id, quantity);
    }
    public void updateProduct(int id) {
        System.out.println("Product updated");
        productRepo.updateProduct(id);
    }

    public void deleteProduct(int id) {
        System.out.println("Product deleted");
        productRepo.deleteProduct(id);
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

    public void searchProduct(String name) {
        System.out.println("Product searched");
        productRepo.searchProduct(name);
    }
    public void listProductsByType(String type) {
        System.out.println("Product listed by type");
        productRepo.listProductsByType(type);
    }
}
