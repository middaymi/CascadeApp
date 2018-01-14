//component values (arrayList of ComponentValue)
package data;

import lombok.Data;

import java.util.HashMap;

@Data
public class ComponentIsu {

    private int componentId = 0;
    private float scores = 0;
    private HashMap<Integer, ComponentValue> judgesValues = new HashMap<>();

    public void setScores(float scores) {
        this.scores = Math.round(scores * 100.0f) / 100.0f;
    }
}
