package ua.j.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ua.j.entity.enums.AgeLimit;

@Entity
@Table(name = "movie")
@NoArgsConstructor
@Getter @Setter
public class Movie extends BaseEntity {

	private String name; 
	
	private int year;

	private int length;
	
	private int rating;
	
	public Movie(int rating) {
		
		int sum = 0;
		int e = 0;
		int total = 0;
		    for (Raiting r : raiting) {
		    	if(r.getMovie().getId().equals(super.getId())) {
		    		e = r.getRaiting();
		    		total++;
		    	} else {
		    		e = 0;
		    	}
		      sum += e;
		      
		    }
		this.rating = sum/total;
		}
	
	
	@OneToMany(mappedBy = "movie")
	private List<Raiting> raiting = new ArrayList<>();

	@Column(length = 500)
	private String description;
	
	@Column(name = "age_limit")
	@Enumerated(EnumType.STRING)
	private AgeLimit ageLimit;
	
	@ManyToMany(cascade = {
			CascadeType.DETACH,
			CascadeType.MERGE,
			CascadeType.PERSIST,
			CascadeType.REFRESH
	})
	@JoinTable(name = "movie_genre",
			joinColumns = @JoinColumn(name = "movie_id"),
			inverseJoinColumns = @JoinColumn(name = "genre_id"))
	private List<Genre> genre = new ArrayList<>();
	
	@Column(name = "image_url")
	private String imageUrl;
	
	@Column(name = "player_url")
	private String playerUrl;
	
	@ManyToMany
	@JoinTable(name = "movie_country",
	joinColumns = @JoinColumn(name = "movie_id"),
	inverseJoinColumns = @JoinColumn(name = "country_id"))
	private List<Country> country = new ArrayList<Country>();
		
	@ManyToMany(mappedBy = "movie")
	private List<Actor> actor = new ArrayList<>();
	
}
