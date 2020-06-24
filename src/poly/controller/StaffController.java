package poly.controller;

import entity.Departs;
import entity.Staffs;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


@Transactional
@Controller
@RequestMapping("/admin1/")
public class StaffController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("staff")
    public String nhanvien(ModelMap model) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Staffs ";
        Query query = session.createQuery(hql);
        List<Staffs> list = query.list();
        model.addAttribute("staffs", list);
        return "Staff";
    }

    @RequestMapping(value = "insertStaff", method = RequestMethod.GET)
    public String insert(ModelMap model) {
        model.addAttribute("staffs", new Staffs());
        return "InsertStaff";
    }

    @Autowired
    ServletContext Context;
    @RequestMapping(value = "insertNV", params = "btnSave", method = RequestMethod.POST)
    public String Insert(ModelMap model, @ModelAttribute("staffs") Staffs staffs,
                         @RequestParam("img") MultipartFile img) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        String photo = "";
        try {
            if (img.isEmpty()) {
                session.save(staffs);
                t.commit();
            }
            else {
                String imgPath = Context.getRealPath("/images/" + img.getOriginalFilename());
                img.transferTo(new File(imgPath));
                photo += img.getOriginalFilename();
                staffs.setPhoto(photo);
                session.save(staffs);
                t.commit();
                model.addAttribute("message", "Insert thành công");
            }
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Insert thất bại");
            System.out.println(e);
        } finally {
            session.close();
        }
        return "redirect:/admin1/staff.htm";
    }


    @ModelAttribute("select")
    public List<Departs> getDeparts() {
        Session session = factory.getCurrentSession();
        String hql = "from Departs";
        Query query = session.createQuery(hql);
        List<Departs> list = query.list();
        return list;
    }


    @RequestMapping(value = "/deleteStaff", method = RequestMethod.GET)
    public String delete(ModelMap model, @RequestParam int id) {
        Session session = factory.openSession();
        Staffs s = (Staffs) session.get(Staffs.class, id);
        Transaction t = session.beginTransaction();
        try {
            session.delete(s);
            t.commit();
            model.addAttribute("message", "Xóa thành công");

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Xóa thất bại");
            System.out.println(e);
        } finally {
            session.close();
        }
        return "redirect:/admin1/staff.htm";
    }


    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String update(ModelMap model, @RequestParam Integer id) {
        Session session = factory.getCurrentSession();
        Staffs staff = (Staffs) session.get(Staffs.class, id);
        model.addAttribute("staffs", staff);
        return "UpdateStaff";
    }

    @Autowired
    ServletContext Context1;

    @RequestMapping(value = "updateStaff", params = "btnUpdate", method = RequestMethod.POST)
    public String update(ModelMap model, @ModelAttribute("staffs") Staffs staffs
            , @RequestParam("img") MultipartFile img
    ) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        String photo = "";
        try {
            if (img.isEmpty()) {
                session.update(staffs);
                t.commit();
            } else {
                String imgPath = Context.getRealPath("/images/" + img.getOriginalFilename());
                img.transferTo(new File(imgPath));
                photo += img.getOriginalFilename();
                staffs.setPhoto(photo);
                session.update(staffs);
                t.commit();
            }
            model.addAttribute("message", "Update thành công");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Update thất bại");
        } finally {
            session.close();
        }
        return "redirect:/admin1/staff.htm";
    }

    @RequestMapping(value = "/detailStaff", method = RequestMethod.GET)
    public String Detail(ModelMap model, @RequestParam Integer id) {
        Session session = factory.getCurrentSession();
        Staffs staff = (Staffs) session.get(Staffs.class, id);
        model.addAttribute("staffs", staff);
        return "DetailStaff";
    }

//
//    @RequestMapping(value = "/search")
//    public String search(@RequestParam String keyword) {
//        Session session = factory.getCurrentSession();
//        String hql = "SELECT s FROM Staffs s WHERE s.name LIKE '%' || :keyword || '%'"
//                + " OR s.email LIKE '%' || :keyword || '%'" + " OR s.id LIKE '%' || :keyword || '%'";
//
//
//    }

}