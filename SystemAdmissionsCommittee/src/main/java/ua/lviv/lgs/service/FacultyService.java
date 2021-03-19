package ua.lviv.lgs.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.dao.FacultyRepository;
import ua.lviv.lgs.domain.Faculty;

@Service
public class FacultyService {

	@Autowired
	private FacultyRepository facultyRepository;

	public void save(Faculty faculty) {
		facultyRepository.save(faculty);
	}

	public List<Faculty> getAllFaculties() {
		return facultyRepository.findAll();
	}

	public Optional<Faculty> findById(Integer id) {
		return facultyRepository.findById(id);
	}

	public void deleteById(Integer id) {
		facultyRepository.deleteById(id);
	}
}
