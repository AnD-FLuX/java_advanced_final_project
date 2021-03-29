package ua.lviv.lgs.controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ua.lviv.lgs.domain.Entrant;
import ua.lviv.lgs.domain.Faculty;
import ua.lviv.lgs.domain.RegistrationForFaculty;
import ua.lviv.lgs.domain.User;
import ua.lviv.lgs.mapper.RegistrationForFacultyDtoMapper;
import ua.lviv.lgs.service.FacultyService;
import ua.lviv.lgs.service.RegistrationForFacultyService;
import ua.lviv.lgs.service.UserService;

@Controller
public class RegistrationForFacultyController {

	@Autowired
	private UserService userService;

	@Autowired
	private FacultyService facultyService;

	@Autowired
	private RegistrationForFacultyService registrationForFacultyService;

	@Autowired
	private RegistrationForFacultyDtoMapper registrationForFacultyDtoMapper;

	@GetMapping("/addReg")
	public ModelAndView registerForFaculty(@RequestParam("id") Integer id) {

		Faculty faculty = facultyService.findById(id).get();

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userEmail = auth.getName();
		User user = userService.findByEmail(userEmail);

		Entrant entrant = user.getEntrant();

		RegistrationForFaculty registrationForFaculty = new RegistrationForFaculty();
		registrationForFaculty.setFaculty(faculty);
		registrationForFaculty.setEntrant(entrant);

		ModelAndView modelAndView = new ModelAndView("addRegistrationFaculty");

		modelAndView.addObject("registrationForFaculty", registrationForFaculty);
		modelAndView.addObject("currentFaculty", faculty);
		modelAndView.addObject("userInfo", user);
		modelAndView.addObject("entrantInfo", entrant);

		System.out.println(faculty);
		System.out.println(entrant);

		return modelAndView;
	}

	@PostMapping("/addReg")
	public String addRegistration(@RequestParam MultipartFile documentPhoto, @RequestParam("marks") List<Integer> marks,
			@RequestParam Integer facultyId, @RequestParam String email) throws IOException {

		Faculty faculty = facultyService.findById(facultyId).get();
		User user = userService.findByEmail(email);
		Entrant entrant = user.getEntrant();

		RegistrationForFaculty entity = registrationForFacultyDtoMapper.createEntity(documentPhoto, faculty, entrant,
				marks);

		entity.setSumMarks((marks.stream().reduce(0, Integer::sum) + entrant.getCertificatAvarageMark())/ 4);
		registrationForFacultyService.save(entity);
		return "redirect:/myApplications";
	}

	@GetMapping("/myApplications")
	public ModelAndView showApplications() {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userEmail = auth.getName();
		Entrant entrant = userService.findByEmail(userEmail).getEntrant();

		List<RegistrationForFaculty> entrantApplications = registrationForFacultyService.showAllRegFaculty().stream()
				.filter(obj -> obj.getEntrant().getId().equals(entrant.getId())).collect(Collectors.toList());

		return new ModelAndView("viewMyApplications", "facultyRegistrations", entrantApplications);
	}

	@GetMapping("/myApplications/{delete}/{id}")
	public ModelAndView deleteApplication(@PathVariable String delete, @PathVariable Integer id) {
		if (delete.equals("delete")) {
			registrationForFacultyService.deleteById(id);
		}
		return new ModelAndView("redirect:/myApplications");
	}

	@GetMapping("/viewApplications")
	public ModelAndView showAllApplications() {
		return new ModelAndView("viewAllApplications", "facultyRegistrations",
				registrationForFacultyService.showAllRegFaculty());
	}

	@GetMapping("/viewApplications/{delete}/{id}")
	public ModelAndView deleteFaculty(@PathVariable String delete, @PathVariable Integer id) {
		if (delete.equals("delete")) {
			registrationForFacultyService.deleteById(id);
		}
		return new ModelAndView("redirect:/viewApplications");
	}

}
