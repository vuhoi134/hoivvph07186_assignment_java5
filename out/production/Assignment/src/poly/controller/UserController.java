package poly.controller;

import entity.Staffs;
import entity.Users;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


import javax.servlet.ServletContext;
import java.util.List;

@Transactional
@Controller
@RequestMapping("/index/")
public class UserController {
    @Autowired
    SessionFactory factory;

    @RequestMapping("user")
    public String User(ModelMap model) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Users ";
        Query query = session.createQuery(hql);
        List<Users> list = query.list();
        model.addAttribute("user", list);
        return "User";
    }

//    @RequestMapping(value = "insert", method = RequestMethod.GET)
//    public String insert(ModelMap model) {
//        model.addAttribute("user", new Users());
//        return "User";
//    }

    @Autowired
    ServletContext Context;

    @RequestMapping(value = "/insertUser", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("user") Users users) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {

            session.save(users);
            t.commit();
            model.addAttribute("message", "Thêm mới thành công");

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Thêm mới thất bại");
        } finally {
            session.close();
        }
        return "redirect:/index/user.htm";
    }


    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String update(ModelMap model, @RequestParam String username) {
        Session session = factory.getCurrentSession();
        Users user = (Users) session.get(Users.class, username);
        model.addAttribute("user", user);
        return "UpdateUser";
    }

    @Autowired
    ServletContext Context1;

    @RequestMapping(value = "updateUser", params = "btnUpdate", method = RequestMethod.POST)
    public String update(ModelMap model, @ModelAttribute("user") Users users) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(users);
            t.commit();
            model.addAttribute("message", "Update thành công");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Update thất bại");
        } finally {
            session.close();
        }
        return "redirect:/user.htm";
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(ModelMap model, @RequestParam String username) {
        Session session = factory.openSession();
        Users u = (Users) session.get(Users.class, username);
        Transaction t = session.beginTransaction();
        try {
            session.delete(u);
            t.commit();
            model.addAttribute("message", "Xóa thành công");

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Xóa thất bại");
        } finally {
            session.close();
        }
        return "redirect:/index/user.htm";
    }


    @RequestMapping(value = "searchUser", method = RequestMethod.GET)
    public String User(ModelMap model, @RequestParam("timkiem") String username) {
        Session session = factory.getCurrentSession();
        String hql1 = "from Users where username LIKE '%" + username + "%'";
        String hql2 = "from Users where username = :user";
        String hql3 = "from Users";
        Query query1 = session.createQuery(hql1);
        Query query2 = session.createQuery(hql2);
        Query query3 = session.createQuery(hql3);
        query2.setParameter("user", username);
        List<Users> list1 = query1.list();
        List<Users> list2 = query2.list();
        List<Users> list3 = query3.list();
        if (list1.size() == 0 && list2.size() == 0) {
            model.addAttribute("thongbao", "Không tìm thấy tài khoản trên");
            model.addAttribute("user", list3);
        } else if (list1.size() == 0) {
            model.addAttribute("user", list2);
        } else {
            model.addAttribute("user", list1);
        }
   return "User";
    }
}