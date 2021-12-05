/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Projektas;

/**
 *
 * @author Tadas PC
 */
public class TestDoubleLL {
    
    public static void main(String[] args){
        doEverything();
    }
    
    public static void doEverything(){
        DoubleLinkedList<Girliandos> sarasas = sukurtiGirlianduSarasa(5);
        System.out.println("Ar sarasas tuscias?: " +sarasas.isEmpty());
        for(int i = 1; i < sarasas.getSize(); i++){
            Girliandos g = sarasas.get(i);
            System.out.println("Nr. "+i +" " +g.toString());
        }
        System.out.println("----------------------------------------");
        sarasas.removeFirstOccurence(sarasas.get(4));
        System.out.println("Nutrinamas pirmas sutiktas elementas lygus elementui o");
        //for(int i = 1; i < 5; i++){
       //     sarasas.remove(0);
        //}
        for(int i = 1; i < sarasas.getSize(); i++){
            Girliandos g = sarasas.get(i);
            System.out.println("Nr. "+i +" " +g.toString());
        }
        System.out.println("----------------------------------------");
        sarasas.removeFromToBeggining(2);
        for(int i = 1; i < sarasas.getSize(); i++){
            Girliandos g = sarasas.get(i);
            System.out.println("Nr. "+i +" " +g.toString());
        }
        
        sarasas.clear();
        System.out.println("Ar sarasas tuscias?: " +sarasas.isEmpty());
        System.out.println("----------------------------------------");
        
    }
    
    public  static DoubleLinkedList<Girliandos> sukurtiGirlianduSarasa(int kiekis){
        DoubleLinkedList<Girliandos> girliandos = new DoubleLinkedList();
        for(int i = 0; i < kiekis; i++){
            Girliandos girlianda = new Girliandos().generuotiGirlianda();
            girliandos.add(girlianda);
        }
        return girliandos;
    }
}
