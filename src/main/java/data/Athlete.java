package data;

import lombok.Data;

import java.util.Date;
import java.util.GregorianCalendar;

//storage data class
@Data
public class Athlete { 
    private int id;
    private String surname;
    private String name;
    private String middlename;
    private Date birthday;
    private int idrank;
    private String assigneeFullName;
    private String phoneNumber;
    private String actualAddress;
    private String mainDocumentCopy;
    private String  medicalCertificate;
    private String insurance;
    private boolean sex;

    public int getAge() {
        GregorianCalendar calendar = new GregorianCalendar();
        calendar.setTime(this.birthday);
        return this.calculateYears(calendar);
    }
    
    @Override
    public String toString() {
        return getSurname() + " " + getName() + " " + getMiddlename();
    }
    
    private int calculateYears(GregorianCalendar birthDay) {        
        GregorianCalendar checkDay = new GregorianCalendar();
        int years = checkDay.get(GregorianCalendar.YEAR) - birthDay.get(GregorianCalendar.YEAR);        
        //if current month lower month of birthday 
        int checkMonth = checkDay.get(GregorianCalendar.MONTH);
        int birthMonth = birthDay.get(GregorianCalendar.MONTH);
        if (checkMonth < birthMonth) {
            years --;
        } else if (checkMonth == birthMonth 
            && checkDay.get(GregorianCalendar.DAY_OF_MONTH) 
            < birthDay.get(GregorianCalendar.DAY_OF_MONTH)) {
            //if months are equals, but day is lower
            years --;
        }
        return years;
    }
}


