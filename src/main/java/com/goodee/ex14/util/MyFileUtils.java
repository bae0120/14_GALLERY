package com.goodee.ex14.util;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;
import java.util.regex.Matcher;

public class MyFileUtils {
	//파일명을 UUID(고유 식별자)로 변환
	public static String getUuidName(String filename) {
		//확장자
		String extension;
		if(filename.endsWith("tar.gz")) {
			extension = "tar.gz";
		} else if(filename.endsWith("tar.bz2")) {
			extension = "tar.bz2";
		} else {
			String[] arr = filename.split("\\.");			
			extension = filename.split("\\.")[arr.length - 1];
		}
		//split으로 하면 조심해야함 split()은 정규식을 받음. split(".")는 정규식의 모든 문자를 의미하는 .으로 인식하기 때문에 
		//다른 방법으로 .을 사용해야함
		//해결법 : split("[.]"), split("\\.")
		
		//파일명(UUID) + 확장자
		return UUID.randomUUID().toString().replaceAll("\\-", "") + "." + extension;
		//replaceAll()도 정규식을받음
		
	}
	
	
	//오늘 경로
	public static String getTodayPath() {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		String sep = Matcher.quoteReplacement(File.separator); //File.separator = 구분자
		
		return "C:" + sep + "upload" + sep + year + sep + month + sep + day;
	}
	
	//어제 경로
	public static String getYesterdayPath() {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -1);
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		String sep = Matcher.quoteReplacement(File.separator); //File.separator = 구분자
		
		return "C:" + sep + "upload" + sep + year + sep + month + sep + day;
	}
	
	
	
	
}
