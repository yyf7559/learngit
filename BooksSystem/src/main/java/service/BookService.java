package service;

import entity.Book;

import java.util.List;

public interface BookService {
    List<Book> find(String book_name, Integer is_borrow, Integer book_type, Integer pageNo, Integer pageSize);

    int totalCount(String book_name, Integer is_borrow, Integer book_type);
}
