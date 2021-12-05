/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4Laurinaitis;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import laborai.studijosktu.HashType;
import laborai.studijosktu.MapADT;

public class MapKTUOA<K, V> implements MapADT<K, V> {
    
    private Node<K, V>[] table;
    private int size;
    private int realSize;
    private Node<K, V> emptyNode;
    
    public MapKTUOA(){  
    }
    
    public MapKTUOA(int size){
        this.size = size;
        table = new Node[size];
        //emptyNode.setValue((V)"tuscias");
        realSize = 0;
        //for(Node<K,V> node : table){
        //    node = null;
        //}
    }
    
    public int hash1(K key){
        return key.hashCode();
    }
    
    public int hash2(K key){
        return 7 - (Math.abs(key.hashCode())%7);
    }
    
    @Override
    public boolean isEmpty(){
        return (size == 0 && realSize == 0);
    }
    
    @Override
    public int size(){
        return size;
    }
    
    public int realSize(){
        return realSize;
    }
    
    @Override
    public void clear(){
        Arrays.fill(table, null);
        size = 0;
        emptyNode = null;
    }
    
    @Override
    public V put(K key, V value){
        Node<K, V> node = new Node(key, value);
        int index = hash1(key);
        int index0 = index;
        int count = 0;
        while (table[index] != null && table[index].getKey().equals(key) == false) {
            count++;
            index = (index0 + count * hash2(key)) % table.length;
            
        }
        table[index] = node;
        realSize++;
        return node.getValue();
    }
    
    @Override
    public V get(K key){
        int index = hash1(key);
        int index0 = index;
        int count = 0;
        while (table[index] != null) {
            if(table[index].getKey().equals(key)){
                return table[index].getValue();
                
            }
            count++;
            index = (index0 + count * hash2(key)) % table.length;
            
        }
        return null;
    }
    
    @Override
    public V remove(K key){
        int index = hash1(key);
        int index0 = index;
        int count = 0;
        while (table[index] != null) {
            if(table[index].getKey().equals(key)){
                Node<K, V> node = table[index];
                table[index] = emptyNode;
                return node.getValue();
            }
            count++;
            index = (index0 + count * hash2(key)) % table.length; 
        }
        return null;
    }
    
    @Override
    public boolean contains(K key){
        int index = hash1(key);
        int index0 = index;
        int count = 0;
        while (table[index] != null) {
            if(table[index].getKey().equals(key)){
                return true;
            }
            count++;
            index = (index0 + count * hash2(key)) % table.length;
            
        }
        return false;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    protected class Node<K, V> {

        // Raktas        
        protected K key;
        // Reikšmė
        protected V value;

        protected Node() {
        }

        protected Node(K key, V value) {
            this.key = key;
            this.value = value;
        }

        @Override
        public String toString() {
            return key + "=" + value;
        }
        
        public V getValue(){
            return value;
        }
        
        public K getKey(){
            return key;
        }
        
        public void setValue(V value){
            this.value = value;
        }
    }
}