package models.TestCom.StartCom;

/**
 * Created by beaver on 20.04.17.
 */
public class PointsRow {

    private boolean sex;
    private int age;
    private float value; // зафиксированный результат
    private int points;  // очки

    /**
     *
     * @return нормализованная оценка
     */
    public int getNormalMark() {
        return (points - 1) / 5 + 2;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public float getValue() {
        return value;
    }

    public void setValue(float value) {
        this.value = value;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }
}
