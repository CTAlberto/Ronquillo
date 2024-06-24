package com.dev.ronquillo.controller;

import com.dev.ronquillo.entity.Product;
import com.dev.ronquillo.services.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
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
    public ModelAndView home(String type) {
        ModelAndView maw = new ModelAndView("home");
        List<Product> productList = listProducts(type);
        maw.addObject("productList",productList);
        return maw;
    }
    @GetMapping("/adminProducts")
    public ModelAndView adminProducts(String type){
        ModelAndView maw = new ModelAndView("adminProducts");
        List<Product> productList = listProducts(type);
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
    @GetMapping("listProducts")
    public List<Product> listProducts(@RequestParam String type) {
        System.out.println("Product listed by" + type);
        try{
            return productServices.listProducts(type);
        } catch (Exception e) {
            return productServices.listProducts(null);
        }
    }
    @PostMapping("deactivateProduct")
    public String deactivateProduct(@RequestParam int id) {
        try {
            productServices.deactivateProduct(id);
        }catch(Exception e){
            return "redirect:/adminProducts";
        }

        return "redirect:/adminProducts";
    }

    @PostMapping("activateProduct")
    public String activarProducto(@RequestParam int id) {
        try {
            productServices.activateProduct(id);
        }catch(Exception e){
            return "redirect:/adminProducts";
        }

        return "redirect:/adminProducts";
    }
    @GetMapping("/addProduct")
    public ModelAndView addProduct() {
        return new ModelAndView("addProduct");
    }
    @PostMapping("addProduct")
    public void addProduct(@RequestParam String name, @RequestParam String type, @RequestParam Double quantity, String description, @RequestParam String quantityType){
        productServices.addProduct(name, type, quantity, description, quantityType);
    }
    public void updateProduct(int id) {
        System.out.println("Product updated");
        productServices.updateProduct(id);
    }
    @PostMapping("addFavourite")
    public void addFavourite(int id) {
        productServices.addFavourite(id);
    }
    @PostMapping("quitFavourite")
    public void quitFavourite(int id) {
        productServices.quitFavourite(id);
    }
    @PostMapping("searchProduct")
    public ModelAndView searchProduct(String name) {
        ModelAndView maw = new ModelAndView("home");
        maw.addObject("productList", productServices.searchProduct(name));
        return maw;
    }
    @PostMapping("searchProductAdminPanel")
    public ModelAndView searchProductAdminPanel(String name) {
        ModelAndView maw = new ModelAndView("adminProducts");
        maw.addObject("productList", productServices.searchProduct(name));
        return maw;
    }
    public void listProductsByType(String type) {
        System.out.println("Product listed by type");
        productServices.listProductsByType(type);
    }
}