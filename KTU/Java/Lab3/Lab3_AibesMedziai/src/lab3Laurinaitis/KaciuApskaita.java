/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab3Laurinaitis;

import laborai.studijosktu.BstSetKTU;
import laborai.studijosktu.SetADT;

/**
 *
 * @author Tadas PC
 */
public class KaciuApskaita{
    
    public static SetADT<String> kaciuVeisles(Kate[] kates) {
        SetADT<Kate> uni = new BstSetKTU<>(Kate.pagalVeisle);
        SetADT<String> kart = new BstSetKTU<>();
        for (Kate a : kates) {
            int sizeBefore = uni.size();
            uni.add(a);

            if (sizeBefore == uni.size()) {
                kart.add(a.getVeisle());
            }
        }
        return kart;
    }
    
}
