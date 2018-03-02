package dao.impl;

import java.util.List;

import model.Orderitem;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.OrderitemDao;

public class OrderitemDaoImpl extends HibernateDaoSupport implements
		OrderitemDao {

	public Integer save(Orderitem orderitem) {
		int value = (Integer) getHibernateTemplate().save(orderitem);
		getHibernateTemplate().flush();
		getHibernateTemplate().clear();
		return value;
	}

	public void delete(Orderitem orderitem) {
		getHibernateTemplate().delete(orderitem);
	}

	public void update(Orderitem orderitem) {
		getHibernateTemplate().merge(orderitem);
	}

	public Orderitem getOrderitemById(int id) {
		@SuppressWarnings("unchecked")
		List<Orderitem> orderitems = (List<Orderitem>) getHibernateTemplate()
				.find("from Orderitem as oi where oi.id=?", id);
		Orderitem orderitem = orderitems.size() > 0 ? orderitems.get(0) : null;
		return orderitem;
	}

	public List<Orderitem> getAllOrderitems() {
		@SuppressWarnings("unchecked")
		List<Orderitem> orderitems = (List<Orderitem>) getHibernateTemplate()
				.find("from Orderitem");
		return orderitems;
	}

}
