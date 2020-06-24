package poly.controller;

import poly.bean.Email;
import entity.Records;
import entity.Staffs;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import java.util.List;

@Transactional
@Controller
@RequestMapping("/admin/")
public class RecordsController {
    @Autowired
    SessionFactory factory;

//    @RequestMapping("records")
//    public String showRecords(Model model) {
//        Session session = factory.getCurrentSession();
//        String hql = "FROM  Records";
//        Query query = session.createQuery(hql);
//        List<Staffs> list = query.list();
//        model.addAttribute("records", list);
//        return "Records";
//    }

    // Đếm thành tích & kỳ luật của nhân viên
    @RequestMapping(value = "records", method = RequestMethod.GET)
    public String report(ModelMap model) {

        Session session = factory.getCurrentSession();
        String hql = "Select r.staffs.id,r.staffs.name,r.staffs.email," +
                "" +
                "sum(case when r.type = 1 then 1 else 0 end)," +
                "sum(case when r.type = 0 then 1 else 0 end)," +
                "(sum(case when r.type = 1 then 1 else 0 end) - sum(case when r.type = 0 then 1 else 0 end)) as tt" +
                " from Records as r " +
                "group by r.staffs.id,r.staffs.name,r.staffs.email " +
                "order by tt desc";
        Query query = session.createQuery(hql);
        query.setMaxResults(10);
        List results = query.list();
        model.addAttribute("reco", results);
        return "Records";
    }

    ///Email
    @Autowired
    Email mailer;
    @RequestMapping(value = "send")
    public String send(ModelMap model,
                       @RequestParam("from") String from,
                       @RequestParam("to") String to,
                       @RequestParam("subject") String subject,
                       @RequestParam("body") String body) {
        try {
// Gửi mail
            mailer.send(from, to, subject, body);
            model.addAttribute("message", "Gửi email thành công !");
        } catch (Exception ex) {
            model.addAttribute("message", "Gửi email thất bại !");
        }
        return "redirect:/admin/records.htm";
    }


    // Đếm thành tích của phòng ban
    @RequestMapping(value = "depart", method = RequestMethod.GET)
    public String depart(ModelMap model) {
        Session session = factory.getCurrentSession();
        String hql2 = "select r.staffs.departs.id, r.staffs.departs.name, SUM(case when r.type=1 then 1 else 0 end),SUM(case when r.type=0 then 1 else 0 end) "
                + "FROM Records r " + "GROUP BY r.staffs.departs.id, r.staffs.departs.name";
        Query query = session.createQuery(hql2);
        List<Object[]> list = query.list();
        model.addAttribute("departs", list);
        return "Report";
    }


    @RequestMapping(value = "insert", method = RequestMethod.GET)
    public String insert(ModelMap model) {
        model.addAttribute("records", new Records());
        return "InsertRecords";
    }

    @Autowired
    ServletContext Context;

    @RequestMapping(value = "insertRecords", params = "btnSave", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("records") Records records) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(records);
            t.commit();
            model.addAttribute("message", "Thêm mới thành công");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Thêm mới thất bại");
        } finally {
            session.close();
        }
        return "redirect:/admin/records.htm";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(ModelMap model, @RequestParam Integer id) {
        Session session = factory.openSession();
        Records r = (Records) session.get(Records.class, id);
        Transaction t = session.beginTransaction();
        try {
            session.delete(r);
            t.commit();
            model.addAttribute("message", "Xóa thành công");

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Xóa thất bại");
        } finally {
            session.close();
        }
        return "redirect:/index1/records.htm";
    }


    @ModelAttribute("select1")
    public List<Staffs> getStaff() {
        Session session = factory.getCurrentSession();
        String hql = "From Staffs";
        Query query = session.createQuery(hql);
        List<Staffs> list = query.list();
        return list;
    }

}
