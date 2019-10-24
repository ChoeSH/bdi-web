package com.bdi.test.test01;

public class SplitTest {

	public static void main(String[] args) {
		String hobby = "movie,game";
		String[] hobbies = hobby.split(",");
		String hob1 = "study";
		System.out.println(hobbies.length);
		System.out.println(hobbies[0]);
		System.out.println(hobbies[1]);
		for(String str:hobbies) {
			if(str.equals(hob1)) {
				System.out.println("checked");
				break;
			}
		}
		
	}
}
