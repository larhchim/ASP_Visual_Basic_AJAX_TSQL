<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
%>
<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - Message</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="../css/style.css" type="text/css">
    </head>
    <body>
        <!--#include file="MenuSyndic.asp"-->
        <main role="main" class="container">
            <div class="jumbotron">
                <table align="center" border="0" cellspacing="0" cellpadding="0" style="width:100%;border:2px solid #333333;border-collapse:separate;border-spacing:0;border-radius:14px;background:#FFFFFF;">
                    <tr style="height:200px;">
                        <td align="center" valign="center"  Id="TdMsg" style="padding:10px;color:red;font-size:13px;text-align:center;font-weight:bold;"><%=Session("Msg")%><%Session("Msg")=""%></td>
                    </tr>
                <table>
            </div>
        </main>
    </body>
</html>