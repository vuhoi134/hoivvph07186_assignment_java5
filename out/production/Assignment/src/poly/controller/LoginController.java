package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import entity.Users;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Transactional
@Controller
public class LoginController {
    @RequestMapping("login")
    public String login() {
        return "Login";
    }

    @Autowired
    SessionFactory factory;

    @RequestMapping(value = "user1", method = RequestMethod.POST)
    public String login(ModelMap model, @RequestParam("username") String username, @RequestParam("password") String password,
                        HttpServletResponse response, HttpServletRequest request) {

        Cookie cookie = new Cookie("user", username);
        Cookie cookie1 = new Cookie("pass", password);
        Session session = factory.getCurrentSession();
        String hql = "from Users where username= :user";
        Query query = session.createQuery(hql);
        query.setParameter("user", username);
        List<Users> list = query.list();
        for (int i = 0; i < list.size(); i++) {
            Users ac = list.get(i);
            if (ac.getUsername().equals(username) && ac.getPassword().equals(password) && request.getParameterValues("remember") != null) {
                cookie.setMaxAge(100000000);
                cookie1.setMaxAge(100000000);
                response.addCookie(cookie);
                response.addCookie(cookie1);
                return "redirect:/index/user.htm";
            } else if (ac.getUsername().equals(username) && ac.getPassword().equals(password) && request.getParameterValues("remember") == null) {
                cookie.setMaxAge(0);
                cookie1.setMaxAge(0);
//                cookie.setValue("");
//                cookie1.setValue("");
                response.addCookie(cookie);
                response.addCookie(cookie1);
                return "redirect:/index/user.htm";

            } else if (!ac.getUsername().equals(username)) {
                model.addAttribute("user", "Tài khoản không chính xác");
                return "Login";
            } else if (!ac.getPassword().equals(password)) {
                model.addAttribute("pass", "Mật khẩu không chính xác");
                return "Login";
            } else if (ac.getUsername().equals(username) && !ac.getPassword().equals(password)) {
                model.addAttribute("user", "");
                model.addAttribute("pass", "Mật khẩu không chính xác");
                return "Login";

            } else if (!ac.getUsername().equals(username) && ac.getPassword().equals(password)) {
                model.addAttribute("user", "Tài khoản không chính xác");
                model.addAttribute("pass", "");
                return "Login";

            }
        }

        return "Login";
    }




    @ModelAttribute("user")
    public List<Users> getUsers(ModelMap model1) {
        Session session = factory.getCurrentSession();
        String hql = "from Users";
        Query query = session.createQuery(hql);
        List<Users> list = query.list();
        return list;
    }

}
