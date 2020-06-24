package entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "Departs")


public class Departs {
    @Id
    // Chỉ ra khóa chính
    @Column(name = "Id")
    private String id;
    @Column(name = "Name")
    private String name;

    // Quan hệ 1-N với bảng Staffs
    @OneToMany(mappedBy = "departs", fetch = FetchType.EAGER)
    private Collection<Staffs> staffs;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
