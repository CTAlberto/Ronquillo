package com.dev.ronquillo.repository;

import com.dev.ronquillo.services.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductRepo {

    public void addProduct(String name, String type, double quantity, String description) {
        System.out.println("Product added");
    }

    public void updateProduct(int id) {
        System.out.println("Product updated");
    }

    public void deleteProduct(int id) {
        System.out.println("Product deleted");
    }

    public void listProducts() {

        System.out.println("Product listed");
    }

    public void searchProduct(String name) {
        System.out.println("Product searched");
    }
    public void listProductsByType(String type) {
        System.out.println("Product listed by type");
    }
}
