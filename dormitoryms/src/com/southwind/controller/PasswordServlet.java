package com.southwind.controller;


import com.southwind.service.MessageService;
import com.southwind.service.impl.MessageServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/password")
public class PasswordServlet extends HttpServlet {

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
            case "list":
                req.setAttribute("list", this.messageService.list());
                req.getRequestDispatcher("passwordmanger.jsp").forward(req, resp);
                break;
            case "accept":
                String name = req.getParameter("name");
                String newpassword=req.getParameter("newpassword");
                if(name.equals("")) break;
                this.messageService.update(name,true);
                this.messageService.update(name,newpassword);
                resp.sendRedirect("/password?method=list");
                break;
            case "refuse":
                name = req.getParameter("name");
                if(name.equals("")) break;
                this.messageService.update(name,false);
                resp.sendRedirect("/password?method=list");
                break;




        }
    }
}
