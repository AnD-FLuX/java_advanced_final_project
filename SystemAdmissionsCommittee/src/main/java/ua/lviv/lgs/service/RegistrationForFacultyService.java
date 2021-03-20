package ua.lviv.lgs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.dao.RegistrationForFacultyRepository;
import ua.lviv.lgs.domain.RegistrationForFaculty;

@Service
public class RegistrationForFacultyService {

	@Autowired
	private RegistrationForFacultyRepository registrationForFacultyRepository;

	public void save(RegistrationForFaculty registrationForFaculty) {
		registrationForFacultyRepository.save(registrationForFaculty);
	}

	public List<RegistrationForFaculty> showAllEntrants() {
		return registrationForFacultyRepository.findAll();
	}

}
