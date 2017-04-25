/*
ID:
1 = SFP = 53
2 = OFP = 52
3 = GLASIAL = 51
4 = SINGLE = 54
*/
package controllers.TestComPage;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import models.TestCom.GlasialEditModel;
import models.TestCom.OfpEditModel;
import models.TestCom.SfpEditModel;
import models.TestCom.SingleEditModel;
import models.TestCom.TestComModel;
import views.Manager;

public class EditBtnListener implements ActionListener{
    private Manager manager;
    private TestComModel tcModel;
    private SfpEditModel sfpEditModel;
    private OfpEditModel ofpEditModel;
    private GlasialEditModel glasialEditModel;    
    private SingleEditModel singleEditModel;
    int sel;
    int kindId;
    public void actionPerformed(ActionEvent e) {
        manager = Manager.getManagerInstance();
        tcModel = TestComModel.getTestComModelInstance();   
        sfpEditModel = SfpEditModel.getSfpEditModelInstance();
        ofpEditModel = OfpEditModel.getOfpEditModelInstance();
        glasialEditModel = GlasialEditModel.getGlasialEditModelInstance();
        singleEditModel = SingleEditModel.getSingleEditModelInstance();       
        
        sel = tcModel.selRow();
        kindId = (int)tcModel.getValueAt(sel, 2);
        System.out.println("kindID " + kindId + "; selRow " + sel); 
        
        switch(kindId) {
            case(1):
                manager.choosePanel(53);
                tcModel.setAthletesList(53);
                tcModel.setAthletesCombo(53);
                sfpEditModel.setJudgesList();
                sfpEditModel.setJudgesCombo(); 
                break;
            case(2):
                manager.choosePanel(52);
                tcModel.setAthletesList(52);
                tcModel.setAthletesCombo(52);
                ofpEditModel.setJudgesList();
                ofpEditModel.setJudgesCombo();
                break;
            case(3):
                manager.choosePanel(51);
                tcModel.setAthletesList(51);
                tcModel.setAthletesCombo(51);
                glasialEditModel.setJudgesList();
                glasialEditModel.setJudgesCombo();                
                break;
            case(4): 
                manager.choosePanel(54);
                tcModel.setAthletesList(54);
                tcModel.setAthletesCombo(54);
                singleEditModel.setJudgesList();
                singleEditModel.setJudgesCombo();
                break;
            case(5):
                JOptionPane.showMessageDialog(Manager.getTestCompPage(),
                        "Информация по спортивным балтам доступна " +
                        "для редактирования только в таблице!",
                        "Внимание!", JOptionPane.WARNING_MESSAGE);
                break;
        }        
        kindId = 0;
        sel = 0;
    }    
}
