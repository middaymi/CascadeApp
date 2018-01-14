package data;

import lombok.Data;

@Data
public class PointsRow {
    private boolean sex;
    private int age;
    private float min; // min value of result
    private float max; // max value of result
}
