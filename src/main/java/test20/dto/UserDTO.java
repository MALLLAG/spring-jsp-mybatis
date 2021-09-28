package test20.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
	
	private String userno;
	private String name;
	private String email;
	private String password;
	private String phonnumber;
	private String roletype;
	private String address;
	private String img;
	private String avg;
}
