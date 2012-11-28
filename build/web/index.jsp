<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, db.*" errorPage="stderror.jsp" %>
<!DOCTYPE html>
<!--
Author: Amilie Napier
Date: Nov 1, 2012

Assignment:
We would like you to create an end-point (web service) for a user's movie 
watch list.

The user should be able to do the following to this end-point:

1. Put a movie that a user wants to see on a watch list (store in a 
persistent storage)
2. Remove a movie once the user has watched it
3. List movies that are still on the watch list

Please provide your source code and list anything necessary to build and run 
the source code.
-->
<html>
    <head>
        <%
        //Things that are here for testing purposes only
        session.setAttribute("username", "tester");
        session.setAttribute("loggedIn", "1");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Movie Watchlist</title>
    </head>
    <body>
        <div id="content">
            <h1>My Movie Watchlist</h1>
 
            <% if(session.getAttribute("username").toString().length() > 0 &&
                session.getAttribute("loggedIn").toString() == "1") { 
                    //display username and logout link
                    out.print("<b>"
                            + session.getAttribute("username").toString()
                            + "</b> &middot; "
                            + "<a href='#' id='logout' onclick='session"
                            + ".setAttribute('username', '')'>log out</a>"
                            + "<br />");
                    
                    //create List object for this user
                    db.List myList = new db.List(session
                        .getAttribute("username").toString());
                    
                    //print out the items in this user's watchlist
                    out.print("<ol>");
                    out.print(myList.getString());
                    out.print("</ol>");
            %>

                <form onsubmit="myList.addMovie">
                    <p>
                        <label for="movietitle">Movie Title</label>
                        <input type="text" id="movietitle" name="movietitle" 
                            size="32" value="" />
                        <br />
                        <label for="movietitle">Note (optional)</label>
                        <input type="text" id="note" name="note" 
                            size="32" value="" />
                        <br />
                        <input type="submit" id="add" name="add" value="Add" />
                    </p>
                </form>
            <% } //end if logged in
            else { 
                session.setAttribute("username", "");
                
            %>
            <p>
            Log in to view and edit your watchlist.
            </p>
            
            <form onsubmit="if(User.valid(username, sha1(password)))
                {session.setAttribute('username', username)}">
                <p>
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username"
                           size="20" />
                    <br />
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password"
                           size="20" />
                </p>
            </form>  
            <% } //end else%>
        </div>
    </body>
</html>
