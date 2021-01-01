package com.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	@Id
	@Column(name="category_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cId;
	@Column(name="category_title")
	private String cTitle;
	@Column(name="category_description", length = 1500)
	private String cDesc;
	@OneToMany(mappedBy = "category")
	private List<Product> products = new ArrayList<Product>();
	
	public Category(int cId, String cTitle, String cDesc, List<Product> products) {
		super();
		this.cId = cId;
		this.cTitle = cTitle;
		this.cDesc = cDesc;
		this.products = products;
	}

	public Category(int cId, String cTitle, String cDesc) {
		super();
		this.cId = cId;
		this.cTitle = cTitle;
		this.cDesc = cDesc;
	}

	public Category(String cTitle, String cDesc) {
		super();
		this.cTitle = cTitle;
		this.cDesc = cDesc;
	}

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcDesc() {
		return cDesc;
	}

	public void setcDesc(String cDesc) {
		this.cDesc = cDesc;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Category [cId=" + cId + ", cTitle=" + cTitle + ", cDesc=" + cDesc + "]";
	}
	
	
	

}
