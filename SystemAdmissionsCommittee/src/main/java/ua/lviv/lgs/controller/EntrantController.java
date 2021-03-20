package ua.lviv.lgs.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ua.lviv.lgs.domain.Entrant;
import ua.lviv.lgs.domain.User;
import ua.lviv.lgs.domain.UserRole;
import ua.lviv.lgs.mapper.EntrantDtoMapper;
import ua.lviv.lgs.service.EntrantService;
import ua.lviv.lgs.service.UserService;

@Controller
public class EntrantController {

	@Autowired
	private UserService userService;

	@Autowired
	private EntrantService entrantService;

	@Autowired
	private EntrantDtoMapper entrantDtoMapper;

	@GetMapping("/userAccount")
	public String welcome(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userEmail = auth.getName();
		User user = userService.findByEmail(userEmail);
		model.addAttribute("userInfo", user);
		return "userAccount";
	}
	
	@GetMapping("/entrantAccount")
	public String hello(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userEmail = auth.getName();
		User user = userService.findByEmail(userEmail);
		model.addAttribute("userInfo", user);
		model.addAttribute("entrantInfo", user.getEntrant());
		return "entrantAccount";
	}
//		public ModelAndView entrant() {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		
//		String userEmail = auth.getName();
//		
//		User user = userService.findByEmail(userEmail);
//
//
//		Entrant entrant = new Entrant();
//		entrant.setUser(user);
//
//		ModelAndView modelAndView = new ModelAndView("entrant");
//		modelAndView.addObject("entrant", entrant);
//		modelAndView.addObject("currentUser", user);
//		return modelAndView;

	@PostMapping("/userAccount")
	public ModelAndView createEntrant(
			@RequestParam MultipartFile uploadPhoto, 
			@RequestParam String city, 
			@RequestParam String school)
			throws IOException {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userEmail = auth.getName();
		User user = userService.findByEmail(userEmail);

		user.setRole(UserRole.ROLE_ENTRANT);
		userService.update(user);
		
		Entrant entrant = entrantDtoMapper.createEntity(city, school, uploadPhoto);
		entrant.setUser(user);
		entrantService.save(entrant);

		return new ModelAndView("redirect:/login?logout");
	}

}
