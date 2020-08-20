package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.WriterVO;

@Repository("writerDAO")
public class WriterDAOImpl implements WriterDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public int insertWriter(WriterVO vo) {
		int result = mybatis.insert("WriterDAO.insertWriter", vo);
		return result;
	}


	public List<WriterVO> selectWriter(WriterVO vo) {
		List<WriterVO> writer = mybatis.selectList("WriterDAO.selectWriter", vo);
		return writer;
	}


	public int updateWriter(WriterVO vo) {
		int result = mybatis.update("WriterDAO.updateWriter", vo);
		return result;
	}


	public int deleteWriter(WriterVO vo) {
		int result = mybatis.delete("WriterDAO.deleteWriter", vo);
		return result;
	}


	@Override
	public List<WriterVO> selectWriterSearchByName(String searchWord) {
		return mybatis.selectList("WriterDAO.selectWriterSearchByName", searchWord);
	}


	@Override
	public WriterVO selectWriterByWriterId(WriterVO vo) {
		return mybatis.selectOne("WriterDAO.selectWriterByWriterId", vo);
	}


	@Override
	public List<WriterVO> selectWriterSearchByNameWithPaging(Map map) {
		return mybatis.selectList("WriterDAO.selectWriterSearchByNameWithPaging", map);
	}


	@Override
	public int selectWriterCntByNameWithPaging(String searchWord) {
		return mybatis.selectOne("WriterDAO.selectWriterCntByNameWithPaging", searchWord);
	}
	
	
	
	
}
