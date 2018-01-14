package data;

//as data for ElementRow

import lombok.Data;

import java.util.HashMap;

@Data
public class ElementIsu {    
    
    private int elementId = 0;
    private int elementTypeId = 0;
    private String name = "";
    private String info = "";
    private float baseValue = 0.0f;
    private HashMap<Integer, ElementValue> judgesValues = new HashMap<>();
    private float scores = 0;

    public void setScores(float scores) {
        this.scores = Math.round(scores * 100.0f) / 100.0f;
    }
}
