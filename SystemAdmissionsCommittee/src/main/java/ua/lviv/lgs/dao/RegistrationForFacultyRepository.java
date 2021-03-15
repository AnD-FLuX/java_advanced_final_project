package ua.lviv.lgs.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ua.lviv.lgs.domain.RegistrationForFaculty;

@Repository
public interface RegistrationForFacultyRepository extends JpaRepository<RegistrationForFaculty, Integer> {

}
