package controllers.EmployeePage;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import models.EmployeeModel;
import views.Manager;

public class EmpChangeButtonListener implements ActionListener{ 
    Manager manager = Manager.getManagerInstance();
    private EmployeeModel employeeModel = EmployeeModel.getOrganizationModelInstance();
   
    boolean change = false;
    public void actionPerformed(ActionEvent e) {        
        if (manager.getEmpPage() != null) {
            if (change == true) {
                manager.getEmpPage().setBtnsMode(false);
//                //organizationModel.checkTextFields();
//                manager.getOrgPage().setFields();
//                //organizationModel.updateOrganizationFields();
//                manager.getOrgPage().setEditableTextFiels(false);
                change = false;
            } else {
//            manager.getOrgPage().setEditableTextFiels(true);
            manager.getEmpPage().setBtnsMode(true);
            change = true;
            }
        }       
    }
}
