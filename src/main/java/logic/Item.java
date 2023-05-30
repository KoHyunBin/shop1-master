package logic;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

public class Item {
	private int id;
	@NotEmpty(message="상품명을 입력하세요")  //값이 없거나 빈문자열인 경우
	private String name;
	@Min(value=10,message="10원이상 가능합니다")
	@Max(value=100000,message="10만원이하만 가능합니다")
	private int price;
	@NotEmpty(message="상품설명을 입력하세요")
	private String description;
	private String pictureUrl;
	private MultipartFile picture; //picture file에서 업로드된 파일의 내용 
	
	//setter,getter, toString
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description
				+ ", pictureUrl=" + pictureUrl + ", picture=" + picture + "]";
	}
}
