package models.Performance;

import lombok.Data;

import java.util.Enumeration;
import javax.swing.DefaultCellEditor;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableColumn;
import javax.swing.table.TableColumnModel;

@Data
public class PerformanceColumnModel {
    
    private final JTable table;
    private TableColumnModel columnModel;
    private DefaultTableCellRenderer render;
    
    //table columns settings (setWidth, remove ID column, move some columns)
    public void setTableColumnsSettings() {
        render = new DefaultTableCellRenderer();        
        columnModel = table.getColumnModel();
        Enumeration e = columnModel.getColumns();
        //del ID column and exchange columns
        columnModel.removeColumn((TableColumn)columnModel.getColumn(0));
        columnModel.removeColumn((TableColumn)columnModel.getColumn(5));
        columnModel.moveColumn(5, 1);        
        render.setHorizontalAlignment(DefaultTableCellRenderer.CENTER);
        table.setColumnModel(columnModel);
        
        //combobox-seasons cell        
        columnModel.getColumn(1).setCellEditor
        (new DefaultCellEditor(PerformanceModel.getPerformanceModelInstance().getComboSeasons()));
    }    
}
