package ua.lviv.lgs.service;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.dao.EntrantRepository;
import ua.lviv.lgs.domain.Entrant;

@Service
public class EntrantService {

	private Logger logger = LoggerFactory.getLogger(EntrantService.class);

	@Autowired
	private EntrantRepository entrantRepository;

	public void save(Entrant entrant) {
		logger.debug("Create new Entrant {} :" + entrant);

		entrantRepository.save(entrant);
	}

	public List<Entrant> getAllEntrants() {
		logger.debug("Get all Entrants {}");

		return entrantRepository.findAll();
	}

	public Optional<Entrant> findById(Integer id) {
		logger.debug("Get Entrant by id {} :" + id);

		return entrantRepository.findById(id);
	}

}
