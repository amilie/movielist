Note: I developed this using Windows 7, Apache 2.2, MySQL 5.5.28, JSP 2.1,
 and Java 1.7.0_09. I built and deployed this app using the NetBeans IDE,
 version 7.1.2. I tried to write instructions that would work on all platforms,
 but I didn't test this on other machines, so some of this might be a bit off.

INSTRUCTIONS FOR DEPLOYING

Make sure Apache is installed and running.
Make sure MySQL is installed and has been added to the PATH. 
Make sure Java is installed and has been added to the PATH.

To create the database from the included SQL dump:
$ mysql -u root -proot -h 127.0.0.1 movielist < MovieList/src/db/movielist.sql
NOTE: If root password is not "root", you'll need to change DB_PASS on line 18
of MovieList/src/java/db/Database.java

Open http://localhost:8084/MovieList/ in a internet browser. You may have a
different port number, depending on your Apache settings.
