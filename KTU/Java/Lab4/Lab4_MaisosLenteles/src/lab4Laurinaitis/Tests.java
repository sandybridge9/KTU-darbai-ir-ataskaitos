/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4Laurinaitis;

import java.util.Random;
import laborai.studijosktu.HashType;

/**
 *
 * @author Tadas PC
 */
public class Tests {
    
    public static void main(String[] args){
        MapKTUOA<Integer, String> map = new MapKTUOA(200);
        //map.setEmptyNode(-1, null);
        //int[] keys = {1,2,3,4,5,6,7,8,9};
        String[] data = {"Hello", "Hi", "HHenlo", "Buenos", "HHelau", "hai"};
        Random rand = new Random();
        for(int i = 0; i < 35; i++){
            map.put(i, data[rand.nextInt(6)]);
            //System.out.println(map.table[i].value);
        }
        System.out.println(map.realSize());
        
        for(int i = 0; i < map.realSize(); i++){
            System.out.println(+i +" " +map.get(i));
        }
        for(int i = 0; i < map.realSize(); i++){
            System.out.println(map.contains(i));
        }
        map.remove(0);
                map.remove(4);
                        map.remove(6);
                                map.remove(19);
                                
                                
        for(int i = 0; i < map.realSize(); i++){
            System.out.println(+i +" " +map.get(i));
        }
        
    }
    
}
