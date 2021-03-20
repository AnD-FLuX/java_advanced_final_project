package ua.lviv.lgs.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "entrant")
public class Entrant {

	@Id
	@Column
	private Integer id;

	@Column
	private String city;

	@Column
	private String school;

	private String uploadPhoto;

	@OneToOne
	@MapsId
	private User user;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "entrant")
	@Column(nullable = false)
	private Set<RegistrationForFaculty> registrationForFaculty;

	public Entrant() {
	}

	public Entrant(String city, String school) {
		this.city = city;
		this.school = school;
	}

	public Entrant(Integer id, String city, String school) {
		this.id = id;
		this.city = city;
		this.school = school;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getUploadPhoto() {
		return uploadPhoto;
	}

	public void setUploadPhoto(String uploadPhoto) {
		this.uploadPhoto = uploadPhoto;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<RegistrationForFaculty> getRegistrationForFaculty() {
		return registrationForFaculty;
	}

	public void setRegistrationForFaculty(Set<RegistrationForFaculty> registrationForFaculty) {
		this.registrationForFaculty = registrationForFaculty;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((school == null) ? 0 : school.hashCode());
		result = prime * result + ((uploadPhoto == null) ? 0 : uploadPhoto.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Entrant other = (Entrant) obj;
		if (city == null) {
			if (other.city != null)
				return false;
		} else if (!city.equals(other.city))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (school == null) {
			if (other.school != null)
				return false;
		} else if (!school.equals(other.school))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Entrant [id=" + id + ", city=" + city + ", school=" + school + "]";
	}

}
