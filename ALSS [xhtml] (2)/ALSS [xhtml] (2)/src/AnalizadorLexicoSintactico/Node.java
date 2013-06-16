package AnalizadorLexicoSintactico;

import java.util.ArrayList;

public class Node {

    private String label;
    private String value;
    private int row;
    private int column;
    public ArrayList<Node> parametros;

    /**
     * Constructor1 de clase node
     *
     * @param lab
     * @param r
     * @param c
     * @param par
     */
    public Node(String lab, int r, int c, ArrayList<Node> par) {
        this.label = lab;
        this.row = r;
        this.column = c;
        this.parametros = par;
    }

    /**
     * Constructor2 de la clase node
     *
     * @param lab
     * @param r
     * @param c
     */
    public Node(String lab, int r, int c) {
        this.label = lab;
        this.row = r;
        this.column = c;

    }

    /**
     * Constructor3 de la clase node
     *
     * @param lab
     */
    public Node(String lab) {
        this.label = lab;
    }

    /**
     *
     * @return the label
     */
    public String getLabel() {
        return label;
    }

    /**
     * @param label the label to set
     */
    public void setLabel(String label) {
        this.label = label;
    }

    /**
     * @return the row
     */
    public int getRow() {
        return row;
    }

    /**
     * @param row the row to set
     */
    public void setRow(int row) {
        this.row = row;
    }

    /**
     * @return the column
     */
    public int getColumn() {
        return column;
    }

    /**
     * @param column the column to set
     */
    public void setColumn(int column) {
        this.column = column;
    }

    /**
     * @return the parametros
     */
    public ArrayList<Node> getParametros() {
        return parametros;
    }
    

    /**
     * @param parametros the parametros to set
     */
    public void setParametros(ArrayList<Node> parametros) {
        this.parametros = parametros;
    }

    /**
     * @return the value
     */
    public String getValue() {
        return value;
    }

    /**
     * @param value the value to set
     */
    public void setValue(String value) {
        this.value = value;
    }
}
