package test20.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import test20.dto.MessageDto;

@Repository
public class MessageDao {

	private static final String namespace = "messagemapper.";
	
	private final SqlSession ss;
	
	@Inject
	public MessageDao(SqlSession ss) {
		this.ss = ss;
	}
	
	public List<MessageDto> selectMessageList(String rno) throws Exception{
		return ss.selectList(namespace + "selectMessageList", rno);
	}
	
	public MessageDto selectMessageOne(String rno) throws Exception{
		return ss.selectOne(namespace + "selectMessageOne", rno);
	}
	
	public void insertMessage(MessageDto dto) throws Exception{
		ss.insert(namespace + "insertMessage", dto);
	}
	
	public void deleteMessage(String messageno) throws Exception{
		ss.delete(namespace + "deleteMessageOne", messageno);
	}
	
	public MessageDto messageRead(String messageno) throws Exception{
		return ss.selectOne(namespace + "messageRead", messageno);
	}
	
}
