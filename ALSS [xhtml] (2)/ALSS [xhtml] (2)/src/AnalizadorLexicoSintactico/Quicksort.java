package AnalizadorLexicoSintactico;

import java.util.ArrayList;

public class Quicksort {

    private ArrayList<Node> mainScope = new ArrayList<Node>();
    private int inputArraySize;

    /**
     *
     * @param values
     */
    public void sort(ArrayList<Node> inputArray) {
        // Check for empty or null array
        if (inputArray == null || inputArray.size() == 0) {
            return;
        }
        this.mainScope = inputArray;
        inputArraySize = inputArray.size();
        quicksort(0, inputArraySize - 1);
    }

    /**
     *
     * @param low
     * @param high
     */
    private void quicksort(int low, int high) {
        int i = low, j = high;
        // Get the pivot element from the middle of the list
        Node pivot = mainScope.get(low + (high - low) / 2);

        // Divide into two lists
        while (i <= j) {
            // If the current value from the left list is smaller then the pivot
            // element then get the next element from the left list
            while (mainScope.get(i).getRow() < pivot.getRow()) {
                i++;
            }
            // If the current value from the right list is larger then the pivot
            // element then get the next element from the right list
            while (mainScope.get(j).getRow() > pivot.getRow()) {
                j--;
            }

            // If we have found a values in the left list which is larger then
            // the pivot element and if we have found a value in the right list
            // which is smaller then the pivot element then we exchange the
            // values.
            // As we are done we can increase i and j
            if (i <= j) {
                exchange(i, j);
                i++;
                j--;
            }
        }
        // Recursion
        if (low < j) {
            quicksort(low, j);
        }
        if (i < high) {
            quicksort(i, high);
        }
    }

    /**
     * Intercambia los nodos
     * @param i
     * @param j
     */
    private void exchange(int i, int j) {
        Node temp = mainScope.get(i);
        mainScope.set(i, mainScope.get(j));
        mainScope.set(j, temp);

    }
}
