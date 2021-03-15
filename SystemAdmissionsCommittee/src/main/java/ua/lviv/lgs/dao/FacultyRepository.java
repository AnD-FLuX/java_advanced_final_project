package ua.lviv.lgs.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ua.lviv.lgs.domain.Faculty;

@Repository
public interface FacultyRepository extends JpaRepository<Faculty, Integer> {

	Optional<Faculty> findByName(String name);
	
}
