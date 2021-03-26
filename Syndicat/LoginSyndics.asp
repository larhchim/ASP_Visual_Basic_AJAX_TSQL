<%Session("PageTitle") = "SuperAdmin Connexion"%>
<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - Page d'administration</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <link href="../CSS/bootstrap.min.css"   rel="stylesheet"  type="text/css">
        <link href="../CSS/navbar.css"          rel="stylesheet"  type="text/css">
        <script type="text/javascript" src="../JS/com.js"></script>
    </head>
    <body>
        <main role="main" class="container">
            <div class="jumbotron">
                <center>
                    <b class="Titre_2">Page Syndic</b><br><br>
                </center>

				<form name="LoginForm" id="LoginForm" action="LoginAction.asp" method="post">
					<table align="center" border="0" cellspacing="0" cellpadding="0" style="width:360px;font-weight:bold;" id="TabForm">
						<tr style="height:10px; font-size:1px">
							<td align="center" valign="center" style="width:130px;"></td>
							<td align="center" valign="center" style="width:10px;"></td>
							<td align="center" valign="center" style="width:220px;"></td>
						</tr>
                        <tr height="25">
							<td align="right" valign="center">Login *</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center"><input type="text" name="TLogin" id="TLogin" maxlength="30" style="width:210px;" onclick="javascript:ChangeBackColor(this, col2);" onkeyup="javascript:Connexion(1);"></td>
						</tr>
						 <tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        <tr height="25">
							<td align="right" valign="center">Mot de passe *</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center"><input type="password" name="TPasswd" id="TPasswd" maxlength="30" style="width:210px;" onclick="javascript:ChangeBackColor(this, col2);" onkeyup="javascript:Connexion(2);"></td>
						</tr>
						 <tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        
						<tr style="height:60px; font-size:1px">
                            <td align="center" valign="bottom" colspan="3"><button name="BTValider" id="BTValider" type="button" class="btn btn-outline-primary" value="Se Connecter"  alt="Se Connecter" title="Se Connecter" onclick="javascript:Verif();">Se Connecter</button></td>
                        </tr>
                        <tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
					</table>
				</form>
            </div>
        </main>
    </body>
</html>