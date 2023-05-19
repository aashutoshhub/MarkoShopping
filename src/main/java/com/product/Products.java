package com.product;

public class Products {
	
	private int id;
	private String name;
	private int price;
	private String des;
	private String image;
	
	public Products(){
		
	}
	
	public Products(int id, String name, int price, String desc,String image) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.des = desc;
		this.image=image;
	}

	@Override
	public String toString() {
		return "Products [id=" + id + ", name=" + name + ", price=" + price + ", desc=" + des + ", image=" + image
				+ "]";
	}

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

	public String getDesc() {
		return des;
	}

	public void setDesc(String des) {
		this.des = des;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	

}
