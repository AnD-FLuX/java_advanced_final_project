package ua.lviv.lgs.service;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.dao.FacultyRepository;
import ua.lviv.lgs.domain.Faculty;

@Service
public class FacultyService {

	private Logger logger = LoggerFactory.getLogger(FacultyService.class);

	@Autowired
	private FacultyRepository facultyRepository;

	public void save(Faculty faculty) {
		logger.debug("Create new faculty {} :" + faculty);

		facultyRepository.save(faculty);
	}

	public List<Faculty> getAllFaculties() {
		logger.debug("Get all Faculties {}");

		return facultyRepository.findAll();
	}

	public Optional<Faculty> findById(Integer id) {
		logger.debug("Find Faculty by id {} :" + id);

		return facultyRepository.findById(id);
	}

	public void deleteById(Integer id) {
		logger.debug("Delete Faculty by id {} :" + id);
		
		facultyRepository.deleteById(id);
	}

}
