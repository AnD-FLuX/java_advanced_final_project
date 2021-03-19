package ua.lviv.lgs.mapper;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import ua.lviv.lgs.dao.SubjectRepository;
import ua.lviv.lgs.domain.Faculty;
import ua.lviv.lgs.domain.Subject;

@Controller
public class FacultyDtoMapper {
	@Autowired
	private SubjectRepository subjectRepository;

	public Faculty createEntity(String name, Integer numberOfStudents, List<Subject> subjects) throws IOException {

		Faculty faculty = new Faculty();
		List<String> collect = subjects.stream().map(subject -> subject.getName()).collect(Collectors.toList());
		List<Subject> allByNameLike = subjectRepository.getAllByNameIn(collect);
		mapSubjects(subjects, allByNameLike);
		faculty.setName(name);
		faculty.setNumberOfStudents(numberOfStudents);
		faculty.setSubjects(subjects);

		return faculty;
	}

	private void mapSubjects(List<Subject> needSubjects, List<Subject> existSubjects) {

		for (Subject needSubject : needSubjects) {
			for (Subject existSubject : existSubjects) {
				if (needSubject.getName().equalsIgnoreCase(existSubject.getName())) {
					needSubject.setId(existSubject.getId());
				}
			}
		}

	}
}
