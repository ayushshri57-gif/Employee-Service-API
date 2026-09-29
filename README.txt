EM-PROJECT - Correct Spring Boot Employee API

Dependencies included:
1. Spring Web
2. MySQL Driver
3. Spring Data JPA
4. H2 Database
5. Lombok

Java: 17
Server port: 9090

IMPORTANT:
- The project uses H2 in-memory database by default, so MySQL does NOT need to be running.
- GET endpoint:
  http://localhost:9090/employees

Expected response:
[]

How to run on Windows:
1. Open this project folder in VS Code.
2. If Maven is installed:
      mvn spring-boot:run
3. Or use the included Maven wrapper:
      .\mvnw.cmd spring-boot:run

If Windows blocks the wrapper, open PowerShell as normal user and run:
      Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
Then:
      .\mvnw.cmd spring-boot:run

Do not change package names. All Java files are in:
src/main/java/com/example/emproject
