package com.azeredudu.entreprise.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
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

@Transactional
@Service
public class InitDbService {
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private ItemRepository itemRepository;
	@Autowired
	private BlogRepository blogRepository;
	@Autowired
	private UserRepository userRepository;

	@PostConstruct
	public void init() {
		Role roleAdmin = new Role();
		roleAdmin.setName("ROLE_ADMIN");
		roleRepository.save(roleAdmin);

		Role roleUser = new Role();
		roleUser.setName("ROLE_USER");

		roleRepository.save(roleUser);
		User userAdmin = new User();
		userAdmin.setName("admin");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		userAdmin.setPassword(encoder.encode("christophe"));
		userAdmin.setEmail("mabiala@yahoo.fr");
		userAdmin.setEnabled(true);
		List<Role> roles = new ArrayList<Role>();
		roles.add(roleUser);
		roles.add(roleAdmin);
		userAdmin.setRoles(roles);
		userRepository.save(userAdmin);

		Blog blogJavavids = new Blog();
		blogJavavids.setName("Javavids");
		blogJavavids.setUrl("http://feeds.feedburner.com/javavids?format=xml");
		blogJavavids.setUser(userAdmin);
		blogRepository.save(blogJavavids);
		Blog blogFacebook = new Blog();
		blogFacebook.setName("Facebook");
		blogFacebook.setUrl("http://feeds.feedburner.com/javavids?format=xml");
		blogFacebook.setUser(userAdmin);
		blogRepository.save(blogFacebook);

		Item item1 = new Item();
		item1.setTitle("First");
		item1.setLink("http://www.javavids.com");
		item1.setBlog(blogJavavids);
		item1.setDescription("My first item");
		item1.setPublishedDate(new Date());

		Item item2 = new Item();
		item2.setTitle("Second");
		item2.setLink("http://www.javavids.com");
		item2.setBlog(blogJavavids);
		item2.setDescription("My second item");
		item2.setPublishedDate(new Date());

		Item item3 = new Item();
		item3.setTitle("First");
		item3.setLink("http://www.facebook.com");
		item3.setBlog(blogFacebook);
		item3.setDescription("My first item");
		item3.setPublishedDate(new Date());

		Item item4 = new Item();
		item4.setTitle("Second");
		item4.setLink("http://www.facebook.com");
		item4.setBlog(blogFacebook);
		item4.setDescription("My second item");
		item4.setPublishedDate(new Date());

		itemRepository.save(item1);
		itemRepository.save(item2);
		itemRepository.save(item3);
		itemRepository.save(item4);

	}
}
