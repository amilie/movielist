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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Movie Watchlist</title>
    </head>
    <body>
        <div id="content">
            <h1>My Movie Watchlist</h1>
            <ol>
                <% //populate with list from DB %>
                <li>Example Movie</li>
            </ol>
            <form>
                <p>
                    <input type="text" id="movietitle" name="movietitle" 
                           size="32" value="" />
                    <input type="submit" id="add" name="add" value="Add" />
                </p>
            </form>
        </div>
    </body>
</html>
