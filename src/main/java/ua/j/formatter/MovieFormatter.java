package ua.j.formatter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import ua.j.entity.Movie;

@Component
public class MovieFormatter implements Formatter<Movie>{

	@Override
	public String print(Movie movie, Locale arg1) {
		return String.valueOf(movie.getId());
	}

	@Override
	public Movie parse(String objId, Locale arg1) throws ParseException {
		Movie movie = new Movie();
		movie.setId(Integer.valueOf(objId));
		return movie;
	}

}