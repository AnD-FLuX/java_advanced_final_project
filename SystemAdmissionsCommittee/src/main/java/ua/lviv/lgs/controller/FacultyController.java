package ua.lviv.lgs.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ua.lviv.lgs.domain.Faculty;
import ua.lviv.lgs.domain.Subject;
import ua.lviv.lgs.mapper.FacultyDtoMapper;
import ua.lviv.lgs.service.FacultyService;

@Controller
public class FacultyController {

	@Autowired
	private FacultyService facultyService;

	@Autowired
	private FacultyDtoMapper facultyDtoMapper;

	@GetMapping("/createFaculty")
	public ModelAndView createFaculty() {
		return new ModelAndView("createFaculty", "faculty", new Faculty());
	}

	@GetMapping("/viewFaculties")
	public ModelAndView viewFaculties() {
		ModelAndView map = new ModelAndView("viewFaculties");
		map.addObject("viewFaculties", facultyService.getAllFaculties());
		return map;
	}

	@GetMapping("/registrationFaculty")
	public ModelAndView registrationFaculty() {
		ModelAndView map = new ModelAndView("registrationFaculty");
		map.addObject("registrationFaculty", facultyService.getAllFaculties());
		return map;
	}

	@PostMapping("/addFaculty")
	public ModelAndView createFaculty(
			@RequestParam MultipartFile logoUrl,
			@RequestParam String name, 
			@RequestParam Integer numberOfStudents,
			@RequestParam String firstSubject, 
			@RequestParam String secondSubject, 
			@RequestParam String thirdSubject)
			throws IOException {

		List<Subject> subjects = new ArrayList<>();
		subjects.add(new Subject(firstSubject));
		subjects.add(new Subject(secondSubject));
		subjects.add(new Subject(thirdSubject));

		facultyService.save(facultyDtoMapper.createEntity(name, numberOfStudents, logoUrl, subjects));

		return new ModelAndView("redirect:/viewFaculties");
	}

	@GetMapping("/viewFaculties/{delete}/{id}")
	public ModelAndView deleteFaculty(@PathVariable String delete, @PathVariable Integer id) {
		if (delete.equals("delete")) {
			facultyService.deleteById(id);
			getFacultyItems();
		}
		return new ModelAndView("redirect:/viewFaculties");
	}

	
	private ModelAndView getFacultyItems() {
		ModelAndView mav = new ModelAndView("admin_panel");
		mav.addObject("facultetItems", facultyService.getAllFaculties());
		return mav;
	}

}
