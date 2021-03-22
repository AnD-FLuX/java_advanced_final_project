package ua.lviv.lgs.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.dao.SubjectRepository;
import ua.lviv.lgs.domain.Subject;

@Service
public class SubjectService {
	
	private Logger logger = LoggerFactory.getLogger(SubjectService.class);
	
	@Autowired
	private SubjectRepository subjectRepository;

	public List<Subject> getAllSubjects(){
		logger.debug("Get all Subjects {}");
		
		return subjectRepository.findAll();
	}
	
}
