package controllers.TestComPage.SingleComPage;

import data.CompetitionIsuAthleteResult;
import data.ComponentIsu;
import data.ComponentRow;
import data.ElementIsu;
import data.ElementRow;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import models.TestCom.StartCom.IsuComModel;
import views.Manager;
import views.TestCom.StartCom.SingleStComPage;

public class FinishComByAthlete implements ActionListener{
    SingleStComPage singleComPage;
    IsuComModel isuComModel;
    Manager manager;
    
    public void actionPerformed(ActionEvent e) {
        manager = Manager.getManagerInstance();
        singleComPage = manager.getSingleComPage();
        isuComModel = IsuComModel.getModelInstance();
        
        if (singleComPage.getAthlCmb().getSelectedItem() != null) {
            if (checkAmountInputAllValues()) {
                //enable btn save protocol in pdf
                isuComModel.setMode(1);

                //set enabled radioBtns points/marks
                isuComModel.setFinished(true);
                singleComPage.setEnabledPoints(true);
                singleComPage.setEnabledMarks(true);

                //disabled fields
                ArrayList<ElementRow> elRows = singleComPage.getElRows();
                ArrayList<ComponentRow> comRows = singleComPage.getCompRows();
                for (ElementRow el : elRows) {
                    el.setEnabledElRowComponents(false);
                }
                for (ComponentRow compRow : comRows) {
                    compRow.setEnabledCompRowComponents(false);
                }
                //singleComPage.setEditableTopPnl(false);

                //get a result
                CompetitionIsuAthleteResult CIAR = IsuComModel.getModelInstance().getCIAR();

                //calculating values and check rank
                CIAR.calculate(IsuComModel.getModelInstance().getFactor());
                CIAR.checkRank(IsuComModel.getModelInstance().getAllElements(), 
                        (IsuComModel.getModelInstance().getRank().getId() - 1));                

                //save an athlete result to db
                addAthleteResult(CIAR);

                //enter scores to fields            
                int index = 0;
                for (ElementIsu elData : CIAR.getElementsList()) {
                    ElementRow elRow = singleComPage.getElRows().get(index++);
                    elRow.setScoreText(String.valueOf(elData.getScores()));                
                }
                index = 0;
                for (ComponentIsu compData : CIAR.getComponentsList()) {
                    ComponentRow compRow = singleComPage.getCompRows().get(index++);
                    compRow.setScoreText(String.valueOf(compData.getScores()));                
                }

                singleComPage.setComponentScore(String.valueOf(CIAR.getComponentScore()));
                singleComPage.setElementScore(String.valueOf(CIAR.getElementScore()));
                singleComPage.setTotalScore(String.valueOf(CIAR.getTotalScore()));
            }            
        } else {
            JOptionPane.showMessageDialog(Manager.getSingleComPage(),
            "Спортсмен не указан!",
            "Ошибка", JOptionPane.WARNING_MESSAGE);
            return;
        }       
    }  
    
    //add an athlete result
    private void addAthleteResult(CompetitionIsuAthleteResult CIAR) {
        int IDcompetition = isuComModel.getCompetition().getId();
        int IDathlete = CIAR.getAthlete().getId();
        //place = null;
        float sumResult = CIAR.getTotalScore();
        //get value by bylean, in sql bit
        int isDone = ((CIAR.isDone()) ? 1 : 0);
        int startNumber = CIAR.getStartNumber();
        float sumOfAllElements = CIAR.getElementScore();
        float sumOfAllComponents = CIAR.getComponentScore();
        float deductions = CIAR.getDeductions();
        //sumPlaces = null
        
        String query = null;
        PreparedStatement prst = null; 
        try {            
            query = "INSERT INTO RESULT VALUES ( " +
                    IDcompetition + ", " + IDathlete + ", null, " +
                    sumResult + ", " + isDone + ", " + startNumber + ", " +
                    sumOfAllElements + ", " + sumOfAllComponents + ", " +
                    deductions + ", null, null);";          
            System.out.println(query);
            prst = isuComModel.getDBC().prepareStatement(query);
            prst.execute();
        } catch (SQLException ex) {
            Logger.getLogger(FinishComByAthlete.class.getName()).
                   log(Level.SEVERE, null, ex);
        } finally {
            try {
                prst.close();
            } catch (SQLException ex) {
                Logger.getLogger(ElementRow.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    private boolean checkAmountInputElValues(ArrayList<ElementRow> elRows) {        
        for (ElementRow elRow : elRows) {
            for (JComboBox cmb : elRow.getJudgeMarks()) {
                if (cmb.getSelectedItem() == null) {
                     return false;                    
                } else {
                    return true;
                }
            }
        }
        return true;
    }
    
    private boolean checkAmountInputCompValues(ArrayList<ComponentRow> compRows) {        
        for (ComponentRow compRow : compRows) {
            for (JTextField tf : compRow.getJudgeMarks()) {
                if (tf.getText().equals("")) {
                     return false;                    
                } else {
                    return true;
                }
            }
        }
        return true;
    } 
    
    private boolean checkAmountInputAllValues() {
        boolean retElVal = checkAmountInputElValues(singleComPage.getElRows());
        boolean retCompVal = checkAmountInputCompValues(singleComPage.getCompRows());
        boolean retAllVal = retElVal && retCompVal;
        
        if (!retAllVal) {
            if (!retElVal) {
                JOptionPane.showMessageDialog(Manager.getSingleComPage(), 
                "Введите все судейские оценки перед расчетом!", "Ошибка!",
                JOptionPane.ERROR_MESSAGE);
            } else if (!retCompVal) {
                JOptionPane.showMessageDialog(Manager.getSingleComPage(), 
                "Введите все оценки за технику!", "Ошибка!",
                 JOptionPane.ERROR_MESSAGE);
            }
            return false;
        } else {
            return true;
        }
    } 
}
