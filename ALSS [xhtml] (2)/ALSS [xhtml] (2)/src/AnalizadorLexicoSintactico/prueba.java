/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorLexicoSintactico;

import java.util.ArrayList;

/**
 *
 * @author anram88
 */
public class prueba {

    public static void main(String[] args) {
        ArrayList<Node> mainScope = new ArrayList<Node>();
        ArrayList<Node> parametros = new ArrayList<Node>();

        Node n1 = new Node("Parragraph", 1, 1);
        Node p1 = new Node("ID", 1, 2);

        p1.setValue("10");
        parametros.add(p1);

        Node p2 = new Node("width", 1, 2);
        p2.setValue("10");
        parametros.add(p2);
        
        n1.setParametros(parametros);

        //Node aux = mainScope.get(mainScope.size() - 1);
        mainScope.add(n1);

        parametros = new ArrayList<Node>();
        Node n2 = new Node("Parragraph2", 2, 1);
        Node p12 = new Node("name", 2, 2);

        
        p12.setValue("20");
        parametros.add(p12);

        Node p22 = new Node("height", 2, 2);
        p22.setValue("20");
        parametros.add(p22);
        n2.setParametros(parametros);

        //Node aux = mainScope.get(mainScope.size() - 1);
        mainScope.add(n2);
        
        
        for (Node x : mainScope) {
            if (x != null) {
                String label = x.getLabel();
                int row = x.getRow();
                int col = x.getColumn();
                System.out.println(label + " (Linea: " + row + "  Columna: " + col+ ")");

                if (x.getParametros() != null) {
                    for (Node y : x.getParametros()) {
                        String label2 = y.getLabel();
                        String value = y.getValue();                  
                        System.out.println("└" + label2 + " =" + value );
                    }
                }
            }
        }
    }


    }


