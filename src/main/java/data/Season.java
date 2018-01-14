package data;

import lombok.Data;

@Data
public class Season {
    private int id;
    private String season;

    @Override
    public String toString() {
        return getSeason();
    }
}
