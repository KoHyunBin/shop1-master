package logic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Sale {	
	private int saleid;
	private String userid;
	private Date saledate;
	private User user;
	private List<SaleItem> itemList = new ArrayList<>(); //주문상품목록
	public int getTotal() { //주문상품 전체 금액 리턴
		int sum = 0;
		 //  (상품가격*주문수량 )의 전체 가격의 합
/*		
		for(SaleItem s : itemList) {
			sum += s.getItem().getPrice() * s.getQuantity();
		}
		return sum;
*/
		return itemList.stream()
			 .mapToInt(s->s.getItem().getPrice() * s.getQuantity()).sum(); 
	}
	//setter, getter, toString
	public int getSaleid() {
		return saleid;
	}
	public void setSaleid(int saleid) {
		this.saleid = saleid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getSaledate() {
		return saledate;
	}
	public void setSaledate(Date saledate) {
		this.saledate = saledate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<SaleItem> getItemList() {
		return itemList;
	}
	public void setItemList(List<SaleItem> itemList) {
		this.itemList = itemList;
	}
	@Override
	public String toString() {
		return "Sale [saleid=" + saleid + ", userid=" + userid + ", saledate=" + saledate + ", user=" + user + "]";
	}
	
}
