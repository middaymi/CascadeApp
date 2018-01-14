package data;

import lombok.Data;

@Data
public class Judge {
    private int id;
    private JudgeType type;
    private String surname;
    private String name;
    private String middlename;
    private String category;
    
    @Override
    public String toString() {
        return surname + " " + name + " " + middlename;
    }
}
