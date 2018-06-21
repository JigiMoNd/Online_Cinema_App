package ua.j.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "genre")
@NoArgsConstructor
@Getter @Setter
public class Genre extends BaseEntity {

	private String genre;
	
	@ManyToMany(mappedBy = "genre")
	private List<Movie> movie = new ArrayList<>();
}
