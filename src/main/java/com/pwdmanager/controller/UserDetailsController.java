package com.pwdmanager.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pwdmanager.entity.PasswordDetails;
import com.pwdmanager.entity.UserDetails;
import com.pwdmanager.service.PasswordDetailsService;
import com.pwdmanager.service.UserDetailsService;

@Controller
public class UserDetailsController {
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	private PasswordDetailsService passwordDetailsService;
	
	@ModelAttribute("user")
	public UserDetails createUser() {
		return new UserDetails();
	}
	
	@ModelAttribute("passwordDetail")
	public PasswordDetails addPasswordDetail() {
		return new PasswordDetails();
	}
	
	@RequestMapping("/users")
	public String getAllUsers(Model model) {
		model.addAttribute("users", userDetailsService.getAllUsers());
		return "users";
	}
	
	@RequestMapping("/users/{userName}")
	public String getUser(Model model, @PathVariable String userName) {
		model.addAttribute("users", userDetailsService.getUser(userName));
		return "user_detail";
	}
	
	@RequestMapping("/account")
	public String getAccount(Model model, Principal principal) {
		String name = principal.getName();
		model.addAttribute("users", userDetailsService.getUser(name));
		return "user_detail";
	}
	
	@RequestMapping(value="/account", method=RequestMethod.POST)
	public String addPasswordDetailForUser(@ModelAttribute("passwordDetail") PasswordDetails passwordDetails, Principal principal) {
		String name = principal.getName();
		passwordDetailsService.save(passwordDetails, name);
		return "redirect:/account.html?success=true";
	}
	
	@RequestMapping(value="/passwordDetails")
	public String getPasswordDetailForUser(Model model, Principal principal) {
		String name = principal.getName();
		List<PasswordDetails> pwdDetails = passwordDetailsService.getPasswordDetails(name);
		model.addAttribute("pwdDetails", pwdDetails);
		return "user_detail";
	}
	
	@RequestMapping("/userRegister")
	public String showRegisteredUser() {
		return "user_register";
	}
	
	@RequestMapping(value="/userRegister", method=RequestMethod.POST)
	public String doUserRegistration(@ModelAttribute("user") UserDetails userDetails) {
		userDetailsService.save(userDetails);
		return "redirect:/userRegister.html?success=true";
	}
}
