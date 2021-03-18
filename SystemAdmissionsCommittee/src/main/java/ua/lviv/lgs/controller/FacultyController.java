package ua.lviv.lgs.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ua.lviv.lgs.domain.Subject;
import ua.lviv.lgs.mapper.FacultyDtoMapper;
import ua.lviv.lgs.service.FacultyService;

@Controller
public class FacultyController {

	@Autowired
	private FacultyService facultyService;

	@Autowired
	private FacultyDtoMapper facultyDtoMapper;

	@PostMapping("/addFaculty")
	public ModelAndView createFaculty(@RequestParam String name, @RequestParam Integer numberOfStudents,
			@RequestParam String firstSubject, @RequestParam String secondSubject, @RequestParam String thirdSubject)
			throws IOException {

		List<Subject> subjects = new ArrayList<>();
		subjects.add(new Subject(firstSubject));
		subjects.add(new Subject(secondSubject));
		subjects.add(new Subject(thirdSubject));

		facultyService.save(facultyDtoMapper.createEntity(name, numberOfStudents, subjects));

		return new ModelAndView("redirect:/viewFaculties");
	}

}
