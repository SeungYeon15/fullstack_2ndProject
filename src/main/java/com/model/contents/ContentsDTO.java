package com.model.contents;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
public class ContentsDTO {
	private int contentsno;
	private int cateno;
	private String pname;
	private int price;
	private String filename;
	private MultipartFile filenameMF;
	private String detail;
	private String rdate;
	private int stock;
}
