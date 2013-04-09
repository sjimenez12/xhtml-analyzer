package analizadorlexico;

import java.io.File;

public class AnalizadorLexico {

    public static void main(String[] args) {
        String path = "//home/anram88/Documents/Development/NetBeansProjects/lexer-xhtml/src/analizadorlexico/Lexer.flex";
        generateLexer(path);
    }

    public static void generateLexer(String path) {
        File file = new File(path);
        JFlex.Main.generate(file);

    }
}
