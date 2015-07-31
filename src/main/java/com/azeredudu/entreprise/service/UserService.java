package com.azeredudu.entreprise.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.azeredudu.entreprise.entity.Blog;
import com.azeredudu.entreprise.entity.Item;
import com.azeredudu.entreprise.entity.Role;
import com.azeredudu.entreprise.entity.User;
import com.azeredudu.entreprise.repository.BlogRepository;
import com.azeredudu.entreprise.repository.ItemRepository;
import com.azeredudu.entreprise.repository.RoleRepository;
import com.azeredudu.entreprise.repository.UserRepository;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ItemRepository itemRepository;
	@Autowired
	private BlogRepository blogRepository;
	@Autowired
	private RoleRepository roleRepository;

	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User findOne(int id) {
		return userRepository.findOne(id);
	}

	@Transactional
	public User findOneWithBlog(int id) {
		// TODO Auto-generated method stub
		User user = findOne(id);
		List<Blog> blogs = blogRepository.findBlogsByUser(user);
		for (Blog blog : blogs) {
			List<Item> items = itemRepository.findItemsByBlog(blog,
					new PageRequest(0, 10, Direction.DESC, "publishedDate"));
			blog.setItems(items);
		}
		user.setBlogs(blogs);

		return user;
	}

	public void save(User user) {
		user.setEnabled(true);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));

		List<Role> roles = new ArrayList<Role>();
		roles.add(roleRepository.findByName("ROLE_USER"));
		user.setRoles(roles);

		userRepository.save(user);
	}

	public User findOneWithBlog(String name) {
		// TODO Auto-generated method stub
		User user = userRepository.findByName(name);
		return findOneWithBlog(user.getId());
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		userRepository.delete(id);
	}

	public User findOne(String username) {
		// TODO Auto-generated method stub
		return userRepository.findByName(username);
	}
}
