package ua.j.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import ua.j.entity.enums.UserGender;
import ua.j.entity.enums.UserRole;

@Entity
@Table(name = "user")
@NoArgsConstructor
@Getter @Setter
@ToString(callSuper = true)
public class User extends BaseEntity{

	@NotEmpty(message = "This field can't be empty")
	@Column(name = "email", nullable = false)
	private String email;

	@NotEmpty(message = "This field can't be empty")
	@Column(name = "password", nullable = false)
	private String password;

	@Column(name = "role")
	@Enumerated(EnumType.ORDINAL)
	private UserRole role;
	
	@Column(name = "created_at")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdAt = new Date();

	@NotEmpty(message = "This field can't be empty")
	@Column(name = "first_name", length = 20)
	private String firstName; 

	@NotEmpty(message = "This field can't be empty")
	@Column(name = "last_name", length = 20)
	private String lastName; 

	@NotEmpty(message = "This field can't be empty")
	@Size(min = 5, max = 105, message = "Soory, but you are to young to registrate. \n(Or maby to old?)")
	@Column(name = "age")
	private int age;

	@Column(name = "gender")
	@Enumerated(EnumType.STRING)
	private UserGender gender; 

	@Column(name = "image_url", length = 500)
	private String imageUrl;
		
	private String token;
	
	 
	
	
	
	
	
	
	
}
