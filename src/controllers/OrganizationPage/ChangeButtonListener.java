package controllers.OrganizationPage;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import views.Manager;
import models.OrganizationModel;

public class ChangeButtonListener implements ActionListener{ 
    Manager manager = Manager.getManagerInstance();
    OrganizationModel organizationModel = OrganizationModel.getOrganizationModelInstance();
    boolean change = false;
    public void actionPerformed(ActionEvent e) {        
        if (manager.getOrgPage() != null) {
            if (change == true) {
                organizationModel.checkTextFields();
                manager.getOrgPage().setFields();
                organizationModel.updateOrganizationFields();
                manager.getOrgPage().setEditableTextFiels(false);
                change = false;
            } else {
            manager.getOrgPage().setEditableTextFiels(true);
            change = true;
            }
        }       
    }
}