package ua.lviv.lgs.mapper;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import ua.lviv.lgs.domain.Entrant;
import ua.lviv.lgs.domain.Faculty;
import ua.lviv.lgs.domain.RegistrationForFaculty;
import ua.lviv.lgs.service.FileService;

@Controller
public class RegistrationForFacultyDtoMapper {

	@Autowired
	private FileService fileService;

	public RegistrationForFaculty createEntity(MultipartFile fileDocument, Faculty faculty,
			Entrant entrant, List<Integer> marks) throws IOException {

		RegistrationForFaculty registrationForFaculty = new RegistrationForFaculty();
		
		registrationForFaculty.setFaculty(faculty);
		registrationForFaculty.setEntrant(entrant);
		registrationForFaculty.setMarks(marks);
		
		registrationForFaculty.setUploadDocument(fileService.saveFileAndReturnPathForDB(fileDocument,
				entrant.getUser().getFirstName() + "_" + entrant.getUser().getLastName() + "_document"));

		return registrationForFaculty;
	}
}
