package models.TestCom.StartCom;

import data.Athlete;

public class SportsmanResult {

    private Athlete athlete;
    private int sumOfMarks;
    private int sumOfRanks;
    private int place;
    private float averageMark;

    public SportsmanResult(Athlete athlete) {
        this.athlete = athlete;
    }

    public int getPlace() {
        return place;
    }

    public void setPlace(int place) {
        this.place = place;
    }

    public Athlete getAthlete() {
        return athlete;
    }

    public void setAthlete(Athlete athlete) {
        this.athlete = athlete;
    }

    public int getSumOfMarks() {
        return sumOfMarks;
    }

    public void setSumOfMarks(int sumOfMarks) {
        this.sumOfMarks = sumOfMarks;
    }

    public int getSumOfRanks() {
        return sumOfRanks;
    }

    public void setSumOfRanks(int sumOfRanks) {
        this.sumOfRanks = sumOfRanks;
    }

    public float getAverageMark() {
        return averageMark;
    }

    public void setAverageMark(float averageMark) {
        this.averageMark = averageMark;
    }
}
