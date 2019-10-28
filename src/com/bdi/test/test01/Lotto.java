package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class Lotto {
	
	public List<Integer> getlotto() {
	List<Integer> lottoList = new ArrayList<Integer>();
	
	Random r = new Random();
	for(int i=0; i<=6; i++) {
		int rNum = r.nextInt(45)+1;	//nextInt(45)는 44까지의 수 +1을 해서 1~45까지의 수
		System.out.println(i+"번째 : "+rNum);
	if(lottoList.indexOf(rNum)==-1) {
		lottoList.add(rNum);
	}else{
		i--;
	}
	}
	Collections.sort(lottoList);
	System.out.println(lottoList);
	
	return lottoList;
	
}
	

	public static void main(String[] args) {
	}
}
		

