package test20.dto;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ContactDto {

	private String contactno;
	private String name;
	private String company;
	private String email;
	private String phonnumber;
	private String message;
	private Timestamp createdate;
	
}
