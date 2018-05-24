package ua.j.entity.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum AgeLimit {

	LIMIT_1("3+"), LIMIT_2("12+"), LIMIT_3("16+"), LIMIT_4("18+");
	
	private String limit;
	
}
