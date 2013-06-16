
package AnalizadorLexicoSintactico;

import java.io.File; //Como usamos new File() ocupamos importar esta librería
public class MLexer {

    public static void main(String[] args) {
        JFlex.Main.generate(new File("src//AnalizadorLexicoSintactico//scanner.flex"));
    }
}
