Maven Commands:

* To execute all test cases inside src/test/java folder:

  > mvn test

* To execute all the test cases inside specific feature:

  > mvn test "-Dkarate.options=classpath:reqResApp/feature/03_createUserDemo.feature"
  
* To execute all the test cases with a specific (@Regression) tag from all the features inside the feature folder:

  > mvn test "-Dkarate.options=--tags @Regression classpath:reqResApp/feature/"  

* To execute a specific scenario defined in line #21 from 03_createUserDemo.feature:

  > mvn test "-Dkarate.options=classpath:reqResApp/feature/03_createUserDemo.feature:21"


* Adding and using of external library in KarateDSL
1. Add the necessary Maven dependency for PDFBox to your pom.xml file. For example:
```
<dependency>
    <groupId>org.apache.pdfbox</groupId>
    <artifactId>pdfbox</artifactId>
    <version>2.0.25</version>
</dependency>
```
This will fetch the PDFBox library from the Maven repository.

2. Create a Karate feature file, let's say pdf.feature, where you want to use the PDFBox library.
3. In the feature file, you can use the karate-java keyword to write custom Java code that utilizes the PDFBox library. Here's an example of how you can extract text from a PDF using PDFBox:
```
Feature: Extract Text from PDF using PDFBox

Background:
  * configure karate.classpath('path/to/your/pdfbox.jar')

Scenario: Extract text from a PDF
  Given def PDFTextExtractor = Java.type('com.example.PDFTextExtractor')
  And def pdfPath = 'path/to/your/pdf/file.pdf'
  When def extractedText = PDFTextExtractor.extractText(pdfPath)
  Then print extractedText
```
4. Create a Java class, PDFTextExtractor, in your project's source code folder (e.g., src/main/java/com/example/) with the following code:
```
package com.example;

import java.io.File;
import java.io.IOException;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

public class PDFTextExtractor {
    public static String extractText(String filePath) {
        try (PDDocument document = PDDocument.load(new File(filePath))) {
            PDFTextStripper stripper = new PDFTextStripper();
            return stripper.getText(document);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
```
This Java class uses the PDFBox library to extract text from a PDF file.

Compile and run your Karate tests, and when the pdf.feature scenario is executed, it will call the PDFTextExtractor.extractText() method to extract the text from the specified PDF file.
Make sure to replace 'path/to/your/pdfbox.jar' with the actual path to the PDFBox JAR file. Also, update 'path/to/your/pdf/file.pdf' with the path to the PDF file you want to extract text from.

Note: You may need to adjust the Java package name and file structure according to your project's setup.