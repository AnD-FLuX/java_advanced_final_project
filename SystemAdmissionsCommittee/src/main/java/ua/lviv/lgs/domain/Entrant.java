package ua.lviv.lgs.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "entrant")
public class Entrant {

	@OneToOne
	@MapsId
	@JoinColumn(name = "user_id")
	private User userId;

	@Column
	private String city;

	@Column
	private String school;

	@Column
	private String uploadPhoto;

	public Entrant() {
	}

	public Entrant(User userId, String city, String school, String uploadPhoto) {
		this.userId = userId;
		this.city = city;
		this.school = school;
		this.uploadPhoto = uploadPhoto;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result + ((school == null) ? 0 : school.hashCode());
		result = prime * result + ((uploadPhoto == null) ? 0 : uploadPhoto.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
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
		if (school == null) {
			if (other.school != null)
				return false;
		} else if (!school.equals(other.school))
			return false;
		if (uploadPhoto == null) {
			if (other.uploadPhoto != null)
				return false;
		} else if (!uploadPhoto.equals(other.uploadPhoto))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Entrant [userId=" + userId + ", city=" + city + ", school=" + school + ", uploadPhoto=" + uploadPhoto + "]";
	}

}
