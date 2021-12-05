/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Projektas;

public interface DoubleLinkedListInterface<E> {
    //Objekto pridejimui
    void add(E object);
    //Objekto pasalinimui
    void remove(int k);
    //Patikrinimui ar sarasas tuscias
    boolean isEmpty();
    //Saraso elemento gavimui
    E get(int number);
    //Saraso elemento reiksmes pakeitimui
    void set(int number, E element);
    //Isvalo sarasa
    void clear();
}
