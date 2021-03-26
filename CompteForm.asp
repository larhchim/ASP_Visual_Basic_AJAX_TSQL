<%Session("PageTitle") = "Espace Copropriétaires"%>
<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - Activation du compte</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="JS/com.js"></script>
		<script lang="javascript">	
			function VerifCompte() 
			{

			    var Log     = document.getElementById('TLog');
			    var Pass    = document.getElementById('TPass');
			    var Nom     = document.getElementById('TNom');
			    var Prenom  = document.getElementById('TPrenom');
			    var Email   = document.getElementById('TEmail');
			    var Tel     = document.getElementById('TTel');

			    var Captcha = document.getElementById('TCaptcha');
			    var msg = '';

			    Log.value = AllTrim(Log.value);
			    Nom.value = AllTrim(Nom.value);
			    Prenom.value = AllTrim(Prenom.value);
			    Email.value = AllTrim(Email.value);
			    Tel.value = AllTrim(Tel.value);

			    if (Log.value.length < 4) 
			    {
			        msg = msg + '\n - Login';
			        ChangeBackColor(Log, col1);
			    }
			    if (Pass.value.length < 7) 
			    {
			        msg = msg + '\n - Mot de passe';
			        ChangeBackColor(Pass, col1);
			    }
			    if (Nom.value.length < 2) 
			    {
			        msg = msg + '\n - Nom';
			        ChangeBackColor(Nom, col1);
			    }
			    if (Prenom.value.length < 2) 
			    {
			        msg = msg + '\n - Prénom';
			        ChangeBackColor(Prenom, col1);
			    }
			    if (!IsEmail(Email.value)) 
			    {
			        msg = msg + '\n - Email';
			        ChangeBackColor(Email, col1);
			    }
			    if (!IsTel(Tel.value)) 
			    {
			        msg = msg + '\n - Téléphone';
			        ChangeBackColor(Tel, col1);
			    }
			    if (Captcha.value.length < 5) 
			    {
			        msg = msg + '\n - Code de securité';
			        ChangeBackColor(Captcha, col1);
			    }
			    if (msg.length > 0) 
			    {
			        msg = 'Veuillez saisir correctement le(s) champ(s) suivant(s) : \n' + msg;
			        alert(msg);
			        return;
			    }
			    document.getElementById('BTValider').disabled = true;
			    document.getElementById('CompteForm').submit(); 
			}
		</script>
    </head>
    <body onload="javascript:GetCaptcha('');">
        <!--#include file="Menu.asp"-->
        <main role="main" class="container">
            <div class="jumbotron">
                <center>
                    <b class="Titre_2">Activation de votre compte</b><br><br>
                </center>
				<form name="CompteForm" id="CompteForm" action="CompteAction.asp" method="post">
					<table align="center" border="0" cellspacing="0" cellpadding="0" style="width:360px;font-weight:bold;" id="TabForm">
						<tr style="height:10px; font-size:1px">
							<td align="center" valign="center" style="width:130px;"></td>
							<td align="center" valign="center" style="width:10px;"></td>
							<td align="center" valign="center" style="width:220px;"></td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
						<tr height="25">
							<td align="right" valign="center">
								Login *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TLog" id="TLog" maxlength="10" style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Mot de passe *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="password" name="TPass" id="TPass" maxlength="10" style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
		                        Nom *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TNom" id="TNom" maxlength="50" style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Prénom *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TPrenom" id="TPrenom" maxlength="50" style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Email *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TEmail" id="TEmail" maxlength="50" style="width:210px" value="" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Gsm *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TTel" id="TTel" maxlength="20" style="width:210px" value="" onclick=javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
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
		                    	<button name="BTValider" id="BTValider" type="button" class="btn btn-outline-primary" value="Activer mon compte"  alt="Activer mon compte" title="Activer mon compte" onclick="javascript:VerifCompte();">Activer mon compte</button>
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