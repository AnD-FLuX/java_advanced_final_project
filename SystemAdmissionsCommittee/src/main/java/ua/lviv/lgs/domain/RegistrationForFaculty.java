package ua.lviv.lgs.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "faculty_registrations")
public class RegistrationForFaculty {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@ElementCollection
	private List<Integer> marks;

	@Column
	private String uploadDocument;

	@ManyToOne()
	@JoinColumn(name = "faculty_id")
	private Faculty faculty;

	@ManyToOne()
	@JoinColumn(name = "entrant_id")
	private Entrant entrant;

	@Transient
	private Integer facultyId;

	@Transient
	private String email;

	@Column
	private Integer sumMarks;

	public RegistrationForFaculty() {
	}

	public RegistrationForFaculty(List<Integer> marks) {
		this.marks = marks;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Integer> getMarks() {
		return marks;
	}

	public void setMarks(List<Integer> marks) {
		this.marks = marks;
	}

	public String getUploadDocument() {
		return uploadDocument;
	}

	public void setUploadDocument(String uploadDocument) {
		this.uploadDocument = uploadDocument;
	}

	public Faculty getFaculty() {
		return faculty;
	}

	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}

	public Entrant getEntrant() {
		return entrant;
	}

	public void setEntrant(Entrant entrant) {
		this.entrant = entrant;
	}

	public int getFacultyId() {
		return facultyId;
	}

	public void setFacultyId(Integer facultyId) {
		this.facultyId = facultyId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getSumMarks() {
		return sumMarks;
	}

	public void setSumMarks(Integer sumMarks) {
		this.sumMarks = sumMarks;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((marks == null) ? 0 : marks.hashCode());
		return result;
	}

	@Override
	public String toString() {
		return "RegistrationForFaculty [id=" + id + ", marks=" + marks + ", uploadDocument=" + uploadDocument + "]";
	}

}