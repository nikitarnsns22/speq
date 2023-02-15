package com.speq.blog.services;
import com.speq.blog.models.Image;
import com.speq.blog.models.Product;
import com.speq.blog.models.User;
import com.speq.blog.models.enums.Role;
import com.speq.blog.repositories.ImageRepository;
import com.speq.blog.repositories.ProductRepository;
import com.speq.blog.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ImageRepository imageRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    public List<Product> listProducts(User user) {
        if (user.isManager()){
            return productRepository.findByUser(user);
        } else if (user.isUser()){
            return productRepository.findByCountGreaterThan(0);
        }
        return productRepository.findAll();
    }
    public void saveProduct(Principal principal, Product product, MultipartFile file1) throws IOException {
        product.setUser(getUserByPrincipal(principal));
        Image image1 = toImageEntity(file1);
        image1.setProduct(product);
        product.setImage(image1);
        Product productFromDb = productRepository.save(product);
        productFromDb.setPreviewImageId(productFromDb.getImage().getId());
        productRepository.save(product);
        log.info("Saving new Product. Title: {}; Author email: {}", product.getTitle(), product.getUser().getEmail());
    }
    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
    public void editProduct(Long id, Product product, MultipartFile file1) throws IOException {
        Product editProduct = productRepository.getById(id);
        editProduct.getImage().setOriginalFileName(file1.getOriginalFilename());
        editProduct.getImage().setContentType(file1.getContentType());
        editProduct.getImage().setSize(file1.getSize());
        editProduct.getImage().setBytes(file1.getBytes());
        editProduct.setTitle(product.getTitle());
        editProduct.setDescription(product.getDescription());
        editProduct.setCount(product.getCount());
        editProduct.setPrice(product.getPrice());
        productRepository.save(editProduct);
    }
    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }
    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
    public void buyProduct(Long id) {
        Product product = productRepository.getById(id);
        product.setCount(product.getCount()-1);
        productRepository.save(product);
    }
}