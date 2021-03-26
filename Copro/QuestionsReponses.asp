<%
If(Len(Session("IdCompte")) = 0) Then
	Session("Msg") = "Votre session est fermée, merci de vous identifier"
	Session("MsgTitle") = "message de connection"
	response.redirect "Message.asp"
End If
Session("PageTitle") = "Forum Questions/Réponses"
%>

<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - Forum Questions / Réponses</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="../css/style.css" type="text/css">
    </head>
    <body>
        <!--#include file="MenuCopro.asp"-->
        <table align="center" border="0" cellspacing="0" cellpadding="0" width="904">
        <!--DEBUT DATA-->
            <tr height="250">
                <td valign="top" align="center">
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->                    
                    	<table align="center"  style="width:900px;height:300px;">
				<tr>
					<td valign="center" align="center" width="200">&nbsp;</td>
					<td valign="center" align="center" width="700" style="border:1px dashed #000099">
						<b>Page En Construction</b>
					</td>
				</tr>
			</table>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
                </td>
            </tr>
        <!--FIN DATA-->
        </table>
    </body>
</html>