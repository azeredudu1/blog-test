package com.azeredudu.entreprise.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.azeredudu.entreprise.entity.Blog;
import com.azeredudu.entreprise.entity.Role;
import com.azeredudu.entreprise.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer> {

	List<Blog> findBlogsByUser(User user);
}
