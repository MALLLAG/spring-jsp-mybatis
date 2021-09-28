package test20.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class MessageDto {
	private String messageno;
	private String sno;
	private String rno;
	private String mcontent;
}
