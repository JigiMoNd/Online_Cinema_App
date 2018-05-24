package ua.j.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor
@Table(name = "country")
@Getter @Setter
public class Country extends BaseEntity {

		private String name;
		
		@OneToMany(mappedBy = "country")
		private List<Actor> actor = new ArrayList<Actor>();
		
		@ManyToMany
		@JoinTable(name = "country_movie",
				joinColumns = @JoinColumn(name = "country_id"),
				inverseJoinColumns = @JoinColumn(name = "movie_id"))
		private List<Movie> movie = new ArrayList<Movie>();
		
		
}
