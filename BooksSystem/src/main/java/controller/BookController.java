package controller;

import entity.Book;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.BookService;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@Controller
public class BookController {
    @Resource
    private UserService userService;
    @Resource
    private BookService bookService;
    String name;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }
    @RequestMapping(value = "/index")
    public String indexs(Model model, String book_name, Integer book_type, Integer is_borrow, Integer curPage) {
        if (curPage == null) {
            curPage = 1;
        }
        int totalCount = bookService.totalCount(book_name, is_borrow, book_type);
        int totalPageCount = totalCount % 5 == 0 ? totalCount / 5 : totalCount / 5 + 1;
        if (totalCount == 0) totalPageCount = 1;
        if (curPage < 1) curPage = 1;
        if (curPage > totalPageCount) curPage = totalPageCount;
        List<Book> bookList = bookService.find(book_name, is_borrow, book_type, curPage, 5);
        model.addAttribute("bookList", bookList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("book_name", book_name);
        model.addAttribute("book_type", book_type);
        model.addAttribute("is_borrow", is_borrow);
        return "index";
    }

    @RequestMapping(value = "/dologin", method = RequestMethod.POST)
    @ResponseBody
    public String login(String userCode, String password, HttpServletResponse response) throws IOException {
        if (userService.login(userCode, password) != null) {
            userService.updateDate(userService.login(userCode, password).getUser_id());
            return "true";
        }
        return "false";
    }
}
