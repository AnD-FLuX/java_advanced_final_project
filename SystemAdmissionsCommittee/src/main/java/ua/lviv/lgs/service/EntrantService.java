package ua.lviv.lgs.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.dao.EntrantRepository;
import ua.lviv.lgs.domain.Entrant;

@Service
public class EntrantService {

	@Autowired
	private EntrantRepository entrantRepository;

	public void save(Entrant entrant) {
		entrantRepository.save(entrant);
	}

	public List<Entrant> getAllEntrants() {
		return entrantRepository.findAll();
	}

	public Optional<Entrant> findById(Integer id) {
		return entrantRepository.findById(id);
	}

}
