package exception;

//예외처리 생략 가능 예외클래스
public class CartEmptyException extends RuntimeException{
	private String url;
	//생성자
	public CartEmptyException(String msg,String url) {
		super(msg);  //getMessage() 메서드로 조회 가능
		this.url = url;  //getUrl() 메서드로 조회 가능
	}
	public String getUrl() {
		return url;
	}
}
