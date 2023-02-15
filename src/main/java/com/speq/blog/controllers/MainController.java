package com.speq.blog.controllers;

import com.speq.blog.models.Product;
import com.speq.blog.models.User;
import com.speq.blog.models.enums.Role;
import com.speq.blog.services.ProductService;
import com.speq.blog.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final ProductService productService;
    @GetMapping("/about")
    public String about(Principal principal, Model model) {
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "about";
    }
    @GetMapping("/")
    public String products(Principal principal, Model model) {
        User user = productService.getUserByPrincipal(principal);
        model.addAttribute("products", productService.listProducts(user));
        model.addAttribute("user", user);
        return "home";
    }
    @GetMapping("/create")
    public String create(Principal principal, Model model) {
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "create";
    }
    @PostMapping("/product/create")
    public String createProduct(@RequestParam("file1") MultipartFile file1, Product product, Principal principal) throws IOException {
        productService.saveProduct(principal, product, file1);
        return "redirect:/";
    }
    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "redirect:/";
    }
    @GetMapping("/product/edit/{id}")
    public String edit(@PathVariable Long id,Principal principal, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "edit";
    }
    @PostMapping("/product/edit/{id}")
    public String editProduct(@RequestParam("file1") MultipartFile file1, @PathVariable Long id, Product product) throws IOException {
        productService.editProduct(id, product, file1);
        return "redirect:/";
    }
    @PostMapping("/buy/{id}")
    public String buyProduct(@PathVariable Long id) {
        productService.buyProduct(id);
        return "redirect:/";
    }
    @GetMapping("/info/{id}")
    public String info(@PathVariable Long id, Principal principal, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "info";
    }
}