package ua.j.formatter;



import java.text.ParseException;
import java.util.Locale;

import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import ua.j.entity.Genre;

@Component
public class GenreFormatter implements Formatter<Genre> {

	@Override
	public Genre parse(String objId, Locale arg1) throws ParseException {
		Genre genre = new Genre();
		genre.setId(Integer.valueOf(objId));
		return genre;
	}

	@Override
	public String print(Genre genre, Locale arg1) {
		return String.valueOf(genre.getId());
	}

}
