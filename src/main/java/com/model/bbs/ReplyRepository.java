

package com.model.bbs;
 
import java.util.List;
 
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
 
public interface ReplyRepository extends CrudRepository<ReplyDTO, Integer> {
 
	ReplyDTO findByRnum(int rnum);
  
  @Query("select count(*) from ReplyDTO r where r.bbsno = :bbsno ")
  int count(@Param("bbsno") int contentsno);
  
  @Query(value="select rnum, content, regdate, id, bbsno "
      + "from reply r "
      + "where r.bbsno = ?1 "
      + "order by rnum desc "
      + "limit ?2, ?3 ", nativeQuery = true)
  List<ReplyDTO> findList(int bbsno, int sno, int eno);
 
}
 
