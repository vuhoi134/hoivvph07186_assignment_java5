package poly.controller;

import entity.Departs;
import entity.Staffs;
import entity.Users;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import java.util.List;
@Transactional
@Controller
@RequestMapping("/index1/")
public class DepartController {
    @Autowired
    SessionFactory factory;
    @RequestMapping("depart")
    public String User(ModelMap model) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Departs ";
        Query query = session.createQuery(hql);
        List<Users> list = query.list();
        model.addAttribute("depart", list);
        return "Depart";
    }
    @Autowired
    ServletContext Context;
    @RequestMapping(value = "/insertDepart", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("depart") Departs departs) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {


            session.save(departs);
            t.commit();
            model.addAttribute("message", "Thêm mới thành công");

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Thêm mới thất bại");
        } finally {
            session.close();
        }
        return "redirect:/index1/depart.htm";
    }
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String update(ModelMap model, @RequestParam String id) {
        Session session = factory.getCurrentSession();
        Departs departs = (Departs) session.get(Departs.class, id);
        model.addAttribute("depart", departs);
        return "UpdateDepart";
    }

    @Autowired
    ServletContext Context1;
    @RequestMapping(value = "/updateDepart", params = "btnUpdate")
    public String update(ModelMap model, @ModelAttribute("depart") Departs departs) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(departs);
            t.commit();
            model.addAttribute("message", "Update thành công");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Update thất bại");
        } finally {
            session.close();
        }
        return "redirect:/index1/depart.htm";
    }
    @RequestMapping(value = "/deleteDepart", method = RequestMethod.GET)
    public String delete(ModelMap model, @RequestParam String id) {
        Session session = factory.openSession();
        Departs d = (Departs) session.get(Departs.class, id);
        Transaction t = session.beginTransaction();
        try {
            session.delete(d);
            t.commit();
            model.addAttribute("message", "Xóa thành công");

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Xóa thất bại");
        } finally {
            session.close();
        }
        return "redirect:/index1/depart.htm";
    }

}
