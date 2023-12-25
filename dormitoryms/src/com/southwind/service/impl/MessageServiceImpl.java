package com.southwind.service.impl;

import com.southwind.dao.impl.MessageDaoImpl;
import com.southwind.entity.Message;
import com.southwind.service.MessageService;

import java.util.List;

public class MessageServiceImpl implements MessageService {

    private com.southwind.dao.MessageDao MessageDao = new MessageDaoImpl();


    @Override
    public List<Message> search(String key, String value) {
        if(value.equals("")) return this.MessageDao.list();
        return this.MessageDao.search(key, value);
    }

    @Override
    public List<Message> search(String key, String value, String majority) {
        return null;
    }


    @Override
    public List<Message> list() {
        return this.MessageDao.list();
    }

    @Override
    public void save(Message message) {
        Integer save = this.MessageDao.save(message);
        if(save != 1) throw new RuntimeException("成绩信息添加失败");
    }

    @Override
    public void delete(String name) {
        Integer delete = this.MessageDao.delete(name);
        if(delete != 1) throw new RuntimeException("信息删除失败");
    }

    @Override
    public void update(String name,boolean flag) {
        Integer update = this.MessageDao.update(name,flag);
        if(update != 1) throw new RuntimeException("信息更新失败");
    }

    @Override
    public void update(String name, String newpassword) {
        Integer update = this.MessageDao.update(name,newpassword);
        if(update != 1) throw new RuntimeException("信息更新失败");
    }
}
