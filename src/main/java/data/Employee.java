package data;

import lombok.Data;

import java.util.Date;

@Data
//storage data class
public class Employee { 
    private int id;
    private String name;
    private String surname;
    private String middlename;
    private Date birthday;
    private int experience;
    private String education;
    private String post;
}


