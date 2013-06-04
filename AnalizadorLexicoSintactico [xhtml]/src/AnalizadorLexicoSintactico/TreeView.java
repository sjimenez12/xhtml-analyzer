/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorLexicoSintactico;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.UIManager;

import javax.swing.JTree;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreeSelectionModel;
import java.awt.Dimension;

public class TreeView extends JPanel {

    private JTree tree;
    //Optionally play with line styles.  Possible values are
    //"Angled" (the default), "Horizontal", and "None".
    private static boolean playWithLineStyle = false;
    private static String lineStyle = "Horizontal";
    //Optionally set the look and feel.
    private static boolean useSystemLookAndFeel = false;

    public TreeView(String file) {
        //super(new GridLayout(1,0));

        //Create the nodes.
        DefaultMutableTreeNode top = new DefaultMutableTreeNode(file);


        /*--------------------------------------------------------------------*/
        //node root = getRoot();
        //DefaultMutableTreeNode raiz = new DefaultMutableTreeNode (root.value);
        //createNodes(raiz, root);
        /*--------------------------------------------------------------------*/


        //Create a tree that allows one selection at a time.
        tree = new JTree(top);
        tree.getSelectionModel().setSelectionMode(TreeSelectionModel.SINGLE_TREE_SELECTION);

        //Listen for when the selection changes.
        //tree.addTreeSelectionListener(this);

        if (playWithLineStyle) {
            System.out.println("line style = " + lineStyle);
            tree.putClientProperty("JTree.lineStyle", lineStyle);
        }

        //Create the scroll pane and add the tree to it.
        JScrollPane treeView = new JScrollPane(tree);
        Dimension minimumSize = new Dimension(100, 50);
        treeView.setMinimumSize(minimumSize);
        add(treeView);

    }

    public TreeView(String file, TreeNode nodoAux) {
        //super(new GridLayout(1,0));

        //Create the nodes.
        DefaultMutableTreeNode top = new DefaultMutableTreeNode(file);


        /*--------------------------------------------------------------------*/
        TreeNode root = nodoAux.getRoot(nodoAux);
        DefaultMutableTreeNode raiz = new DefaultMutableTreeNode(root.toString());
        createNodes(raiz, root);
        /*--------------------------------------------------------------------*/


        //Create a tree that allows one selection at a time.
        tree = new JTree(top);
        tree.getSelectionModel().setSelectionMode(TreeSelectionModel.SINGLE_TREE_SELECTION);

        //Listen for when the selection changes.
        //tree.addTreeSelectionListener(this);

        if (playWithLineStyle) {
            System.out.println("line style = " + lineStyle);
            tree.putClientProperty("JTree.lineStyle", lineStyle);
        }

        //Create the scroll pane and add the tree to it.
        JScrollPane treeView = new JScrollPane(tree);
        Dimension minimumSize = new Dimension(100, 50);
        treeView.setMinimumSize(minimumSize);
        add(treeView);

    }

    private void createNodes(DefaultMutableTreeNode padre, TreeNode nodo) {
        DefaultMutableTreeNode nodoGrafico = null;
        for (TreeNode auxNode : nodo.children()) {

            nodoGrafico = new DefaultMutableTreeNode(auxNode.toString());
            padre.add(nodoGrafico);
            createNodes(nodoGrafico, auxNode);
        }

    }

    /**
     * Create the GUI and show it. For thread safety, this method should be
     * invoked from the event dispatch thread.
     */
    private static void createAndShowGUI() {
        if (useSystemLookAndFeel) {
            try {
                UIManager.setLookAndFeel(
                        UIManager.getSystemLookAndFeelClassName());
            } catch (Exception e) {
                System.err.println("Couldn't use system look and feel.");
            }
        }

        //Create and set up the window.
        JFrame frame = new JFrame("Arbol de parsing");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        //Add content to the window.
        frame.add(new TreeView("Hola"));

        //Display the window.
        frame.pack();
        frame.setVisible(true);
    }

    public static void main(String[] args) {
        //Schedule a job for the event dispatch thread:
        //creating and showing this application's GUI.
        javax.swing.SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                createAndShowGUI();
            }
        });
    }
}