package data;

import lombok.Data;

@Data
public class ElementValue {
    
    private int elementId;
    private int judgeId;
    private int mark;
    private float value;
    private boolean isSaved = false;

    public void setValue(float value) {
        this.value = Math.round(value * 100.0f) / 100.0f;
    }
}
