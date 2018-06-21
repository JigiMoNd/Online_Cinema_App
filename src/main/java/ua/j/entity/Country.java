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
		
		@ManyToMany(mappedBy = "country")
		private List<Movie> movie = new ArrayList<>();
		
		
}
