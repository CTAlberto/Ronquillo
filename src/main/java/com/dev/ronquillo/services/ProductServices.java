package com.dev.ronquillo.services;

import com.dev.ronquillo.repository.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServices {

    @Autowired
    protected ProductRepo productRepo;
    public void addProduct(String name, String type, double quantity, String description) {
        System.out.println("Product added");
        productRepo.addProduct(name, type, quantity, description);
    }

    public void updateProduct(int id) {
        System.out.println("Product updated");
        productRepo.updateProduct(id);
    }

    public void deleteProduct(int id) {
        System.out.println("Product deleted");
        productRepo.deleteProduct(id);
    }

    public void listProducts() {
        System.out.println("Product listed");
        productRepo.listProducts();
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