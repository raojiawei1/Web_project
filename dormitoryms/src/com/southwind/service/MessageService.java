package com.southwind.service;


import com.southwind.entity.Message;

import java.util.List;

public interface MessageService {
    public List<Message> search(String key, String value);
    public List<Message> search(String key, String value, String majority);
    public List<Message> list();
    public void save(Message message);
    public void delete(String name);
    public void update(String name, boolean flag);
    public void update(String name, String newpassword);
}
