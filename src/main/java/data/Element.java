package data;

import lombok.Data;

@Data
public class Element {
    private int id;
    private String fullName;    
    private String description;
    private String units;  
    private String tableName;
    
    @Override
    public String toString() {
        return fullName;
    }
}
