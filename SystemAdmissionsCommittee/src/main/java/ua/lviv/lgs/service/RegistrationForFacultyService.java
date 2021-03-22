package ua.lviv.lgs.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.dao.RegistrationForFacultyRepository;
import ua.lviv.lgs.domain.RegistrationForFaculty;

@Service
public class RegistrationForFacultyService {

	private Logger logger = LoggerFactory.getLogger(RegistrationForFacultyService.class);

	@Autowired
	private RegistrationForFacultyRepository registrationForFacultyRepository;

	public void save(RegistrationForFaculty registrationForFaculty) {
		logger.debug("Create new Application for Faculty {} :" + registrationForFaculty);

		registrationForFacultyRepository.save(registrationForFaculty);
	}

	public List<RegistrationForFaculty> showAllRegFaculty() {
		logger.debug("Show all Applications for Faculty {}");

		return registrationForFacultyRepository.findAll();
	}

	public void deleteById(Integer id) {
		logger.debug("Delete Application by id {} :" + id);

		registrationForFacultyRepository.deleteById(id);
	}

}
