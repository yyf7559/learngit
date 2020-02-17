package dao.book;

import entity.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    List<Book> all(@Param("book_name") String book_name, @Param("is_borrow") Integer is_borrow,
                   @Param("book_type") Integer book_type, @Param("pageNo") Integer pageNo,
                   @Param("pageSize") Integer pageSize);

    int totalCount(@Param("book_name") String book_name, @Param("is_borrow") Integer is_borrow,
                   @Param("book_type") Integer book_type);
}
