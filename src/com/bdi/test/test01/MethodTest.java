package com.bdi.test.test01;

class Mother{
	int a=3;
	
	Mother(){
		System.out.println("난 mother꺼");
	}
	Mother(int a){
		System.out.println("난 mother 두번째꺼");
	}
	
	public void test() {
		System.out.println("난 엄마꺼");
	}
}
public class MethodTest extends Mother{
	int a=123;			//변수는 오버라이딩이 되지 않고 각각의 것이 출력된다.
	
	MethodTest(){
		super(2);		//super(int)를 사용하면 Mother(int)메소드를 가장 먼저 호출한다.
		System.out.println("난 method꺼");
	}
	
	public void test() {
		System.out.println("test() 메소드");
	}
	
	public void test(int a, int b) {
		System.out.println(a+b);
	}
	
	public void test(int a, String b) {
		System.out.println(a+b);
	}
	
	public static void main(String[] args) {
		Mother mt = new MethodTest();	//Mother mt = new MethodTest();에서는 mother의 변수가 출력 a=3
		mt.test();
		System.out.println(mt.a);		//선언한 변수의 데이터 타입이 중요하다.
	}
}
