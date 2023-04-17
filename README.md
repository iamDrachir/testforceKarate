Maven Commands:

* To execute all test cases inside src/test/java folder:

  > mvn test

* To execute all the test cases inside specific feature:

  > mvn test "-Dkarate.options=classpath:reqResApp/feature/03_createUserDemo.feature"
  
* To execute all the test cases with a specific (@Regression) tag from all the features inside the feature folder:

  > mvn test "-Dkarate.options=--tags @Regression classpath:reqResApp/feature/"  

* To execute a specific scenario defined in line #21 from 03_createUserDemo.feature:

  > mvn test "-Dkarate.options=classpath:reqResApp/feature/03_createUserDemo.feature:21"
