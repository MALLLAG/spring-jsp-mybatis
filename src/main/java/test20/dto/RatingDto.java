package test20.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class RatingDto {

	private String ratingno;
	private String userno;
	private String adminno;
	private String rating;
	private String rcontent;
	
}
