package com.speq.blog.repositories;

import com.speq.blog.models.Product;
import com.speq.blog.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByUser(User user);
    List<Product> findByCountGreaterThan(int count);
}
