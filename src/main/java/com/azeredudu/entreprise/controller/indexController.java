package com.azeredudu.entreprise.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.azeredudu.entreprise.service.ItemService;
import com.azeredudu.entreprise.service.UserService;

@Controller
public class indexController {
    @Autowired
    private ItemService itemService;
    @Autowired
    UserService         userService;

    @RequestMapping( value = "/index" )
    public String index( Model model, Principal principal ) {
        model.addAttribute( "items", itemService.getItems() );
        if ( principal != null ) {
            String name = principal.getName();
            model.addAttribute( "user", userService.findOne( name ) );
        }

        return "index";
    }
}
