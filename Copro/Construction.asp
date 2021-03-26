<%
If(Len(Session("IdCompte")) = 0) Then
	Session("Msg") = "Votre session est fermée, merci de vous identifier"
	Session("MsgTitle") = "message de connection"
	response.redirect "Message.asp"
Else
    Session("PageTitle") = " En Construction"
End If
%>

<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - En Construction</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <script type="text/javascript" src="../JS/com.js"></script>
    </head>
    <body>
	    <!--#include file="MenuCopro.asp"-->
        <main role="main" class="container">
            <div class="jumbotron">
                <center>
                    <b class="Titre_2">Site En Construction</b><br><br>
                </center>
            </div>
        </main>
    </body>
</html>