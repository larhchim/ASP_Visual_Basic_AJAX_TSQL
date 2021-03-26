<%
	If(Len(Session("IdSyndic")) = 0) Then
		Session("Msg") = "Votre session est fermée, merci de vous identifier"
		Session("MsgTitle") = "message de gestion des comptes"
		response.redirect "MessageSyndic.asp"
	End If
	Session("PageTitle") = "Banque"


	
    Req2 =  " ps_get_Annee "
    Set Con = Server.CreateObject("ADODB.Connection")	
	Con.Open Application("PC")
	On Error Resume Next
	Set rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req2, Con, 3, 3


%>





<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - Gérer mon compte</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="../css/style.css" type="text/css">
		<script type="text/javascript" src="../JS/com.js"></script>
		<script lang="javascript">	
			function VerifInfos(ope) 
			{
			    var Nom     = document.getElementById('TNom');
			    var Prenom  = document.getElementById('TPrenom');
			    var Email   = document.getElementById('TEmail');
			    var Tel     = document.getElementById('TTel');
			    var msg		= '';

			    Nom.value = AllTrim(Nom.value);
			    Prenom.value = AllTrim(Prenom.value);
			    Email.value = AllTrim(Email.value);
			    Tel.value = AllTrim(Tel.value);

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
			    /*
			    if(Superf.value.length > 0)
			    {
			    	if (!IsPositifInt(Superf.value)) {
			        	msg = msg + '\n - Superficie';
			        	ChangeBackColor(Superf, col1);
			    	}
			    }
			    if(NbrChbr.value.length > 0)
			    {
			    	if (!IsPositifInt(NbrChbr.value)) {
			        	msg = msg + '\n - Nombre de chambres';
			        	ChangeBackColor(NbrChbr, col1);
			    	}
			    }
			    if(NbrSal.value.length > 0)
			    {   
				if (!IsPositifInt(NbrSal.value)) {
			        	msg = msg + '\n - Nombre de salons';
			        	ChangeBackColor(NbrSal, col1);
			    	}
			    }
			    */
			    if (msg.length > 0) {
			        msg = 'Veuillez saisir correctement le(s) champ(s) suivant(s) : \n' + msg;
			        alert(msg);
			        return;
			    }
			    document.getElementById('BTModifierInfos').disabled = true;
			    document.getElementById('BTModifierPass').disabled = true;
			    document.getElementById('TOpe').value = ope ;
			    document.getElementById('CompteForm').submit();
			}
		</script>
    </head>
    <body onload="javascript:verifyinputs();">
        <!--#include file="MenuSyndic.asp"-->
		<main role="main" class="container">
        <!--<div class="jumbotron">-->
				<form name="CompteForm" id="CompteForm" action="BanqueAction.asp" method="post">
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
                            	<b class="Titre_2"><u>Informations liées a la banque</u></b><br><br>
                            </td>
                        </tr>
                        <tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        <tr height="25">
							<td align="right" valign="center">
								Annee *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input  type="number" onKeyDown="return false" name="TAnnee" id="TAnnee" maxlength="50" style="width:210px;"  onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						 <tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        <tr height="25">
							<td align="right" valign="center">
								Mois *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input onKeyDown="return false" type="number"  name="TMois" id="TMois" maxlength="20" style="width:210px;" value="<%=Tel%>" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr style="height:20px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        <tr height="25">
							<td align="right" valign="center">
								Total Entrees *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TEntrees" id="TTel" maxlength="20" style="width:210px;" value="<%=Tel%>" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr style="height:20px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        <tr height="25">
							<td align="right" valign="center">
								Total Sorties *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TSorties" id="TTel" maxlength="20" style="width:210px;" value="<%=Tel%>" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr style="height:20px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
						<!---
                        <tr height="25">
							<td align="right" valign="center">
								Solde *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TSorties" id="TTel" maxlength="20" style="width:210px;" value="<%=Tel%>" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr style="height:20px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        <tr height="25">
							<td align="right" valign="center">
								Dispo *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="checkbox" name="TSorties" id="TTel" maxlength="20"  value="<%=Tel%>" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr style="height:20px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
						---------->
						<tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">
                            	<!--<input type="button" name="BTValider"  id="BTValider" value="Envoyer" alt="Envoyer" title="Envoyer" style="width:150px;height:30px;cursor:hand;" onclick="javascript:VerifContact()">-->
							<button name="BTValider" id="BTValider" type="button" class="btn btn-outline-primary" value="Ajouter"  alt="Ajouter" title="Ajouter" onclick="javascript:func();" >Ajouter</button>                            </td>
                            </td>
                        </tr>
						<tr style="height:30px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        
					</table>
					
            <!--</div>-->
        </main>

						<script>

						function func(){

							document.getElementById('CompteForm').submit();

						}

						function verifyinputs(){

							<% 
								If(Rs.RecordCount =0 ) Then 
								var=Year(Now())
								Else 
								var=Rs("Annee")
								End IF

								Rs.Close()
								Set Rs = Nothing
								Con.Close()
								Set Con = Nothing
							%>

							document.getElementById('TAnnee').min='<%=var%>'
							document.getElementById('TAnnee').max='<%=Year(Now())%>'
							document.getElementById('TMois').min='01'
							document.getElementById('TMois').max='12'

						}

						</script>

    </body>
</html>