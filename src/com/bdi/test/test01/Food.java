package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Food {
	private String name;
	private int price;
	private String etc;
	
	public Food(String name,int price,String etc){
		super();
		this.name=name;
		this.price=price;
		this.etc=etc;
	}
	@Override
	public String toString() {
		return "Food[name="+name+",price="+price+",etc="+etc+"]";
	}
	public static void addMenu(List<Food> menu, String name,int price, String etc) {
		Food f= new Food(name,price,etc);
		menu.add(f);
	}
	
	public static void main(String[] args) {
		List<Food> menus=new ArrayList<Food>();
		addMenu(menus,"치킨",20000,"JMT");
		addMenu(menus,"생맥주",5000,"500cc");
		addMenu(menus,"소주",4000,"330cc");	
		
		for(int i = 0; i < menus.size(); i++){
			System.out.println(menus.get(i)); 
		}
		
		System.out.println(menus.size());
		for(Food food : menus){
			System.out.println(menus.toString());
			}
	}
}
