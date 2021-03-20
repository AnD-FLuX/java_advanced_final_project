package ua.lviv.lgs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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



}
