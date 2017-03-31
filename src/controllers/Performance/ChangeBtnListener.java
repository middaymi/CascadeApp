package controllers.Performance;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import models.Performance.PerformanceModel;
import views.Manager;

public class ChangeBtnListener implements ActionListener {
    Manager manager = Manager.getManagerInstance();
    private PerformanceModel perModel = PerformanceModel.getPerformanceModelInstance();
    boolean change = false;
    public void actionPerformed(ActionEvent e) {        
        if (manager.getPerPage() != null) {
            if (change == true) {
                manager.getPerPage().setBtnsMode(false);
                perModel.updateData();
                change = false;
            } else {
            manager.getPerPage().setBtnsMode(true);
            change = true;
            }
        }       
    }  
}
