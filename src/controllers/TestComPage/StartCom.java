package controllers.TestComPage;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import models.TestCom.StartCom.SfpStComModel;
import models.TestCom.TestComModel;
import views.Manager;

public class StartCom implements ActionListener {
    private Manager manager;
    private TestComModel tcModel;
    
    private SfpStComModel sfpStComModel;
    
    int sel;
    int kindId;
    
    public void actionPerformed(ActionEvent e) {
        manager = Manager.getManagerInstance();
        tcModel = TestComModel.getTestComModelInstance(); 
                
        try {       
            sel = tcModel.selRow();
            kindId = (int)tcModel.getValueAt(sel, 2); 

            switch(kindId) {
                //SFP
                 case(1):
                 case(2):
                 case(3):
                     manager.choosePanel(61);
                     sfpStComModel = SfpStComModel.getSfpEditModelInstance();
                     sfpStComModel.setTextToWelcomeLbl(
                            tcModel.getValueAt(sel, 0) + ". " +
                            tcModel.getValueAt(sel, 3) + ".   " +
                            tcModel.getValueAt(sel, 5));
                     sfpStComModel.setAllData();
                     
                     break;
                 //SINGLE
                 case(4): 
                     //manager.choosePanel();
                     break;
                 //SPBALET
                 case(5):
                     break;
             }        
             kindId = 0;
             sel = 0;
        } catch (ArrayIndexOutOfBoundsException ex) {
            return;
        }
    }
}
