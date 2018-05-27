package ua.j.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "actor")
@NoArgsConstructor
@Getter @Setter
public class Actor extends BaseEntity {
	
	@Column(name = "full_name")
	private String fullName;
		
	@ManyToOne
	@JoinColumn(name = "country_id")
	private Country country;
	
	@Column(name = "birth_day")
	@Temporal(TemporalType.TIMESTAMP)
	private Date birthDay = new Date();
	
	@ManyToMany
	@JoinTable(name = "actor_movie",
	joinColumns = @JoinColumn(name = "actor_id"),
	inverseJoinColumns = @JoinColumn(name = "movie_id"))
	private List<Movie> movie = new ArrayList<Movie>();
	
	

}
