package test20.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReplyDto {

	private String replyno;
	private String userno;
	private String boardno;
	private String replycontent;
	private String name;
	private Timestamp nowdate;
	
	
}
