package controllers.EmployeePage;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import models.EmployeeModel;
import views.Manager;

public class DelBtnListener implements ActionListener{ 
    private Manager manager = Manager.getManagerInstance();
    private EmployeeModel employeeModel = EmployeeModel.getOrganizationModelInstance();
          
    public void actionPerformed(ActionEvent e) {        
        if (manager.getEmpPage() != null) {
                employeeModel.delSelectedRow();
        }       
    }
}
