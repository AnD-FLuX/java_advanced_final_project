package ua.lviv.lgs.mapper;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import ua.lviv.lgs.domain.Entrant;
import ua.lviv.lgs.service.FileService;

@Controller
public class EntrantDtoMapper {

	@Autowired
	private FileService fileService;

	public Entrant createEntity(String city, String school, Integer certificatAvarageMark, MultipartFile uploadPhoto) throws IOException {

		Entrant entrant = new Entrant();

		entrant.setCity(city);
		entrant.setSchool(school);
		entrant.setCertificatAvarageMark(certificatAvarageMark);
		
		entrant.setUploadPhoto(fileService.saveFileAndReturnPathForDB(uploadPhoto, entrant.getCity()));

		return entrant;
	}

}
