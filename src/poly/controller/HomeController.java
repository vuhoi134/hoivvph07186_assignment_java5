package poly.controller;

import entity.Staffs;
import entity.Users;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
@Transactional
@Controller
public class HomeController {
    @Autowired
    SessionFactory factory;
    // Đếm thành tích & kỳ luật của nhân viên
    @RequestMapping(value = "home", method = RequestMethod.GET)
    public String report(ModelMap model) {
        Session session = factory.getCurrentSession();
        String hql = "Select r.staffs.name,r.staffs.photo," +
                "" +
                "sum(case when r.type = 1 then 1 else 0 end)," +
                "sum(case when r.type = 0 then 1 else 0 end)," +
                "(sum(case when r.type = 1 then 1 else 0 end) - sum(case when r.type = 0 then 1 else 0 end)) as tt" +
                " from Records as r " +
                "group by r.staffs.name,r.staffs.photo "+
                "order by tt desc"
                ;
        Query query = session.createQuery(hql);
        query.setMaxResults(10);
        List results = query.list();
        model.addAttribute("reco", results);
        return "TrangChu";
    }
}
