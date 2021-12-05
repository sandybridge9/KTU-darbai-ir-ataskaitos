/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Projektas;

import java.util.Random;

/**
 *
 * @author Tadas PC
 */
public class Girliandos {
    
    private final String[] firmos = {"Hitachi", "Panasonic", "Sony", "Samsung", "Softis"};
    private final String[] spalvos = {"Melyna", "Zalia", "Raudona",
        "Geltona", "Balta", "Violetine", "Rozine"};
    
    private String firma;
    private String spalva;
    private int lempuciuSkaicius;
    private double ilgis;
    
    public Girliandos(){
        
    }
    
    public Girliandos(String firma, String spalva, int lempuciuSkaicius, double ilgis){
        this.firma = firma;
        this.spalva = spalva;
        this.lempuciuSkaicius = lempuciuSkaicius;
        this.ilgis = ilgis; 
    }
    
    public Girliandos generuotiGirlianda(){
        Random rand = new Random();
        int firmosSk = rand.nextInt(firmos.length);
        int spalvosSk = rand.nextInt(spalvos.length);
        int lempuciuSk = rand.nextInt(120)+1;
        double ilgis = rand.nextInt(100)/1.2*4.33;
        
        Girliandos naujaGirlianda = new Girliandos(firmos[firmosSk], spalvos[spalvosSk], lempuciuSk, ilgis);
        return naujaGirlianda;
    }
    
    public String getFirma(){
        return firma;
    }
    public String getSpalva(){
        return spalva;
    }
    public int getLempSk(){
        return lempuciuSkaicius;
    }
    public double getIlgis(){
        return ilgis;
    }
    public String toString(){  // surenkama visa reikalinga informacija
        return String.format("%-10s| %-16s| %3s| %-20s|",
               firma, spalva, lempuciuSkaicius, ilgis);
    };
    
    
}
