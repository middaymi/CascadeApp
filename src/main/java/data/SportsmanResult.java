package data;

import lombok.Data;

@Data
public class SportsmanResult implements Comparable{

    private Athlete athlete = null;
    private float sumOfMarks = 0; //sum result
    private int sumOfRanks = 0; //sumOFplaces
    private int place = 0; //final place  //for single
    private float averageMark = 0.0f;
    private boolean isDone = true;
    private float sumOfAllElements = 0.0f;
    private float sumOfAllComponents = 0.0f;
    private float deductions = 0.0f;    
    private int startNumber = 0;

    public SportsmanResult(Athlete athlete) {
        this.athlete = athlete;
    }

    @Override
    public int compareTo(Object o) {
        if (this.place == ((SportsmanResult) o).getPlace()) {
            return 0;
        } else if (this.place > ((SportsmanResult) o).getPlace()) {
            return 1;
        } else {
            return -1;
        }
    }
}
