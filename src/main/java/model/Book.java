package model;

import java.sql.Timestamp;

public class Book {

	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", \"title\":\"" + title + "\", \"author\":\"" + author + "\", \"price\":\""
				+ price + "\", \"publisher\":\"" + publisher + "\", \"date\":\"" + date + "\", \"image\":\"" + image
				+ "\", \"stock\":\"" + stock + "\", \"detail\":\"" + detail + "\", \"type\":\"" + type + "\"}";
	}

	private int id;
	private String title;
	private String author;
	private double price;
	private String publisher;
	private Timestamp date;
	private String image;
	private int stock;
	private String detail;
	private String type;

	public Book() {
	}

	public Book(String title, String author, double price, String publisher,
			Timestamp date, String image, int stock, String detail, String type) {
		this.title = title;
		this.author = author;
		this.price = price;
		this.publisher = publisher;
		this.date = date;
		this.image = image;
		this.stock = stock;
		this.detail = detail;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public double getPrice() {
		return price / 100.0;
	}

	public void setPrice(double price) {
		this.price = price * 100.0;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
