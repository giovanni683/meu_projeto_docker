package com.example.meu_projeto_docker.repository;

import com.example.meu_projeto_docker.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
