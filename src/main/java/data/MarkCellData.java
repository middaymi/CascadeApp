/*data for startCom!
For saving data of competition? for startCom classes.
It is used for each crossing of athlete and element, for glassial competitions
judges are added
 */
package data;

import lombok.Data;

@Data
public class MarkCellData {
    private Float value = null;
    private Integer athleteId = null;
    private Integer elementId = null;
    private Integer judgeId = null;
    private int normalMark = 0;
    private int place = 0; //by every element

    public MarkCellData(Integer athleteId, Integer elementId, Integer judgeId, Float value) {
        this.athleteId = athleteId;
        this.elementId = elementId;
        this.judgeId = judgeId;
        this.value = value;
    }
}