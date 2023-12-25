package com.southwind.controller;


import com.southwind.entity.Message;
import com.southwind.service.MessageService;
import com.southwind.service.impl.MessageServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/searchpassword")
public class SearchPasswordServlet extends HttpServlet {

    private MessageService messageService = new MessageServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String method = req.getParameter("method");
        switch (method){
            case "adminsearch":
                String key = req.getParameter("key");
                String value = req.getParameter("value");
                String majority = req.getParameter("majority");
                if(majority.equals("")) break;
                if(value.equals("")) break;
                req.setAttribute("list", this.messageService.search(key, value,majority));
                req.getRequestDispatcher("passwordmanger.jsp").forward(req, resp);
                break;
            case "search":
                value = req.getParameter("majority");
                if(value.equals("")) break;
                req.setAttribute("list", this.messageService.search("majority", value));
                req.getRequestDispatcher("passwordmanger.jsp").forward(req, resp);
                break;
            case "singlesearch":
                value = req.getParameter("key");
                if (value.equals("")) break;
                req.setAttribute("list", this.messageService.search("name", value));
                req.getRequestDispatcher("searchpasswordmanger.jsp").forward(req, resp);
                break;
            case "sisearch":
                value = req.getParameter("name");
                if (value.equals("")) break;
                req.setAttribute("list", this.messageService.search("name", value));
                req.getRequestDispatcher("searchpasswordmanger.jsp").forward(req, resp);
                break;
            case "save":
                String username = req.getParameter("username");
                String name = req.getParameter("name");
                String password = req.getParameter("password");
                String newpassword = req.getParameter("newpassword");
                String state = req.getParameter("state");
                this.messageService.save(new Message(username,name,password,newpassword,state));
                req.setAttribute("name",name);
                req.getRequestDispatcher("/searchpassword?method=sisearch").forward(req, resp);
                break;
            case "delete":
                name = req.getParameter("name");
                this.messageService.delete(name);
                req.setAttribute("name",name);
                req.getRequestDispatcher("/searchpassword?method=sisearch").forward(req, resp);
                break;

        }
    }
}
