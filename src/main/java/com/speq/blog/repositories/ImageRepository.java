package com.speq.blog.repositories;
import com.speq.blog.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;
public interface ImageRepository extends JpaRepository<Image, Long> {}