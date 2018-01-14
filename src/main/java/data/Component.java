package data;

import lombok.Data;

@Data
public class Component {
    private Integer id;
    private int rankId;
    private String fullNameENG;
    private String fullNameRUS;
    private String description;
}
