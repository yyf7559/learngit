package service;

import dao.book.BookMapper;
import entity.Book;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Resource
    private BookMapper bookMapper;

    @Override
    public List<Book> find(String book_name, Integer is_borrow,
                          Integer book_type, Integer pageNo,
                          Integer pageSize) {
        return bookMapper.all(book_name, is_borrow, book_type, (pageNo - 1) * pageSize, pageSize);
    }

    @Override
    public int totalCount(String book_name, Integer is_borrow, Integer book_type) {
        return bookMapper.totalCount(book_name, is_borrow, book_type);
    }
}
