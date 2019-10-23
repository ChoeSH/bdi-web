package com.bdi.test.test01;

import java.util.HashMap;
import java.util.Map;

public class Member {
	
	public static void necker(Map<String,String> map) {
		System.out.println("난 necker 메소드");
	}
	
	public static void test(Map<String,String> map) {
		map.put("1번","a");
		System.out.println(map);
		necker(map);
	}
	
	public static void main(String[] args) {
		Map<String,String> map=new HashMap<String,String>();
		test(map);
	}
}
