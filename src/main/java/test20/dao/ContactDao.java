package test20.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import test20.dto.ContactDto;

@Repository
public class ContactDao {
	
	private static final String namespace = "contactmapper.";
	
	private final SqlSession ss;
	
	@Inject
	public ContactDao(SqlSession ss) {
		this.ss = ss;
	}

	public void contactSave(ContactDto dto) throws Exception{
		ss.insert("contactSave", dto);
	}
	

	
}
