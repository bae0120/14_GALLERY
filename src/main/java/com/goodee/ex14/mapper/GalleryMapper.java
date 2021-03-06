package com.goodee.ex14.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.ex14.domain.FileAttachDTO;
import com.goodee.ex14.domain.GalleryDTO;

@Mapper
public interface GalleryMapper {
	
	//갤러리, 파일 첨부 추가
	public int insertGallery(GalleryDTO gallery);
	public int insertFileAttach(FileAttachDTO fileAttach);
	
	//갤러리 목록
	public int selectGalleryCount();
	public List<GalleryDTO> selectGalleryList(Map<String, Object> map);
	
	//갤러리 상세보기
	public GalleryDTO selectGalleryByNo(Long galleryNo);
	public List<FileAttachDTO> selectFileAttachListInTheGallery(Long galleryNo);
	public int updateGalleryHit(Long galleryNo);
	public FileAttachDTO selectFileAttachByNo(Long fileAttachNo);
	public int updateDownloadCnt(Long fileAttachNo);
	
	//갤러리 수정
	public int updateGallery(GalleryDTO gallery);
	
	//첨부 파일 삭제
	public int deleteFileAttach(Long fileAttachNo);
	
	//갤러리 삭제
	public int deleteGallery(Long galleryNo);
	
	//어제 저장된 첨부 파일 목록
	public List<FileAttachDTO> selectFileAttachListAtYesterday();
	
}