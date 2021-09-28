package test20.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import test20.dto.RatingDto;

@Repository
public class RatingDao {

	private static final String namespace = "ratingmapper.";
	
	private final SqlSession ss;
	
	@Inject
	public RatingDao(SqlSession ss) {
		this.ss = ss;
	}
	
	public List<RatingDto> selectRatingList(String adminno) throws Exception{
		return ss.selectList(namespace + "selectRatingList", adminno);
	}
	
	public RatingDto selectRatingOne(String ratingno) throws Exception{
		return ss.selectOne(namespace + "selectRatingOne", ratingno);
	}
	
	public void insertRating(RatingDto dto) throws Exception{
		ss.insert(namespace + "insertRating", dto);
	}
	
	public void updateRating(RatingDto dto) throws Exception{
		ss.update(namespace + "updateRating", dto);
	}
	
	public void deleteRating(String ratingno) throws Exception{
		ss.delete(namespace + "deleteRatingOne", ratingno);
	}
	
	public String selectCount(RatingDto dto) throws Exception{
		return ss.selectOne(namespace + "selectCount", dto);
	}
	
}
