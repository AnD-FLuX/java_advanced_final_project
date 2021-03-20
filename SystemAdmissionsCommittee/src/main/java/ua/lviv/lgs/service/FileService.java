package ua.lviv.lgs.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;


public interface FileService {

	public String saveFileAndReturnPathForDB(MultipartFile multipartFile , String filename) throws IOException;
}
