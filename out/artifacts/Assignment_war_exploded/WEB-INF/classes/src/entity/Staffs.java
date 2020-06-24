package entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "Staffs")
public class Staffs {
    @Id
    // Chỉ ra khóa chính
    @GeneratedValue
    private Integer id;
    @Column(name = "Name")
    private String name;
    @Column(name = "Gender")
    private boolean gender;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date birthday;

    @Column(name = "Photo")
    private String photo;
    @Column(name = "Email")
    private String email;
    @Column(name = "Phone")
    private String phone;
    @Column(name = "Salary")
    private Float salary;
    @Column(name = "Level")
    private Integer level;

    @Column(name = "Notes")
    private String notes;

    // Quan hệ N-1 với bảng Departs

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "DepartId",nullable = false)
    private Departs departs;

    private transient int departsid;

    // Quan hệ 1-N với bảng Records

    @OneToMany( fetch = FetchType.LAZY,mappedBy = "staffs",cascade = CascadeType.ALL)
//    private Collection<Records> records;
    private List<Records> list = new ArrayList<Records>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Float getSalary() {
        return salary;
    }

    public void setSalary(Float salary) {
        this.salary = salary;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Departs getDeparts() {
        return departs;
    }

    public void setDeparts(Departs departs) {
        this.departs = departs;
    }


}
