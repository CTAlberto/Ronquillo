package com.dev.ronquillo.repository;

import com.dev.ronquillo.entity.Product;
import com.dev.ronquillo.services.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductRepo {
    @Autowired
    ConectBBDD conectBBDD;
    public void addProduct(String name, String type, double quantity, String description) {
        System.out.println("Product added");
    }

    public void updateProduct(int id) {
        System.out.println("Product updated");
    }

    public void deleteProduct(int id) {
        System.out.println("Product deleted");
    }

    public void modifyQuantity(int id, double quantity) {
        try{
            Connection connection = conectBBDD.conectar();
            String sql = "UPDATE Product SET quantity = " + quantity + " WHERE id = " + id;
            connection.createStatement().executeUpdate(sql);
            connection.close();
        } catch (ClassNotFoundException | SQLException s) {
            s.printStackTrace();
        }
    }
    public List<Product> listProducts(Boolean type) {
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = conectBBDD.conectar();
            String sql = "";
            if (type == null) {
                sql = "SELECT * FROM Product order by isAvailable asc";
            } else{
                // Caso cuando type es true
                sql = "SELECT * FROM Product WHERE isAvailable = " + type;
            }
            ResultSet resultSet = connection.createStatement().executeQuery(sql);
            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setType(resultSet.getString("type"));
                product.setQuantity(resultSet.getDouble("quantity"));
                product.setDescription(resultSet.getString("description"));
                product.setAvailable(resultSet.getBoolean("isAvailable"));
                product.setQuantityType(resultSet.getString("quantityType"));
                products.add(product);
            }
            connection.close();
            return products;
        } catch (ClassNotFoundException | SQLException s) {
            s.printStackTrace();
        }
        System.out.println("Product listed");
        return products;
    }
    public void activateProduct(int id){
        try{
            Connection connection = conectBBDD.conectar();
            String sql = "UPDATE Product SET isAvailable = true WHERE id = " + id;
            connection.createStatement().executeUpdate(sql);
            connection.close();
        } catch (ClassNotFoundException | SQLException s) {
            s.printStackTrace();
        }
    }
    public void deactivateProduct(int id) {
        try {
            Connection connection = conectBBDD.conectar();
            String sql = "UPDATE Product SET isAvailable = false WHERE id = " + id;
            connection.createStatement().executeUpdate(sql);
            connection.close();
        } catch (ClassNotFoundException | SQLException s) {
            s.printStackTrace();
        }
    }
    public void searchProduct(String name) {
        System.out.println("Product searched");
    }
    public void listProductsByType(String type) {
        System.out.println("Product listed by type");
    }
}
