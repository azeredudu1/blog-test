package com.azeredudu.entreprise.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.azeredudu.entreprise.entity.Blog;
import com.azeredudu.entreprise.entity.Item;
import com.azeredudu.entreprise.entity.Role;

public interface ItemRepository extends JpaRepository<Item, Integer> {
	List<Item> findItemsByBlog(Blog blog, Pageable pageable);

	Item findByBlogAndLink(Blog blog, String link);
	
	
}
