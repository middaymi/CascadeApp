package data;

import java.sql.Date;

//storage data class
public class Performance { 
    private int id;
    private String fullName;
    private String phonogram;
    private String costumeDesign;
    private String costumePhoto;   
    private String description;    

    public int getId() {
        return id;
    }
    public String getFullName() {
        return fullName;
    }
    public String getPhonogram() {
        return phonogram;
    }
    public String getCostumeDesign() {
        return costumeDesign;
    }
    public String getCostumePhoto() {
        return costumePhoto;
    }
    public String getDescription() {
        return description;
    }

    public void setId(int id) {
        this.id = id;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    public void setPhonogram(String phonogram) {
        this.phonogram = phonogram;
    }
    public void setCostumeDesign(String costumeDesign) {
        this.costumeDesign = costumeDesign;
    }
    public void setCostumePhoto(String costumePhoto) {
        this.costumePhoto = costumePhoto;
    }
    public void setDescription(String description) {
        this.description = description;
    }    
}


