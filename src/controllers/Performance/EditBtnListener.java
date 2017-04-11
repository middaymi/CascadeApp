package controllers.Performance;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import models.Performance.PerformanceModel;
import views.Manager;

public class EditBtnListener implements ActionListener {   
    private Manager manager = Manager.getManagerInstance();
    private PerformanceModel perModel = PerformanceModel.getPerformanceModelInstance(); 
    public void actionPerformed(ActionEvent e) {
        if (perModel.selRow() == -1) {
            return;
        } else {
            manager.choosePanel(41);
            manager.getPerEditPage().updateInfo();            
        }
    }
}
    
