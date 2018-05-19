package com.liu.control;

import com.liu.service.UserServiceImpl;
import com.liu.vo.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 26522 on 2017/8/5.
 */
@WebServlet(name="UserControl",urlPatterns = {"/user"},
initParams = {
        @WebInitParam(name="success",value="index.jsp")
})
public class UserControl extends HttpServlet {
    private UserServiceImpl service=new UserServiceImpl();
    private Map<String,String> map=new HashMap();

    @Override
    public void init(ServletConfig config) throws ServletException {
        map.put("success",config.getInitParameter("success"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String action=req.getParameter("action");
        RequestDispatcher dispatcher=null;
        if(action.equals("add")){
            String username=req.getParameter("username");
            String password=req.getParameter("password");
            User user=new User();
            user.setUsername(username);
            user.setPassword(password);
            service.register(user);
        }
        else if(action.equals("del")) {
            int id = Integer.parseInt(req.getParameter("id"));
            service.del(id);
        } else if(action.equals("queryid")) {//�޸�ȡ���û���Ϣ
            int id = Integer.parseInt(req.getParameter("id"));
            User user = service.queryId(id);
            req.setAttribute("user", user);
        }else if(action.equals("edit")) {

            String username = req.getParameter("username");
            String password = req.getParameter("password");
            int id = Integer.parseInt(req.getParameter("id"));
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setId(id);
            service.edit(user);
            req.removeAttribute("user");
        }

        dispatcher=req.getRequestDispatcher(map.get("success"));
        dispatcher.forward(req,resp);

    }


}
