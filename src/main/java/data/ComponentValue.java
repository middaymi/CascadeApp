//component value 
package data;

import lombok.Data;

@Data
public class ComponentValue {
    private int componentId = 0;
    private int judgeId = 0;
    private float value = 0;
    private boolean isSaved;
}
