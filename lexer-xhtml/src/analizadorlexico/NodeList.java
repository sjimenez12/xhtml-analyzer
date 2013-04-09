package analizadorlexico;

import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.Symbol;

class Nodo {

    public Token _Dato;
    public int[] _Posicion;
    public Nodo _Siguiente;
    public String _Nombre ;
    
    public Nodo(Token pToken, int[] pPosicion,String pNombre) {
        _Dato = pToken;
        _Posicion = pPosicion;
        _Nombre= pNombre;
        _Siguiente = null;    
     
    }
    
    public Nodo(Token pToken, int[] pPosicion) {
        _Dato = pToken;
        _Posicion = pPosicion;
        _Nombre= "";
        _Siguiente = null;
       
        
     
    }
}

public class NodeList {

    public int cuenta = 0;
    public Nodo primero;
    public Nodo ultimo;
    
    public NodeList() {
        
    }

    public void InverseShow() {
        Nodo aux = primero;
        Nodo aux2 = aux;

        for (int a = (Count(aux)); aux != null; a--) {
            for (int b = 0; b <= a; b++) {
                if (b == a) {
                    System.out.println(", " + aux2._Dato);
                }
                aux2 = aux2._Siguiente;

            }
        }
    }

    public int Count(Nodo b) {
        int a = 0;
        for (a = 1; b._Siguiente != null; a++) {
            b = b._Siguiente;
        }
        return a;
    }

    public void Insert(Nodo nodo) {
        cuenta++;
        if (primero == null) {
            primero = ultimo = nodo;

        } else {
            ultimo = ultimo._Siguiente = nodo;
        }
    }
}
