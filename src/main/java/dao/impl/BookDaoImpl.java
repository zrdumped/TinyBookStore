package dao.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import model.Book;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.BookDao;

public class BookDaoImpl extends HibernateDaoSupport implements BookDao {

	public Integer save(Book book) {
		return (Integer) getHibernateTemplate().save(book);
	}

	public void delete(Book book) {
		getHibernateTemplate().delete(book);
	}

	public void update(Book book) {
		getHibernateTemplate().merge(book);
	}

	public Book getBookById(int id) {
		@SuppressWarnings("unchecked")
		List<Book> books = (List<Book>) getHibernateTemplate().find(
				"from Book as b where b.id=?", id);
		Book book = books.size() > 0 ? books.get(0) : null;
		return book;
	}

	public List<Book> getAllBooks() {
		@SuppressWarnings("unchecked")
		List<Book> books = (List<Book>) getHibernateTemplate()
				.find("from Book");
		return books;
	}
	
	public Book getBookByName(String name){
		@SuppressWarnings("unchecked")
		List<Book> books = (List<Book>) getHibernateTemplate()
				.find("from Book as b where b.title = ?", name);
		return books.get(0);
	}
	
	public List<Book> searchBooks(String key) throws UnsupportedEncodingException{
		key = new String(key.getBytes("ISO-8859-1"),"utf-8");
		@SuppressWarnings("unchecked")
		List<Book> books = (List<Book>) getHibernateTemplate()
				.find("from Book as b where b.title like ? or b.type like ?", '%'+key+'%', key);
		System.out.println(books.size()+"wlejfhwkehfkwe");
		return books;
	}

}
