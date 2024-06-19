package com.dev.ronquillo.controller;

import com.dev.ronquillo.entity.Product;
import com.dev.ronquillo.services.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    protected ProductServices productServices;

    @GetMapping("/")
    public ModelAndView index() {
        return new ModelAndView("index");
    }
    @PostMapping("userValidation")
    public String userValidation(@RequestParam String login,@RequestParam String password, HttpServletRequest request) {
        if (productServices.userValidation(login, password)) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("pedido", new ArrayList<Product>());
            return "redirect:/home";
        }
        return null;
    }
    @GetMapping("home")
    public ModelAndView home() {
        ModelAndView maw = new ModelAndView("home");
        List<Product> productList = listProducts(true);
        maw.addObject("productList",productList);
        return maw;
    }
    @PostMapping("modifyQuantity")
    public String modifyQuantity(@RequestParam int productId, @RequestParam Double quantity) {
        System.out.println("Quantity modified");
        System.out.println("Product id: " + productId + " Quantity: " + quantity);
        productServices.modifyQuantity(productId, quantity);
        return "redirect:/home";
    }
    //Service call to productService(return productList)
    public List<Product> listProducts(Boolean type) {
        try{
            return productServices.listProducts(type);
        } catch (Exception e) {
            return productServices.listProducts(null);
        }
    }
    @GetMapping("/adminProducts")
    public ModelAndView adminProducts(){
        ModelAndView maw = new ModelAndView("adminProducts");
        List<Product> productList = listProducts(null);
        maw.addObject("productList",productList);
        return maw;
    }
    @PostMapping("/desactivarProducto")
    public String deactivateProduct(@RequestParam int id) {
        try {
            productServices.deactivateProduct(id);
        }catch(Exception e){
            return "redirect:/adminProducts";
        }

        return "redirect:/adminProducts";
    }

    @GetMapping("/activarProducto")
    public String activarProducto(@RequestParam int id) {
        try {
            productServices.activateProduct(id);
        }catch(Exception e){
            return "redirect:/adminProducts";
        }

        return "redirect:/adminProducts";
    }
    @PostMapping("addProduct")
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
    public void searchProduct(String name) {
        System.out.println("Product searched");
        productServices.searchProduct(name);
    }
    public void listProductsByType(String type) {
        System.out.println("Product listed by type");
        productServices.listProductsByType(type);
    }
}