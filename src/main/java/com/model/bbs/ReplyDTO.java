package com.model.bbs;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
@Entity
@Table(name = "reply")
public class ReplyDTO {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int rnum;
	private int bbsno;
	private String content;
	private LocalDate regdate;
	private String id;
	private int contentsno;
	private int star;
}
