package com.dev.ronquillo.controller;

import com.dev.ronquillo.repository.ProductRepo;
import com.dev.ronquillo.services.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
    @Autowired
    protected ProductServices productServices;

    @GetMapping("/ronquillo")
    public ModelAndView home() {
        return new ModelAndView("index");
    }
    @PostMapping("userValidation")
    public ModelAndView userValidation(@RequestParam String login,@RequestParam String password) {
        if (login.equals("narikiki65") && password.equals("narikiki65")) {
            System.out.println("User and password correct");
            return new ModelAndView("index");
        }
        return null;
    }

    public void addProduct(String name, String type, double quantity, String description) {
        System.out.println("Product added");
        productServices.addProduct(name, type, quantity, description);
    }
    public void updateProduct(int id) {
        System.out.println("Product updated");
        productServices.updateProduct(id);
    }
    public void deleteProduct(int id) {
        System.out.println("Product deleted");
        productServices.deleteProduct(id);
    }
    public void listProducts() {
        System.out.println("Product listed");
        productServices.listProducts();
    }
    public void searchProduct(String name) {
        System.out.println("Product searched");
        productServices.searchProduct(name);
    }
    public void listProductsByType(String type) {
        System.out.println("Product listed by type");
        productServices.listProductsByType(type);
    }

}
