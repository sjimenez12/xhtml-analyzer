package analizadorlexico;

import java.awt.event.ActionEvent;
import java.io.*;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;

public class LAI extends javax.swing.JFrame {

    public JFileChooser jfcExaminarEntrada;
    public File file;
    LinkedList<Nodo> ListaToken;
    public int iIndex;
    public LAI() {
        jfcExaminarEntrada = new JFileChooser();
        initComponents();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        campoDireccion = new javax.swing.JTextField();
        searchButton = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jScrollPane3 = new javax.swing.JScrollPane();
        TablaResultado = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("File");

        campoDireccion.setEditable(false);

        searchButton.setText("...");
        searchButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchButtonActionPerformed(evt);
            }
        });

        jButton2.setText("Start Analisis");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);

        TablaResultado.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null},
                {null, null, null},
                {null, null, null},
                {null, null, null},
                {null, null, null},
                {null, null, null},
                {null, null, null}
            },
            new String [] {
                "Nombre", "Tipo deToken", "Linea"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jScrollPane3.setViewportView(TablaResultado);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(jScrollPane3, javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(layout.createSequentialGroup()
                                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGap(3, 3, 3)
                                    .addComponent(campoDireccion, javax.swing.GroupLayout.PREFERRED_SIZE, 356, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGap(18, 18, 18)
                                    .addComponent(searchButton))
                                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 460, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(177, 177, 177)
                        .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(19, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(14, 14, 14)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(searchButton, javax.swing.GroupLayout.Alignment.TRAILING)
                        .addComponent(campoDireccion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jLabel1))
                .addGap(18, 18, 18)
                .addComponent(jButton2)
                .addGap(29, 29, 29)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(50, 50, 50)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(60, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void searchButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchButtonActionPerformed
        // TODO add your
        int returnVal = this.jfcExaminarEntrada.showOpenDialog(this);//mostramos el jFileChooser
        if (returnVal == this.jfcExaminarEntrada.APPROVE_OPTION) {//nos aseguramos q haya selecionado algun archivo
            file = this.jfcExaminarEntrada.getSelectedFile();//obtenemos el archivo selecionado
            this.campoDireccion.setText(file.toString());
        }

    }//GEN-LAST:event_searchButtonActionPerformed

    public void StartAnalisis() throws IOException {

        if (!campoDireccion.getText().equals("")) {
            Reader reader = new BufferedReader(new FileReader(campoDireccion.getText()));
            Lexer lexer = new Lexer(reader);
            ListaToken = new LinkedList<Nodo>();
            String resultado = "";
            int error = 0;
            int OpAritmetico = 0;
            int OpLogico = 0;
            int OpAsignacion = 0;
            int OpPrecedencia = 0;
            int id = 0;
            int palabraReservada = 0;
            int literal = 0;
            while (true) {
                Nodo token = lexer.yylex();
                
                if (token == null) {
                    resultado = resultado + "\nFIN\n\n==================================================\nResultados\n--------------------------------------------------";
                    /*resultado += "\nOperadores Aritmeticos: " + OpAritmetico;
                    resultado += "\nOperadores Logico: " + OpAritmetico;
                    resultado += "\nOperadores de Precedencia: " + OpPrecedencia;
                    resultado += "\nOperadores de Asignacion: " + OpAsignacion;
                    resultado += "\nID's: " + OpAritmetico;
                    resultado += "\nPalabras Reservadas: " + palabraReservada;
                    resultado += "\nLiterales: " + literal;
                    */
                    
                    if (error > 0) {
                        resultado += "\nSe encontraron errores\nNumero de errores: " + error;
                    } else {
                        resultado += "\nCompilado sin errores!!\n";
                    }
                    resultado += "\n==================================================\n";
                    jTextArea1.setText(resultado);
                    tablaResultado();
                    return;
                }
              
               token._Nombre=lexer.lexeme;
               
               if (estaNodo(token._Nombre, token._Posicion[1])){
                    token._Posicion[0]++;
                    ListaToken.set(iIndex, token);
                }
                    
                else
               {ListaToken.add(token);}
                
                switch (token._Dato) {
                    case ERROR:
                        resultado += "Caracter no reconocido" + " En linea "+ token._Posicion[1]+ " \n";//.dato.toString() + "(" + token.posicion[0] + " ," + token.posicion[1] + ")\n";
                        error++;
                        break;
                     case ERROR_UNTERM_STRING:
                        resultado += "String sin cerrar" + " En linea "+ token._Posicion[1]+ " \n";//.dato.toString() + "(" + token.posicion[0] + " ," + token.posicion[1] + ")\n";
                        error++;
                        break;
                     case ERROR_UNTERM_COMMENT:
                        resultado += "Comentario sin cerrar" + " En linea "+ token._Posicion[1]+ " \n";//.dato.toString() + "(" + token.posicion[0] + " ," + token.posicion[1] + ")\n";
                        error++;
                        break;/*
                    case ID:
                        //resultado += "Tipo: Id" + "\nNombre:" + token._Nombre+"\nLinea: "+token._Posicion[1] +"("+ token._Posicion[0] +") \n\n" ;
                        id++;
                        break;
                    case OPERADOR_LOGICO:
                        //resultado += "Tipo: Operador Logico"  + "\nNombre:" + token._Nombre+"\nLinea: "+token._Posicion[1] +"("+ token._Posicion[0] +") \n\n" ;
                        OpLogico++;
                        break;
                    case OPERADOR_ARITMETICO:
                        //resultado += "Tipo: Operador Aritmetico"  + "\nNombre:" + token._Nombre+"\nLinea: "+token._Posicion[1] +"("+ token._Posicion[0] +") \n\n" ;
                        OpAritmetico++;
                        break;
                    case PALABRA_RESERVADA:
                        //resultado += "Tipo: Palabra Reservada"  + "\nNombre:" + token._Nombre+"\nLinea: "+token._Posicion[1] +"("+ token._Posicion[0] +") \n\n" ;
                        palabraReservada++;
                        break;
                    case LITERAL:
                        //resultado += "Tipo: Literal"  + "\nNombre:" + token._Nombre+"\nLinea: "+token._Posicion[1] +"("+ token._Posicion[0] +") \n\n" ;
                        literal++;
                    case OPERADOR_PRECEDENCIA:
                       // resultado += "Tipo: Operador de Precedencia"  + "\nNombre:" + token._Nombre+"\nLinea: "+token._Posicion[1] +"("+ token._Posicion[0] +") \n\n" ;
                        OpPrecedencia++;
                    case OPERADOR_ASIGNACION:
                        //resultado += "Tipo: Operador de Asignacion"  + "\nNombre:" + token._Nombre+"\nLinea: "+token._Posicion[1] +"("+ token._Posicion[0] +") \n\n" ;
                        OpAsignacion++;
                        break; */
                    default:

                }
            }
        }

    }
  public void tablaResultado(){
        Object[][] matriz = new Object [ListaToken.size()][3];
        for(int i =0; i<ListaToken.size();i++){
            
            matriz[i][0] = ListaToken.get(i)._Nombre;
            matriz[i][1] = ListaToken.get(i)._Dato.toString();
            ListaToken.get(i)._Posicion[0]++;
            ListaToken.get(i)._Posicion[1]++;
            matriz[i][2] = ListaToken.get(i)._Posicion[1]+ "(" + ListaToken.get(i)._Posicion[0] + ")";
          
        }
        TablaResultado.setModel(new javax.swing.table.DefaultTableModel(matriz,
            new String [] {
                "Nombre", "Tipo de Token","Linea"
        }
        ));
    }
  public boolean estaNodo(String pNombre, int pLinea){
        for(int i =0; i<ListaToken.size();i++){
            
            if ((ListaToken.get(i)._Nombre.compareTo(pNombre)==0) && (ListaToken.get(i)._Posicion[1]== pLinea))
            {
                iIndex=i;
                return true;
            }
        }
        return false;        
    }
    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        try {
            StartAnalisis();
        } catch (IOException ex) {
            Logger.getLogger(LAI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jButton2ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /*
         * Set the Nimbus look and feel
         */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /*
         * If Nimbus (introduced in Java SE 6) is not available, stay with the
         * default look and feel. For details see
         * http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(LAI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(LAI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(LAI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(LAI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /*
         * Create and display the form
         */
        java.awt.EventQueue.invokeLater(new Runnable() {

            public void run() {
                new LAI().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTable TablaResultado;
    public javax.swing.JTextField campoDireccion;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTextArea jTextArea1;
    public javax.swing.JButton searchButton;
    // End of variables declaration//GEN-END:variables
}
