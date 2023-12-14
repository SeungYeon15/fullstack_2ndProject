package com.model.contents;

import java.util.List;
import java.util.Map;

import com.model.bbs.ReplyDTO;

public interface ContentsService {
	int create(ContentsDTO dto);
	List<ContentsDTO> list(Map map);
	int total(Map map);
	ContentsDTO read(int contentsno);
	int update(ContentsDTO dto);
	int updateFile(Map map);
	List<Map> getCategory();
	List<ContentsDTO> mainlist(Map map);
	List<ReplyDTO> review(int contentsno);
	void newReview(Map<String, String> map);
}
