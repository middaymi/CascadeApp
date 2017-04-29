package models.TestCom.StartCom;

/**
 * Created by beaver on 20.04.17.
 */
public class MarkCellData {

    private float value;
    private Integer sportsmenId = null;
    private Integer elementId = null;
    private Integer judgeId = null;
    private int normalMark;
    private int place;

    public MarkCellData(Integer sportsmenId, Integer elementId, Integer judgeId, float value) {
        this.sportsmenId = sportsmenId;
        this.elementId = elementId;
        this.judgeId = judgeId;
        this.value = value;
    }

    public float getValue() {
        return value;
    }

    public void setValue(float value) {
        this.value = value;
    }

    public Integer getSportsmenId() {
        return sportsmenId;
    }

    public void setSportsmenId(Integer sportsmenId) {
        this.sportsmenId = sportsmenId;
    }

    public Integer getElementId() {
        return elementId;
    }

    public void setElementId(Integer elementId) {
        this.elementId = elementId;
    }

    public Integer getJudgeId() {
        return judgeId;
    }

    public void setJudgeId(Integer judgeId) {
        this.judgeId = judgeId;
    }

    public int getNormalMark() {
        return normalMark;
    }

    public void setNormalMark(int normalMark) {
        this.normalMark = normalMark;
    }

    public int getPlace() {
        return place;
    }

    public void setPlace(int place) {
        this.place = place;
    }

}