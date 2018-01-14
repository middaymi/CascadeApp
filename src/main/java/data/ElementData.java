package data;

import lombok.Data;

@Data
public class ElementData {
    private int id;				
    private int elementTypeId;
    private String fullNameEng;
    private String fullNameRus;
    private String abbreviation;
    private int level;
    private float base;	
    private float baseV;	
    private float baseV1;
    private int baseV2;	
    private float valuePlus1;	
    private float valuePlus2;
    private float valuePlus3;
    private float valueMinus1;
    private float valueMinus2;
    private float valueMinus3;
        
    @Override
    public String toString() {
        return this.fullNameRus + " (" + this.abbreviation + ")";
    }    
}
