package com.azeredudu.entreprise.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.azeredudu.entreprise.entity.Blog;
import com.azeredudu.entreprise.entity.Item;
import com.azeredudu.entreprise.entity.User;
import com.azeredudu.entreprise.exception.RssException;
import com.azeredudu.entreprise.repository.BlogRepository;
import com.azeredudu.entreprise.repository.ItemRepository;
import com.azeredudu.entreprise.repository.UserRepository;

@Service
@Transactional
public class BlogService {
	@Autowired
	private BlogRepository blogRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RssService rssService;
	@Autowired
	ItemRepository itemRepository;

	public void saveItem(Blog blog) {
		try {

			List<Item> items = rssService.getItems(blog.getUrl());

			for (Item item : items) {

				Item savedItem = itemRepository.findByBlogAndLink(blog, item.getLink());

				if(savedItem == null) {

					item.setBlog(blog);

					itemRepository.save(item);

				}

			}

		} catch (RssException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
@Transactional
	public void save(Blog blog, String name) {
		// TODO Auto-generated method stub
		User user = userRepository.findByName(name);
		blog.setUser(user);
		blogRepository.save(blog);
		saveItem(blog);

	}

	/*
	 * public void delete(int id) { // TODO Auto-generated method stub
	 * blogRepository.delete(id);
	 * 
	 * }
	 */
	/* Mesure de securite sinon, la methode au dessus est aussi valable */
	@PreAuthorize("#blog.user.name==authentication.name or hasRole('ROLE_ADMIN')")
	public void delete(@P("blog") Blog blog) {
		// TODO Auto-generated method stub
		blogRepository.delete(blog);

	}

	public Blog findOne(int id) {
		// TODO Auto-generated method stub
		return blogRepository.findOne(id);
	}

}
