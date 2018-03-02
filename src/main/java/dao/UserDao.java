package dao;

import java.util.List;

import model.Cart;
import model.Order;
import model.User;

public interface UserDao {

	public Integer save(User user);

	public void delete(User user);

	public void update(User user);

	public User getUserById(int id);

	public List<User> getAllUsers();
	
	public User login(String username, String password);
	
	public Integer signup(String username, String password);
	
	public User getUserByUsername(String username);
	

}