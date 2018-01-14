package data;

import lombok.Data;

import java.util.ArrayList;
import java.util.HashMap;

@Data
public class CompetitionIsuAthleteResult {
        
    private final Athlete athlete;
    private int startNumber = 0;    
    private float totalScore = 0;
    private float elementScore = 0;
    private float componentScore = 0;
    private float deductions = 0;
    private boolean isDone = false;
    private int competitionAthlId = 0;
    private int place = 0;
    private  int resultId = 0;
    private ArrayList<ElementIsu> elementsList = new ArrayList<>();
    private ArrayList<ComponentIsu> componentsList = new ArrayList<>();    
 
    public void calculate(float factor) {
        // calculate components
        componentScore = 0;
        for (ComponentIsu component : componentsList) {
            float sum = 0;
            for (ComponentValue value : component.getJudgesValues().values()) {
                sum += value.getValue();
            }
            float scores = factor * sum / component.getJudgesValues().size();
            scores = Math.round(scores * 100.0f) / 100.0f;
            component.setScores(scores);
            componentScore += scores;
            componentScore = Math.round(componentScore * 100.0f) / 100.0f;
        }
        
        // calculate elements
        elementScore = 0;
        for (ElementIsu element : elementsList) {
        //   float base = IsuElementsData.getElementBase(element.getElementId(), element.getInfo());
        //   element.setBaseValue(base);
           float sum = 0;           
           for (ElementValue value : element.getJudgesValues().values()) {
               float res = IsuElementsData.getElementValue(element.getElementId(), 
                                                           element.getInfo(), value.getMark());
               value.setValue(res);
               sum += res;
           }
           float scores = sum / element.getJudgesValues().size();
           scores = Math.round(scores * 100.0f) / 100.0f;
           element.setScores(scores);
           elementScore += scores;
           elementScore = Math.round(elementScore * 100.0f) / 100.0f;
        }
        
        // calculate total
        totalScore = elementScore + componentScore - deductions; 
        totalScore = Math.round(totalScore * 100.0f) / 100.0f;
        
    }
    
    public void checkRank(HashMap<Integer, ElementData> elements, int rank) {
        // check rank        
        isDone = RankCalculation.calculateRankExecution(elementsList, elements, rank);
    }

    public void setTotalScore(float totalScore) {        
        this.totalScore = Math.round(totalScore * 100.0f) / 100.0f;       
    }
    public void setElementScore(float elementScore) {
        this.elementScore = Math.round(elementScore * 100.0f) / 100.0f;
    }
    public void setComponentScore(float componentScore) { this.componentScore = Math.round(componentScore * 100.0f) / 100.0f; }
    public void addToElLst(ElementIsu elIsu) {
        this.elementsList.add(elIsu);
    }
    public void addToCompLst(ComponentIsu compIsu) {
        this.componentsList.add(compIsu);
    }
}
