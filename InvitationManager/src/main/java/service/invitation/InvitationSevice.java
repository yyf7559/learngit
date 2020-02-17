package service.invitation;

import entity.Invitation;

import java.util.List;

public interface InvitationSevice {
    List<Invitation> find(String title, Integer curPage, Integer pageSize);

    int totalCount(String title);

    int del(Integer id);
}
