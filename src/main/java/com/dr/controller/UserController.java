package com.dr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.dr.model.User;
import com.dr.services.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView newUserPage() {
		ModelAndView mav = new ModelAndView("user-new", "user", new User());
		return mav;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createNewUser(@ModelAttribute User user, final RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("welcome");
		userService.create(user);
		String message = "Team was successfully added.";
		modelAndView.addObject("message", message);
		return modelAndView;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView userListPage() {
		ModelAndView modelAndView = new ModelAndView("user-list");
		List<User> users = userService.findAll();
		modelAndView.addObject("users", users);
		return modelAndView;
	}
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editUserPage(@PathVariable Long id) {
		ModelAndView modelAndView = new ModelAndView("user-edit");
		User user = userService.findById(id);
		modelAndView.addObject("user", user);
		return modelAndView;
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public ModelAndView editUser(@ModelAttribute User user, @PathVariable Long id,
			final RedirectAttributes redirectAttributes) throws Exception {
		ModelAndView modelAndView = new ModelAndView("welcome");
		userService.update(user);
		String message = "User was successfully edited.";
		modelAndView.addObject("message", message);
		return modelAndView;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteUser(@PathVariable Long id, final RedirectAttributes redirectAttributes)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView("welcome");
		userService.delete(id);
		String message = "User was successfully deleted.";
		modelAndView.addObject("message", message);
		return modelAndView;
	}
	
	@RequestMapping(value="api/list", method = RequestMethod.GET)
	@ResponseBody
	public  List<User>  userListJson() {
		List<User> users = userService.findAll();
		return users;
	}

}
