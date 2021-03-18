package ua.lviv.lgs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ua.lviv.lgs.domain.Faculty;
import ua.lviv.lgs.domain.User;
import ua.lviv.lgs.service.FacultyService;
import ua.lviv.lgs.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private FacultyService facultyService;

	@GetMapping("/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());

		return "registration";
	}

	@PostMapping("/registration")
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {

		if (bindingResult.hasErrors()) {
			return "registration";
		}
		userService.save(userForm);

		return "redirect:/home";
	}

	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@GetMapping("/home")
	public String welcome() {
		return "home";
	}

	@GetMapping("/account")
	public String account() {
		return "account";
	}

	@GetMapping("/viewFaculties")
	public ModelAndView viewFaculties() {
		ModelAndView map = new ModelAndView("viewFaculties");
		map.addObject("viewFaculties", facultyService.getAllFaculty());
		return map;
	}

	@GetMapping("/registrationFaculty")
	public ModelAndView registrationFaculty() {
		ModelAndView map = new ModelAndView("registrationFaculty");
		map.addObject("registrationFaculty", facultyService.getAllFaculty());
		return map;
	}

	@GetMapping("/myApplications")
	public String myApplications() {
		return "myApplications";
	}

	@GetMapping("/createFaculty")
	public ModelAndView createFaculty() {
		return new ModelAndView("createFaculty", "faculty", new Faculty());
	}

	@GetMapping("/viewApplications")
	public String viewApplications() {
		return "viewApplications";
	}

}
