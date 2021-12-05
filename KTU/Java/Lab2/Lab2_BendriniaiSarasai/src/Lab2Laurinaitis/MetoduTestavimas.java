/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Lab2Laurinaitis;

/**
 *
 * @author Tadas PC
 */
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import studijosKTU.Ks;
import studijosKTU.ListKTU;

public class MetoduTestavimas {
    
    public static void main(String[] args){
        ListKTU b1 = new ListKTU();
        ListKTU b2 = new ListKTU();
        int[] data = {1, 2, 3};
        int[] data2 = {5, 8, 7, 9, 17, 3};
        for(int i : data){
            b1.add(i);
            b2.add(i);    
        }
        //b1.add(0,7);
        //b1.remove(1);
        System.out.println(b1.size());
        for(int x = 0; x < b1.size(); x++){
            System.out.println("b1 " +x+1 +"-toji reiksme: " +b1.get(x));
            System.out.println("b2 " +x+1 +"-toji reiksme: " +b2.get(x));
        }
        System.out.println("------------------------------------------");
        boolean b = b1.equals(b2);
        //boolean b = b1.removeFirstOccurence(6);
        //int b = (int) b1.removeLast();
        System.out.println(b);
        System.out.println(b1.size());
        for(int x = 0; x < b1.size(); x++){
            System.out.println("b1 " +x+1 +"-toji reiksme: " +b1.get(x));
            //System.out.println("b2 " +x+1 +"-toji reiksme: " +b2.get(x));
        }
    }
    
}
