package models.TestCom.StartCom;

import java.util.ArrayList;

/**
 * Created by beaver on 20.04.17.
 */
public class PointsTable {
    private String name;
    private ArrayList<PointsRow> table = new ArrayList<>();

    public PointsTable() {
        // получить значения из таблицы
    }

    /**
     *
     * @return нормализованную 10-балльную оценку
     */
    public int getNormalMark(boolean sex, int age, float value) {
        for (PointsRow row : table) {
            if (row.isSex() == sex && row.getAge() == age && row.getValue() == value) { // аккуратно реализовать сравнение float-ов
                return row.getNormalMark();
            }
        }

        return -1;
    }
}
