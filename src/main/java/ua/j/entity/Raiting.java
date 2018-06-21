package ua.j.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "raiting")
@NoArgsConstructor
@Getter @Setter
public class Raiting {

	@Id
	private String id;
/*	
	public Raiting(String id) {
		this.id = "u" + user.getId() + "m" + movie.getId();
	}
*/	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "movie_id")
	private Movie movie;
	
	@Column(name = "raiting")
	private int raiting;
	
}
