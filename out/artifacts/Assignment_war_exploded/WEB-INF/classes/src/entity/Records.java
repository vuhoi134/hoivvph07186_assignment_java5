package entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Collection;
import java.util.Date;

@Entity
@Table(name = "Records")
public class Records {
    @Id
    @GeneratedValue
    private Integer id;
    @Column(name = "Type")
    private boolean type;
    @Column(name = "Reason")
    private String reason;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date date;

    // Quan hệ N-1 với bảng Staffs
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "staffid",nullable = false)
    private Staffs staffs;
    private transient int staffsid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


    public Staffs getStaffs() {
        return staffs;
    }

    public void setStaffs(Staffs staffs) {
        this.staffs = staffs;
    }
}
