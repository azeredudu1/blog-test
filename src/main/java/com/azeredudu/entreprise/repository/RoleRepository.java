package com.azeredudu.entreprise.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.azeredudu.entreprise.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {
	public Role findByName(String name);

}
