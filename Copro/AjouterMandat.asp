<%
If(Len(Session("IdCompte")) = 0) Then
	Session("Msg") = "Votre session est fermée, merci de vous identifier"
	Session("MsgTitle") = "message de gestion des comptes"
	response.redirect "Message.asp"
End If
	Session("PageTitle") = "Syndic"
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
			    document.getElementById('BTModifierInfos').disabled = true;
			    document.getElementById('BTModifierPass').disabled = true;
			    document.getElementById('TOpe').value = ope ;
			    document.getElementById('CompteForm').submit();
			}
		</script>
    </head>
    <body>
    	<!--#include file="MenuCopro.asp"-->
		<main role="main" class="container">
        <!--<div class="jumbotron">-->
				<form id="CompteForm" action="MondaAction.asp" method="post">
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
                            	<b class="Titre_2"><u>Informations liées au mandat</u></b><br><br>
                            </td>
                        </tr>
                        <tr style="height:20px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        <tr height="25">
							<td align="right" valign="center">
                                Date Debut
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="date" name="DateD" id="DateD" maxlength="50"  style="width:210px;" value="<%=DateD%>" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        <tr height="25">
							<td align="right" valign="center">
								Date Fin
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="date" name="DateF" id="DateF" maxlength="50"  style="width:210px;" value="<%=DateF%>" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						 <tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        <!-- <tr height="25">
							<td align="right" valign="center">
								Remarques
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="Remarques" id="Remarques" maxlength="50" style="width:210px;" value="<%=Remarques%>" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						 <tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        <tr height="25">
							<td align="right" valign="center">
								Quitus
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">

							<input type="checkbox"  name="Quitus" id="Quitus"     onclick="javascript:ChangeBackColor(this, col2);">
	
							</td>
						</tr>
						 <tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        <tr height="25">
							<td align="right" valign="center">
								Active
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
							
								<input type="checkbox" name="TActive" id="TActive"   onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr> -->
						 <tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
						<tr style="height:10px; font-size:1px">
                            <td align="center" valign="center" colspan="3">
                            	<!--<input type="button" name="BTValider"  id="BTValider" value="Envoyer" alt="Envoyer" title="Envoyer" style="width:150px;height:30px;cursor:hand;" onclick="javascript:VerifContact()">-->
							<button name="BTValider" id="BTValider" type="submit" class="btn btn-outline-primary" value="Ajouter"  alt="Ajouter" title="Ajouter" >Ajouter</button>                            </td>
                        </tr>
						<tr style="height:30px; font-size:1px">
                            <td align="center" valign="center" colspan="3">&nbsp;</td>
                        </tr>
                        
					</table>
					
            <!--</div>-->
        </main>
    </body>
</html>