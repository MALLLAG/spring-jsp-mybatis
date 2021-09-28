package test20.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import test20.dto.UserDTO;
import test20.dto.BoardDto;
import test20.dto.RatingDto;


@Repository
public class UserDao {
	
	private static final String namespace = "usermapper.";
	
	private final SqlSession ss;
	
	@Inject
	public UserDao(SqlSession ss) {
		this.ss = ss;
	}
	
	public void saveForm(UserDTO dto) throws Exception{
		ss.insert(namespace + "saveForm", dto);
	}
	
	public UserDTO login(UserDTO dto) throws Exception{
		return ss.selectOne(namespace + "login", dto);
	}
	
	public String userInfo(UserDTO dto) throws Exception{
		return ss.selectOne(namespace + "userSelectOne", dto);
	}
	
	public void updateForm(UserDTO dto) throws Exception{
		ss.update(namespace + "updateForm", dto);
	}
	
	public List<UserDTO> selectUserList() throws Exception{
		return ss.selectList(namespace + "selectUserList");
	}
	
	public UserDTO selectAdminOne(String userno) throws Exception{
		return ss.selectOne(namespace + "selectAdminOne",userno);
	}
	
	public String selectAdminAvg(String adminno) throws Exception{
		return ss.selectOne(namespace + "selectAdminAvg", adminno);
	}
	
	public String findIdAfter(UserDTO dto) throws Exception{
			return ss.selectOne(namespace + "findId", dto);
		}
	public int check(String name) throws Exception{
		return ss.selectOne(namespace + "check", name);
	}
	
	public int emailcheck(String email) throws Exception{
		return ss.selectOne(namespace + "emailcheck",email);
	}

	
	public String findPasswordAfter(UserDTO dto) throws Exception{
		return ss.selectOne(namespace + "findPassword", dto);
	}
	
	public void deleteUser(String userno) throws Exception{
		ss.delete("deleteUser", userno);
	}
	
}
