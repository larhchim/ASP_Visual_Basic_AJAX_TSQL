<%Session("PageTitle") = "Nous Contacter"%>
<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - Nous Contacter</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="JS/com.js"></script>
    </head>
    <body onload="javascript:GetCaptcha('');">
	<!--#include file="Menu.asp"-->
        <main role="main" class="container">
            <div class="jumbotron">
                <center>
                    <b class="Titre_2">Formulaire de Demande d'Informations</b><br><br>
                </center>
                <p style="text-align:justify;">
                    Merci de saisir l'ensemble des informations obligatoires signalées par le symbole (*).<br />
                    Un email de confirmation vous sera envoyé automatiquement sur votre boîte mail.<br />
                    Si vous ne recevez pas l'email de confirmation au bout de quelques minutes, veuillez consulter la rubrique spam de votre boîte de reception.<br>
                    Si l'email de confirmation ne figure pas dans la rubrique spam, merci de refaire votre demande en vérifiant l'orthographe de votre adresse mail.
		        </p>
            </div>
        </main>
		<form name="ContactForm" id="ContactForm" action="NousContacterAction.asp" method="post">
			<table align="center" border="0" cellspacing="0" cellpadding="0" style="width:360px;font-weight:bold;" id="TabForm">
				<tr style="height:10px; font-size:1px">
					<td align="center" valign="center" style="width:110px;"></td>
					<td align="center" valign="center" style="width:10px;"></td>
					<td align="center" valign="center" style="width:220px;"></td>
				</tr>
                <tr height="25">
					<td align="right" valign="center">
                        Nom *
					</td>
					<td align="center" valign="center">:</td>
					<td align="left" valign="center">
						<input type="text" name="TNom" id="TNom" maxlength="50" style="width:210px;" onclick="javascript:ChangeBackColor(this, col2);">
					</td>
				</tr>
					<tr style="height:10px; font-size:1px">
                    <td align="center" valign="center" colspan="3">&nbsp;</td>
                </tr>
                <tr height="25">
					<td align="right" valign="center">
						Prénom *
					</td>
					<td align="center" valign="center">:</td>
					<td align="left" valign="center">
						<input type="text" name="TPrenom" id="TPrenom" maxlength="50" style="width:210px;" onclick="javascript:ChangeBackColor(this, col2);">
					</td>
				</tr>
					<tr style="height:10px; font-size:1px">
                    <td align="center" valign="center" colspan="3">&nbsp;</td>
                </tr>
                <tr height="25">
					<td align="right" valign="center">
						Email *
					</td>
					<td align="center" valign="center">:</td>
					<td align="left" valign="center">
						<input type="text" name="TEmail" id="TEmail" maxlength="50" style="width:210px;" onclick="javascript:ChangeBackColor(this, col2);">
					</td>
				</tr>
					<tr style="height:10px; font-size:1px">
                    <td align="center" valign="center" colspan="3">&nbsp;</td>
                </tr>
                <tr height="25">
					<td align="right" valign="center">
						Gsm *
					</td>
					<td align="center" valign="center">:</td>
					<td align="left" valign="center">
						<input type="text" name="TTel" id="TTel" maxlength="20" style="width:210px;" onclick="javascript:ChangeBackColor(this, col2);">
					</td>
				</tr>
					<tr style="height:10px; font-size:1px">
                    <td align="center" valign="center" colspan="3">&nbsp;</td>
                </tr>
                <tr height="25">
					<td align="right" valign="top" style="padding-top:6px;">
						Message *
					</td>
					<td align="center" valign="top" style="padding-top:6px;">:</td>
					<td align="left" valign="top" style="padding-top:4px;">
						<textarea name="TMessage" id="TMessage" maxlength="250" style="width:210px; height:150px" onclick="javascript:ChangeBackColor(this, col2);"></textarea>
						<input type="hidden" name="TMsg" id="TMsg" value="" />
                    </td>
				</tr>
                <tr style="height:10px; font-size:1px">
                    <td align="center" valign="center" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td align="right" valign="center"><img src="Images/Refresh.gif" style="cursor:hand;" title="Générer un nouveau code de sécurité" alt="Générer un nouveau code de sécurité" onclick="javascript:GetCaptcha('');"/></td>
                    <td align="center" valign="center"></td>
                    <td align="center" valign="center" id="TdCaptcha" style="background:url('Images/captcha.png'); background-repeat: no-repeat;background-size:210px 100%;background-position:left;"></td>
                </tr>
                <tr style="height:10px; font-size:1px">
                    <td align="center" valign="center" colspan="3">&nbsp;</td>
                </tr>
                <tr height="25">
                    <td align="right" valign="center">Code sécurité *</td>
                    <td align="center" valign="center">:</td>
                    <td align="left" valign="center">
                        <input type="text" name="TCaptcha" id="TCaptcha" value="" style="width:210px;height:30px;" title="Saisir le code de sécurité" alt="Saisir le code de sécurité" onclick="javascript:ChangeBackColor(this, col2);this.value='';" />
                    </td>
                </tr>
                <tr style="height:10px; font-size:1px">
                    <td align="center" valign="center" colspan="3">&nbsp;</td>
                </tr>
                <tr style="height:60px; font-size:1px">
                    <td align="center" valign="bottom" colspan="3">
                        <button name="BTValider" id="BTValider" type="button" class="btn btn-outline-primary" title="Envoyer"  alt="Envoyer" value ="Envoyer" onclick="javascript:VerifContact();">Envoyer</button>
                    </td>
                </tr>
                <tr style="height:10px; font-size:1px">
                    <td align="center" valign="center" colspan="3">&nbsp;</td>
                </tr>
			</table>
		</form>
    </body>
</html>