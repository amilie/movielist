<!-- Author: Amilie Napier -->

<%@ page isErrorPage="true" import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <link rel="stylesheet" type="text/css" href="burnination.css" />
    </head>
    <body>
        <div id="content">
        <h1>Everything is broken!</h1>
        <p>Please try again later.</p>
        <pre>
        <%
            if (exception != null) {
                exception.printStackTrace(new PrintWriter(out));
            }
        %>
        </pre>
        </div>
    </body>
</html>

