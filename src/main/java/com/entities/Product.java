package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private int pId;
	@Column(name = "product_title")
	private String pTitle;
	@Column( name = "product_description", length = 1500)
	private String pDesc;
	@Column(name = "product_pic")
	private String pPic;
	@Column(name = "product_price")
	private int pPrice;
	@Column(name = "product_discount")
	private int pDiscount;
	@Column(name = "product_quantity")
	private int pQuantity;
	@ManyToOne
	private Category category;
	public Product(int pId, String pTitle, String pDesc, String pPic, int pPrice, int pDiscount, int pQuantity, Category category) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.pDesc = pDesc;
		this.pPic = pPic;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category = category;
	}
	public Product(String pTitle, String pDesc, String pPic, int pPrice, int pDiscount, int pQuantity) {
		super();
		this.pTitle = pTitle;
		this.pDesc = pDesc;
		this.pPic = pPic;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpDiscount() {
		return pDiscount;
	}
	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}
	public int getpQuantity() {
		return pQuantity;
	}
	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pTitle=" + pTitle + ", pDesc=" + pDesc + ", pPic=" + pPic + ", pPrice="
				+ pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + "]";
	}
	

	public int getPriceAfterDiscount()
	{
		int discountPrice = (int)((this.getpDiscount() / 100.0 )* this.getpPrice());
		return (this.getpPrice() - discountPrice);
	}
}
