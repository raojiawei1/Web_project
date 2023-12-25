package com.southwind.dao.impl;


import com.southwind.dao.MessageDao;
import com.southwind.entity.Message;
import com.southwind.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MessageDaoImpl implements MessageDao {


    @Override
    public List<Message> search(String key, String value) {
        Connection connection = JDBCUtil.getConnection();
        String sql = "select * from message where " +key+" like '%"+value+"%'";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Message> list = new ArrayList<>();
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String username= resultSet.getString(1);
                String  name=resultSet.getString(2);
                String  password=resultSet.getString(3);
                String newpassword = resultSet.getString(4);
                String state = resultSet.getString(5);
                list.add(new Message(username,name,password,newpassword,state));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtil.release(connection, statement, resultSet);
        }
        return list;
    }

    @Override
    public List<Message> search(String key, String value, String majority) {
        return null;
    }

    @Override
    public List<Message> list() {
        Connection connection = JDBCUtil.getConnection();
        String sql = "select * from message";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Message> list = new ArrayList<>();
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String username= resultSet.getString(1);
                String  name=resultSet.getString(2);
                String  password=resultSet.getString(3);
                String newpassword = resultSet.getString(4);
                String state = resultSet.getString(5);
                list.add(new Message(username,name,password,newpassword,state));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtil.release(connection, statement, resultSet);
        }
        return list;
    }

    @Override
    public Integer save(Message message) {

        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into message(username,name,password,newpassword,state) values(?,?,?,?,?)";
        PreparedStatement statement = null;
        Integer result = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, message.getUsername());
            statement.setString(2, message.getName());
            statement.setString(3, message.getPassword());
            statement.setString(4, message.getNewpassword());
            statement.setString(5, message.getState());
            result = statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtil.release(connection, statement, null);
        }

        return result;

    }

    @Override
    public Integer delete(String name) {
        Connection connection = JDBCUtil.getConnection();
        String sql = "delete from message where name= '"+name+" '" ;
        PreparedStatement statement = null;
        Integer result = null;
        try {
            statement = connection.prepareStatement(sql);
            result = statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtil.release(connection, statement, null);
        }
        return result;
    }


    @Override
    public Integer update(String name,boolean flag) {
        Connection connection = JDBCUtil.getConnection();
        String sql = "update message set state = ? where name = '" + name +"'";
        PreparedStatement statement = null;
        Integer result = null;
        try {
            statement = connection.prepareStatement(sql);
            if(flag==true)  statement.setString(1,"成功");
            if(flag==false)  statement.setString(1,"失败");
            result = statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtil.release(connection, statement, null);
        }
        return result;
    }

    @Override
    public Integer update(String name, String newpassword) {
        Connection connection = JDBCUtil.getConnection();
        String sql = "update dormitory_admin set password = ? where name = '" + name +"'";
        PreparedStatement statement = null;
        Integer result = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,newpassword);
            result = statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JDBCUtil.release(connection, statement, null);
        }
        return result;
    }
}
