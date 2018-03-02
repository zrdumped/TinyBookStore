package dao.impl;

import java.util.List;

import model.Cart;
import model.Order;
import model.User;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.UserDao;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	public Integer save(User user) {
		return (Integer) getHibernateTemplate().save(user);
	}

	public void delete(User user) {
		getHibernateTemplate().delete(user);
	}

	public void update(User user) {
		getHibernateTemplate().merge(user);
	}

	public User getUserById(int id) {
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) getHibernateTemplate().find(
				"from User as u where u.id=?", id);
		User user = users.size() > 0 ? users.get(0) : null;
		return user;
	}

	public List<User> getAllUsers() {
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) getHibernateTemplate()
				.find("from User");
		return users;
	}
	
	public User login(String username, String password){
		List<User> u = (List<User>) this.getHibernateTemplate().find("from User where username=? and password=?", username, password);
	if(u.size()>0){
		return u.get(0);
	}
	return null;
	}
	
	public Integer signup(String username, String password){
		List<User> u = (List<User>) this.getHibernateTemplate().find("from User where username=? ", username);
	if(u.size()>0){
		return -1;
	}
	else{
		User user = new User(username, password, "user");
		return (Integer)getHibernateTemplate().save(user);
	}
	}
	
	public User getUserByUsername(String username){
		List<User> u = (List<User>) this.getHibernateTemplate().find("from User where username=? ", username);
		return u.get(0);
	}
	
}
