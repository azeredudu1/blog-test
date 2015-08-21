package com.azeredudu.entreprise.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.azeredudu.entreprise.service.UserService;

@Controller
@RequestMapping( value = "/users" )
public class AdminController {
    @Autowired
    private UserService userService;

    @RequestMapping
    public String users( Model model, Principal principal ) {
        model.addAttribute( "users", userService.findAll() );
        if ( principal != null ) {
            String name = principal.getName();
            model.addAttribute( "user", userService.findOne( name ) );
        }
        return "users";
    }

    @RequestMapping( "/{id}" )
    public String userDetails( Model model, @PathVariable int id ) {
        model.addAttribute( "user", userService.findOneWithBlog( id ) );

        return "user-detail";

    }

    @RequestMapping( "/remove/{id}" )
    public String removeUser( @PathVariable int id ) {
        userService.delete( id );
        return "redirect:/users.html";
    }

}
