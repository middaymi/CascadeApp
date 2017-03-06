package models;

import data.Organization;
import dataBase.DataBaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import views.OrganizationPage;

public class OrganizationModel {
    
    private static OrganizationModel OrganizationModelInstance = null;
    private final Connection DBC = DataBaseConnection.getInstanceDataBase().
                                   getDBconnection();
    private OrganizationModel() {}    
    public static OrganizationModel getOrganizationModelInstance() {
        if (OrganizationModelInstance == null)
            OrganizationModelInstance = new OrganizationModel();
        return OrganizationModelInstance;
    }    
    //select all information about organization from DB
    String selectAllFromOrganization = "select * from organization";   
    private ResultSet getOrganizationFields() {
        Statement stmt;
        ResultSet rs = null;
        try {
            stmt = DBC.createStatement();
            rs = stmt.executeQuery(selectAllFromOrganization); 
        } catch (SQLException ex) {
            Logger.getLogger(OrganizationModel.class.getName()).
                             log(Level.SEVERE,"no executed "
                             + "query 'selectAllFromOrganization'", ex); 
        }
        return rs;
    }
    //fill data about organization
    public Organization getOrganizationData() {                  
         ResultSet res = getOrganizationFields();
         Organization organization = new Organization();         
         try {                        
            while (res.next()) {
                organization.setFullName(res.getString("fullName"));
                organization.setPhoneNumber(res.getString("PhoneNumber"));
                organization.setSite(res.getString("Site"));
                organization.seteMail(res.getString("EMail"));
                organization.setOGRN(res.getString("OGRN"));
                organization.setKPP(res.getString("KPP"));
                organization.setINN(res.getString("INN"));
                organization.setAccount(res.getString("Account"));
                organization.setLegalAddress(res.getString("LegalAddress"));
                organization.setActualAddress(res.getString("ActualAddress")); 
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrganizationPage.class.getName()).
                             log(Level.SEVERE, "no setText on textFields", ex);
        }
        return organization;
    }
}
