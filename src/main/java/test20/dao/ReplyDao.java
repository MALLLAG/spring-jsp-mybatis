package test20.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import test20.dto.ReplyDto;

@Repository
public class ReplyDao {

	private static final String namespace = "replymapper.";
	
	private final SqlSession ss;
	
	@Inject
	public ReplyDao(SqlSession ss) {
		this.ss = ss;
	}
	
	
	public List<ReplyDto> selectReplyList(String boardno) throws Exception{
		return ss.selectList(namespace + "selectReplyList", boardno);
	}
	
	public ReplyDto selectReplyOne(String replyno) throws Exception{
		return ss.selectOne(namespace + "selectReplyOne", replyno);
	}
	
	public void insertReply(ReplyDto dto) throws Exception{
		ss.insert(namespace + "insertReply", dto);
	}
	
	public void deleteReply(String replyno) throws Exception{
		ss.delete(namespace + "deleteReplyOne", replyno);
	}
	
}
