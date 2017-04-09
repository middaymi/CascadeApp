package models.Employee;

import javax.swing.*;
import javax.swing.table.*;
import java.sql.Date;
import java.util.Calendar;

public class DateCellEditor extends AbstractCellEditor implements TableCellEditor {
    // редактор - прокручивающийся список
    private JSpinner editor;
    
    // конструктор
    public DateCellEditor() {
        // настраиваем прокручивающийся список
        SpinnerDateModel model = new SpinnerDateModel( new java.sql.Date(System.currentTimeMillis()), null, null, Calendar.SHORT_STANDALONE);
        editor = new JSpinner(model);
    }
    
    // возвращает компонент, применяемый для редактирования
    public java.awt.Component getTableCellEditorComponent(JTable table, Object value, 
                                                          boolean isSelected, 
                                                          int row, int column) {
        // меняем значение и возвращаем список
        editor.setValue(value);
        return editor;
    }
    
    // возвращает текущее значение в редакторе
    public Object getCellEditorValue() {
        return editor.getValue();
    }
}