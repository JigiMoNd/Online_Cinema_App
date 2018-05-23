package ua.j.entity.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum SitStatus {

	FREE("FREE"), SOLD("SOLD");
	
	private String status;
	
}
