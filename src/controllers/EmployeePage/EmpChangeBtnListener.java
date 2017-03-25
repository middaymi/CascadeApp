package controllers.EmployeePage;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import models.EmployeeModel;
import views.Manager;

public class EmpChangeBtnListener implements ActionListener{ 
    Manager manager = Manager.getManagerInstance();
    private EmployeeModel employeeModel = EmployeeModel.getOrganizationModelInstance();
   
    boolean change = false;
    public void actionPerformed(ActionEvent e) {        
        if (manager.getEmpPage() != null) {
            if (change == true) {
                manager.getEmpPage().setBtnsMode(false);
                employeeModel.updateData();
                change = false;
            } else {
            manager.getEmpPage().setBtnsMode(true);
            change = true;
            }
        }       
    }
}
