package com.azeredudu.entreprise.controller;

import java.io.InputStream;
import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.azeredudu.entreprise.entity.Blog;
import com.azeredudu.entreprise.entity.User;
import com.azeredudu.entreprise.service.BlogService;
import com.azeredudu.entreprise.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private BlogService blogService;

	@ModelAttribute("blog")
	public Blog contructBlog() {
		return new Blog();
	}

	/*
	 * Recupere l'utilsateur en session
	 */
	@RequestMapping(value = "/account", method = RequestMethod.POST)
	public String doAddBlog(Model model,
			@Valid @ModelAttribute("blog") Blog blog, BindingResult result,
			Principal principal) {
		if (result.hasErrors()) {
			return account(model, principal);
		}

		String name = principal.getName();
		blogService.save(blog, name);
		return "redirect:/account.html";
	}

	/*
	 * Recupere les informations de l'utisateur en session
	 */@RequestMapping(value = "/account")
	public String account(Model model, Principal principal) {
		String name = principal.getName();
		model.addAttribute("user", userService.findOneWithBlog(name));
		return "user-account";
	}

	/*
	 * Supprime un blog
	 * 
	 * @RequestMapping(value = "/blog/remove/{id}") public String
	 * removeBlog(@PathVariable int id) { blogService.delete(id); return
	 * "redirect:/account.html"; }
	 */

	@RequestMapping(value = "/blog/remove/{id}")
	public String removeBlog(@PathVariable int id) {
		Blog blog = blogService.findOne(id);
		blogService.delete(blog);
		return "redirect:/account.html";
	}

}
