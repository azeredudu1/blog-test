package com.azeredudu.entreprise.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.azeredudu.entreprise.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByName(String name);

	

}
