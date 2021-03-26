<%Session("PageTitle") = "Espace Copropriétaires"%>
<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - mot de passe oublié</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="JS/com.js"></script>
    </head>
    <body>
        <!--#include file="Menu.asp"-->
        <main role="main" class="container">
            <div class="jumbotron">
                <center>
                    <b class="Titre_2">Récupération du mot de passe par mail</b><br><br>
                </center>

                <div style="text-align:justify;">
   					Si vous avez déjà activé votre compte avec une adresse email valide, et que vous avez oublié votre mot de passe, 
					veuillez saisir votre login dans le champ approprié, un email contenant vos paramètres personnels vous sera 
					envoyé immédiatement après la validation de votre demande.<br><br>
                    Si au bout de quelques minutes vous n'avez rien reçu, regardez dans la rubrique spam, 
                    ou alors verifiez l'orthographe de votre login.<br /><br />
					Le mot de passe est une information personnelle et confidentielle, 
					vous êtes prié de le retenir et de ne pas l'inscrire sur des documents 
					ou le mémoriser sur des appareils.<br><br>
				</div>
				<form name="PassForm" id="PassForm" action="PassAction.asp" method="post">
					<table align="center" border="0" cellspacing="0" cellpadding="0" style="width:350px;" id="TabForm">
						<tr style="height:10px; font-size:1px">
							<td align="center" valign="center" style="width:110px;"></td>
							<td align="center" valign="center" style="width:10px;"></td>
							<td align="center" valign="center" style="width:230px;"></td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
						<tr height="25">
							<td align="right" valign="center">
								<b>Votre login *</b>
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TLog_in" id="TLog_in" maxlength="10" style="width:220px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
						<tr style="height:60px; font-size:1px">
                            <td align="center" valign="bottom" colspan="3">
                            	<button name="BTValider" id="BTValider" type="button" class="btn btn-outline-primary" title="Envoyer"  alt="Envoyer" value ="Envoyer" onclick="javascript:VerifLogin();">Envoyer</button>
                            </td>
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