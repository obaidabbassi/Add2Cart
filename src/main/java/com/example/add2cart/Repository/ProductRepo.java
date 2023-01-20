package com.example.add2cart.Repository;

import com.example.add2cart.Entities.Products;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepo extends JpaRepository<Products,Integer> {
}
