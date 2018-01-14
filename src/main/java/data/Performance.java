package data;

import lombok.Data;

@Data
//storage data class
public class Performance { 
    private int id;
    private Season season;
    private String fullName;
    private String phonogram;
    private String costumeDesign;
    private String costumePhoto;   
    private String description;
}


