package ua.j.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "movie")
@NoArgsConstructor
@Getter @Setter
public class Movie extends BaseEntity {

	private String name;
	
	@Column(length = 500)
	private String description;
	
	private int length;
		
	@Column(name = "image_url")
	private String imageURL;
	
}
