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
public class DoubleLinkedList<E> implements DoubleLinkedListInterface<E> {
    
    private Node<E> first;
    private Node<E> last;
    private Node<E> current;
    private int size;
    
    public DoubleLinkedList(){
        
    }//Node(data, previous, next)
    @Override
    public void add(E object){
	if (first == null) {
            first = new Node(object, null, null);
            last = first;
	} 
        else{
            Node<E> node = new Node(object, last, null);
            last.next = node;
            last = node;
	}
	size++;
    }

    @Override
    public void remove(int k){
        if (k < 0 || k >= size) {
            System.out.println("Netinkamas k skaicius. ");
        }
        Node<E> temp1 = first.findNode(k);
        if(k != 0){
            Node<E> temp2 = first.findNode(k - 1);
            temp2.next = temp1.next;
            temp1.next = null;
            size--;
        }
        else if(k == 0){
            first = first.next;
            size--;
        }
    }
    
    @Override
    public boolean isEmpty(){
        if(size == 0){
                return true;
        }
        else if(first == null){
            return true;
        }
        else
            return false;
    }
    @Override
    public void clear(){
        first = null;
        last = null;
        current = null;
        size = 0;
        System.out.println("***Isvalomas sarasas***");
    }
    
    @Override
    public E get(int k) {
	if (k < 0 || k >= size) {
            return null;
	}
	current = first.findNode(k);
	return current.data;
    }

    
    @Override
    public void set(int number, E e){
        Node<E> temp = first.findNode(number);
        temp.data = e;
    }
    //Nutrina pirma sutikta objekta lygu o
    public boolean removeFirstOccurence(Object o){
        boolean removed = false;
        int count = 0;
        for (Node<E> elem = first; elem != null; elem = elem.next) {
            if(elem.data == o){
                Node<E> temp1 = first.findNode(count);
                if(count != 0){
                    Node<E> temp2 = first.findNode(count - 1);
                    temp2.next = temp1.next;
                    temp1.next = null;
                    size--;
                    return true;
                }
                else if(count == 0){
                    first = first.next;
                    size--;
                    System.out.println("ascia");
                    return true;
                }
            }
            else
                count++;
            }
            if(removed = false){
                System.out.println("Neistrinta");
            }
            return removed;
    }
    //Nutrina elementus nuo k iki pat pradzios (pradeda eiti nuo pabaigos)
    public boolean removeFromToBeggining(int k){
        for(Node<E> nodeF = last; nodeF != null; nodeF = nodeF.previous){
            if(k > 0){
                remove(k);
                k--;
                System.out.println("Removing element Nr. " +k);
            }
            else
                break;
        }
        return true;
    }
    
    public int getSize(){
        return size;
    }
    
    /**
     * Mazgo klase
     * 
     * @param <E> duomenu tipas
     */
    public class Node<E>{
        
        private E data;
        private Node<E> previous;
        private Node<E> next;

        
        Node(E data, Node<E> previous, Node<E> next){
            this.data = data;
            this.previous = previous;
            this.next = next;
        }
        Node(){
            
        }
        
        public Node<E> findNode(int k) {
            Node<E> e = this;
            for (int i = 0; i < k; i++) {
                e = e.next;
            }
            return e;
	}
        
        public E getData(){
            
            return data;
        }
    }
    
}
