package model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class Order {

	private int id;
	private int userid;
	private Timestamp date;

	public Order() {
	}

	public Order(int userid, Timestamp date) {
		this.userid = userid;
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	private Set<Orderitem> orderitems = new HashSet<Orderitem>();

	public Set<Orderitem> getOrderitems() {
		return orderitems;
	}

	public void setOrderitems(Set<Orderitem> orderitems) {
		this.orderitems = orderitems;
	}
}
