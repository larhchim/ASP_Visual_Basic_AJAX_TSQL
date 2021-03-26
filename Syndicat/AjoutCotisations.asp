<%

	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 

	If(Len(Session("IdSyndic")) = 0) Then
		Session("Msg") = "Votre session est fermée, merci de vous identifier"
		Session("MsgTitle") = "message de connection"
		response.redirect "MessageSyndic.asp"

	End If

	Req = "SELECT MIN(Annee) AS min,MAX(Annee) AS max from TBUDGET_ANNUEL"
 	Set Con = Server.CreateObject("ADODB.Connection")	
	Con.Open Application("PC")
	On Error Resume Next
	Set rs = Server.CreateObject("ADODB.RecordSet")

	Rs.Open Req, Con, 3, 3

	miny=Rs("min")
	maxy=Rs("max")

	Session("PageTitle")= "Cotisation"




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
        <!--#include file="MenuSyndic.asp"-->
        <main role="main" class="container">
            <div class="jumbotron">
                <center>
                    <b class="Titre_2">Ajouter Cotisations</b><br><br>
                </center>
				<form name="CompteForm" id="CompteForm" action="CotisationsAction.asp" method="post">
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
								Appartement *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TAppart" id="TTel" maxlength="20" style="width:210px" value="" onclick="javascript:ChangeBackColor(this,col2);">
							</td>
						</tr>

						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>

						<tr height="25">
							<td align="right" valign="center">
								Année *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TAnnee" id="TLog" maxlength="10" style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Montant Regler *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TMontant" id="TPass"  style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
		                        Moyen Reglement *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">

									<select name="TMoyen" id="TNom" style="width:210px;" >
										<option value="cash">cash</option>
										<option value="cheque">chéque</option>
										<option value="virement">virement</option>
									</select>
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Date Reglement *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="date" name="TDateReg" id="TDateReg" maxlength="50" style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Reference Reglement *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TRefreg" id="TEmail" maxlength="50" style="width:210px" value="" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Reference Recu *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TRefrecu" id="TTel" maxlength="20" style="width:210px" value="" onclick="javascript:ChangeBackColor(this,col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
					
		                <tr style="height:10px; font-size:1px">
		                    <td align="center" valign="center" colspan="3">&nbsp;</td>
		                </tr>
		                <tr style="height:10px; font-size:1px">
		                    <td align="center" valign="center" colspan="3">&nbsp;</td>
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
			function date() {


			var x = document.getElementById("TDateReg").min = "<%=miny%>-01-01";
			var y = document.getElementById("TDateReg").max = "<%=maxy%>-12-31";

			}
			function onclicked() {

				document.getElementById('CompteForm').submit('');
			
			}
		</script>
    </body>
</html>