<%
If(Len(Session("IdCompte")) = 0) Then
	Session("Msg") = "Votre session est fermée, merci de vous identifier"
	Session("MsgTitle") = "message de connection"
	response.redirect "Message.asp"
End If
Session("PageTitle") = "Gestion Profil"
%>

<!--#INCLUDE FILE="ParamAdmin.asp"-->
<%


    Dim Req, Rs, Con, msg
    Dim Nom, Prenom, Email, Tel, Superf, NbrChbr, NbrSal, TypeCuis, TypeVue, Chemine, Captcha 
	
    Req = "ps_compte_get_byid " & Session("IdCompte")
	Set Con = Server.CreateObject("ADODB.Connection")
	Con.Open Application("PC")

	On Error Resume Next

	Set rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3

	if(Rs.RecordCount = 1) Then
        Nom = Rs("Nom")
        Prenom = Rs("Prenom")
        Email = Rs("Email")
        Tel = Rs("Tel")
        Superf = Rs("Superficie")
        NbrChbr = Rs("NbrChambres")
        NbrSal = Rs("NbrSalons")
        TypeCuis = Rs("TypeCuisine")
        TypeVue = Rs("TypeVue")
        Chemine = Rs("Chemine")
	    Rs.Close()
	    Set Rs = Nothing
	    Con.Close()
	    Set Con = Nothing
    Elseif(Rs.RecordCount = 0) Then
		Session("Msg") = "Copropriétaire non trouvé, verifiez votre login et/ou votre mot de passe"
	    Rs.Close()
	    Set Rs = Nothing
	    Con.Close()
	    Set Con = Nothing
	    Response.Redirect "Logout.asp"
    Else
		Session("Msg") = "Plusieurs copropriétaires ont le meme login !!!, prière de contactez l'administrateur"			
	    Rs.Close()
	    Set Rs = Nothing
	    Con.Close()
	    Set Con = Nothing
	    Response.Redirect "Logout.asp"
    End If
%>

<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - Gérer mon compte</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="../css/style.css" type="text/css">
		<script type="text/javascript" src="../JS/com.js"></script>
	</head>
	<body>
        <!--#include file="MenuCopro.asp"-->
		<main role="main" class="container">
			<form name="CompteForm" id="CompteForm" action="GestionProfilAction.asp" method="post">
				<table align="center" border="0" cellspacing="0" cellpadding="0" style="width:360px;font-weight:bold;" id="TabForm">
					<tr style="height:10px; font-size:1px">
						<td align="center" valign="center" style="width:130px;"></td>
						<td align="center" valign="center" style="width:10px;"></td>
						<td align="center" valign="center" style="width:220px;"></td>
					</tr>
					<tr style="height:10px; font-size:1px">
                        <td align="center" valign="center" colspan="3">&nbsp;</td>
                    </tr>
					<tr style="height:20px; font-size:1px">
                        <td align="center" valign="center" colspan="3"><b class="Titre_2"><u>Changement des moyens de contact</u></b><br><br></td>
                    </tr>
                    <tr style="height:20px; font-size:1px">
                        <td align="center" valign="center" colspan="3">&nbsp;</td>
                    </tr>
                    <tr height="25">
						<td align="right" valign="center">Nom</td>
						<td align="center" valign="center">:</td>
						<td align="left" valign="center"><%=Nom%></td>
					</tr>
					<tr style="height:10px; font-size:1px">
                        <td align="center" valign="center" colspan="3">&nbsp;</td>
                    </tr>
                    <tr height="25">
						<td align="right" valign="center">Prénom</td>
						<td align="center" valign="center">:</td>
						<td align="left" valign="center"><%=Prenom%></td>
					</tr>
						<tr style="height:10px; font-size:1px">
                        <td align="center" valign="center" colspan="3">&nbsp;</td>
                    </tr>
                    <tr height="25">
						<td align="right" valign="center">Email *</td>
						<td align="center" valign="center">:</td>
						<td align="left" valign="center"><input type="text" name="TEmail" id="TEmail" maxlength="50" style="width:210px;" value="<%=Email%>" onclick="javascript:ChangeBackColor(this, col2);"></td>
					</tr>
						<tr style="height:10px; font-size:1px">
                        <td align="center" valign="center" colspan="3">&nbsp;</td>
                    </tr>
                    <tr height="25">
						<td align="right" valign="center">Gsm *</td>
						<td align="center" valign="center">:</td>
						<td align="left" valign="center"><input type="text" name="TTel" id="TTel" maxlength="20" style="width:210px;" value="<%=Tel%>" onclick="javascript:ChangeBackColor(this, col2);"></td>
					</tr>
					<tr style="height:20px; font-size:1px">
                        <td align="center" valign="center" colspan="3">&nbsp;</td>
                    </tr>
					<tr style="height:10px; font-size:1px">
                        <td align="center" valign="center" colspan="3">
                            <!--<input type="button" name="BTValider"  id="BTValider" value="Envoyer" alt="Envoyer" title="Envoyer" style="width:150px;height:30px;cursor:hand;" onclick="javascript:VerifContact()">-->
                            <a class="btn btn-primary"  name="BTModifierInfos"  id="BTModifierInfos" role="button" title="Modifier mes moyens de contact"  onclick="javascript:VerifInfos('info');">Modifier mes moyens de contact</a>
							<!--<button name="BTModifierPass" id="BTModifierPass" type="button" class="btn btn-outline-primary" title="Modifier mes moyens de contacte" value ="Modifier mes moyens de contact" onclick="javascript:VerifInfos('info');">Modifier</button>-->
                        </td>
                    </tr>
					<tr style="height:30px; font-size:1px">
                        <td align="center" valign="center" colspan="3">&nbsp;</td>
                    </tr>
				</table>
				<br>
				<table align="center" border="0" cellspacing="0" cellpadding="0" style="width:360px;font-weight:bold;" id="TabForm">
					<tr style="height:10px; font-size:1px">
						<td align="center" valign="center" style="width:130px;"></td>
						<td align="center" valign="center" style="width:10px;"></td>
						<td align="center" valign="center" style="width:220px;"></td>
					</tr>
					<tr style="height:10px; font-size:1px">
						<td align="center" valign="center" colspan="3">&nbsp;</td>
					</tr>
					<tr style="height:20px; font-size:1px">
						<td align="center" valign="center" colspan="3">
							<b class="Titre_2"><u>Changement du mot de passe (M.P)</u></b><br><br>
						</td>
					</tr>
					<tr style="height:20px; font-size:1px">
						<td align="center" valign="center" colspan="3">&nbsp;</td>
					</tr>
					<tr height="25">
						<td align="right" valign="center">
							Ancien M.P *
						</td>
						<td align="center" valign="center">:</td>
						<td align="left" valign="center">
							<input type="password" name="TOldPass" id="TOldPass" maxlength="30" style="width:210px;" onclick="javascript:ChangeBackColor(this, col2);">
						</td>
					</tr>
					<tr style="height:10px; font-size:1px">
						<td align="center" valign="center" colspan="3">&nbsp;</td>
					</tr>
					<tr height="25">
						<td align="right" valign="center">
							Nouv. M.P *
						</td>
						<td align="center" valign="center">:</td>
						<td align="left" valign="center">
							<input type="password" name="TNewPass" id="TNewPass" maxlength="30" style="width:210px;" onclick="javascript:ChangeBackColor(this, col2);">
						</td>
					</tr>
					<tr style="height:10px; font-size:1px">
						<td align="center" valign="center" colspan="3">&nbsp;</td>
					</tr>
					<tr height="25">
						<td align="right" valign="center">
							Confirm. M.P *
						</td>
						<td align="center" valign="center">:</td>
						<td align="left" valign="center">
							<input type="password" name="TConfPass" id="TConfPass" maxlength="30" style="width:210px;" onclick="javascript:ChangeBackColor(this, col2);">
						</td>
					</tr>
					<tr style="height:20px; font-size:1px">
						<td align="center" valign="center" colspan="3">&nbsp;</td>
					</tr>
					<tr style="height:10px; font-size:1px">
						<td align="center" valign="center" colspan="3">
							<a class="btn btn-primary"  name="BTModifierPass"  id="BTModifierPass" role="button" title="Modifier mon mot de passe"  onclick="javascript:VerifPass('pass');">Modifier mon mot de passe</a>
							<!--<button name="BTModifierPass" id="BTModifierPass" type="button" class="btn btn-outline-primary" title="Modifier mon mot de passe" value ="Modifier mon mot de passe" onclick="javascript:VerifPass('pass');">Modifier mon mot de passe</button>-->
						</td>
					</tr>
					<tr style="height:30px; font-size:1px">
						<td align="center" valign="center" colspan="3">&nbsp;</td>
					</tr>
				</table>
				<input type="hidden" name="TOpe" id="TOpe" value="">
			</form>
        </main>
    </body>
</html>