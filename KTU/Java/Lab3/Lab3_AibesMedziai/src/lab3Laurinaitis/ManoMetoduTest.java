/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab3Laurinaitis;

import java.util.Iterator;
import laborai.studijosktu.AvlSetKTU;
import laborai.studijosktu.BstSetKTU;
import laborai.studijosktu.SetADT;
import laborai.studijosktu.SortedSetADT;

public class ManoMetoduTest {
    
    public static void main(String[] args){
        BstSetKTU<Integer> elements = new BstSetKTU<>();
        int[] ints = {1,2,3,5,6,7,8,9,7,5,3};
        
        for(int i : ints){
            elements.add(i);
        }
        
        int h = 3;
        int higherr = elements.higher(h);
        System.out.println("Least element strictly higher than: " +h +" is: " +higherr);
        
        int pollLastt = elements.pollLast();
        System.out.println("pollLast() = "+pollLastt +" Set after pollLast(): ");
        for(int i : elements){
            System.out.println(i);
        }
        
        int l = elements.last();
        System.out.println("Last(highest) element is: " +l);
        
        SortedSetADT<Integer> subSet = elements.SubSet(3, true, 7, true);
        for(int i : subSet){
            System.out.println(i);
        }

        int lw = 6;
        int lowerr = elements.lower(lw);
        System.out.println("Greatest element strictly lower than: " +lw +" is: " +lowerr);
    }
    
}
