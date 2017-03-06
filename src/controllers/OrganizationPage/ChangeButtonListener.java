package controllers.OrganizationPage;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import views.Manager;


public class ChangeButtonListener implements ActionListener{ 
    Manager manager = Manager.getManagerInstance();
    boolean change = false;
    public void actionPerformed(ActionEvent e) {        
        if (manager.getOrgPage() != null) {
            if (change == true) {
                manager.getOrgPage().setEditableTextFiels(false);
                change = false;
            } else {
            manager.getOrgPage().setEditableTextFiels(true);
            change = true;
            }
        }       
    }
}