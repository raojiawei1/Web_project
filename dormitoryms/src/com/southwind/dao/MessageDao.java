package com.southwind.dao;

import com.southwind.entity.Message;

import java.util.List;

public interface MessageDao {
    public List<Message> search(String key, String value);
    public List<Message> search(String key, String value, String majority);
    public List<Message> list();
    public Integer save(Message message);
    public Integer delete(String name);

    public Integer update(String name, String newpassword);
    public Integer update(String name, boolean flag);
}
