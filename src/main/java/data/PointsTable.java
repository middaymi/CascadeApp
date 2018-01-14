package data;

import lombok.Data;

import java.util.ArrayList;

@Data
public class PointsTable {
    private final Integer elementId;
    private ArrayList<PointsRow> table = new ArrayList<>();

    public int getNormalPoints(int points) {
        if (points == 0) return 0;
        return (points - 1) / 5 + 2;
    }
        
    public int getPoints(boolean sex, int age, Float value) {
        if (value == null) {
            return -1;
        } else {         
            for (PointsRow row : getTable()) {
                if (row.isSex() == sex && row.getAge() == age) { 
                    float min = row.getMin();
                    float max = row.getMax();
                    
                    float minMin = (min < max) ? min : max;

                    if (value < minMin) {
                        return 0;
                    }

                    float step = Math.abs(max - min) / 20;
                    float points = Math.abs(value - min) / step;
                    int res = Math.round(points);
                    return res;
                }
            }
        }
        return -1;
    }
}
