<%

	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 

	If(Len(Session("IdAdmin")) = 0) Then
		Session("Msg") = "Votre session est fermée, merci de vous identifier"
		Session("MsgTitle") = "message de connection"
		response.redirect "MessageSyndic.asp"

	End If


	Session("PageTitle")= "Syndic"




%>



<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - Activation du compte</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <script type="text/javascript" src="../JS/com.js"></script>
    </head>
    <body onload="javascript:date();">
        <!--#include file="MenuAdmin.asp"-->
        <main role="main" class="container">
            <div class="jumbotron">
                <center>
                    <b class="Titre_2">Ajouter Compte Syndic</b><br><br>
                </center>
				<form name="CompteForm" id="CompteForm" action="CompteSyndic.asp" method="post">
					<table align="center" border="0" cellspacing="0" cellpadding="0" style="width:420px;font-weight:bold;" id="TabForm">
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
								Type Syndic *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="Ttype" id="Ttype" maxlength="20" style="width:210px" value="" onclick="javascript:ChangeBackColor(this,col2);">
							</td>
						</tr>

						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>

						<tr height="25">
							<td align="right" valign="center">
								Designation *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="Tdesignation" id="Tdesignation" maxlength="10" style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Telephone *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="Ttelephone" id="Ttelephone"  style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
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

								<input type="Email" name="Temail" id="Temail"  style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
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
								<input type="password" name="Tpassword" id="Tpassword"  style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						
						<tr style="height:60px; font-size:1px">
		                    <td align="center" valign="bottom" colspan="3">
		                    	<button name="BTValider" id="BTValider" type="button" class="btn btn-outline-primary" value="Activer mon compte"  alt="Activer mon compte" title="Activer mon compte" onclick="javascript:onclicked();">Ajouter</button>
		                    </td>
		                </tr>
		                <tr style="height:10px; font-size:1px">
		                    <td align="center" valign="center" colspan="3">&nbsp;</td>
		                </tr>
					</table>
				</form>

				
			</div>
		</main>

        
        <script>
        
            function onclicked() {

                var pass = document.getElementById('Tpassword').value;

                if(pass.length<8){
                    alert('Mot de passe non robuste veuillez choisir un autre minimum 8 caractéres');
                    return;
                }else
                document.getElementById('CompteForm').submit();
                
            }
            
        </script>
	
    </body>
</html>