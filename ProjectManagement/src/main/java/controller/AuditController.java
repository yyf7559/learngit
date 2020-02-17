package controller;

import entity.Audit;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.ProjectService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AuditController {
    @Resource
    private ProjectService projectService;

    @RequestMapping(value = "/index")
    public String index1(Integer status, Integer curPage, Model model) {
        if (curPage == null) curPage = 1;
        Integer totalCount = projectService.totalCount(status);
        Integer totalPageCount = totalCount % 3 == 0 ? totalCount / 3 : totalCount / 3 + 1;
        if (totalCount == 0) totalPageCount = 1;
        if (curPage < 1) curPage = 1;
        if (curPage > totalPageCount) curPage = totalPageCount;
        List<Audit> auditList = projectService.all(status, (curPage - 1) * 3, 3);
        model.addAttribute("auditList", auditList);
        model.addAttribute("status", status);
        model.addAttribute("curPage", curPage);
        model.addAttribute("totalPageCount", totalPageCount);
        return "index";
    }

    @RequestMapping(value = "/update")
    public String update(Integer id, Model model) {
        Audit audit = projectService.selectById(id);
        model.addAttribute("audit", audit);
        return "update";
    }

    @RequestMapping(value = "/check", method = RequestMethod.POST)
    @ResponseBody
    public String check(Integer id, Integer status, HttpSession session) {
        int result = projectService.updateStatus(status, id);
        if (result > 0) {
            return "true";
        } else {
            return "false";
        }
    }


}
