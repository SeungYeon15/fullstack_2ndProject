package com.model.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	int duplicatedId(String id);
	int duplicatedEmail(String email);
	int create(MemberDTO dto);
	int loginCheck(Map<String,String> map);
	Map<String,String> getGrade(String id);
	int total(Map map);
	List<MemberDTO> list(Map map);
	MemberDTO read(String id);
	int update(MemberDTO dto);
	MemberDTO mypage(String id);
	int updateFile(Map map);
	int delete(MemberDTO dto);
	List<Map> findID(Map map);
	List<Map> findPass(Map<String, String> map);
}
