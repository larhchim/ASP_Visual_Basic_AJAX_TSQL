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

	Session("PageTitle")= "Depense"

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
                    <b class="Titre_2">Ajouter Depences</b><br><br>
                </center>
				<form name="CompteForm" id="CompteForm" action="DepenseAction.asp" method="post">
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
								Année *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input min="<%=miny%>" max="<%=maxy%>"  onKeyDown="return false" type="number" name="TAnnee" id="TLog" maxlength="10" style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Montant *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input onkeypress="javascript:FloatOnly();" type="text" name="TMontant" id="TPass" style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
		                        Date Depense *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="date"  name="TDateDepense" id="TDATE" maxlength="50" style="width:210px" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Motif *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<textarea  name="TMotif" id="TPrenom"  style="width:210px" onclick="javascript:ChangeBackColor(this, col2);" >
								</textarea>
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Beneficiaire *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TBeneficiaire" id="TEmail" maxlength="50" style="width:210px" value="" onclick="javascript:ChangeBackColor(this, col2);">
							</td>
						</tr>
						<tr height="10">
							<td align="center" valign="center" colspan="3">
								<font face="verdana" color="gray" style="font-size:1pt"></font>
							</td>
						</tr>
		                <tr height="25">
							<td align="right" valign="center">
								Moyen de Reglement *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
									<select name="TNatureReglement" id="TTel" style="width:210px;" >
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
								Reference Reglement *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
								<input type="text" name="TReferenceReglement" id="TTel" maxlength="20" style="width:210px" value="" onclick=javascript:ChangeBackColor(this,col2);">
							</td>
						</tr>
		                <tr style="height:10px; font-size:1px">
		                    <td align="center" valign="center" colspan="3">&nbsp;</td>
		                </tr>
                        <tr height="25">
							<td align="right" valign="center">
								Justif *
							</td>
							<td align="center" valign="center">:</td>
							<td align="left" valign="center">
							<select name="TJustif" id="TTel">
								<option value="1">True</option>
								<option value="0">False</option>
							</select>
							</td>
						</tr>
		                <tr style="height:10px; font-size:1px">
		                    <td align="center" valign="center" colspan="3">&nbsp;</td>
		                </tr>
						<tr style="height:60px; font-size:1px">
		                    <td align="center" valign="bottom" colspan="3">
		                    	<button name="BTValider" id="BTValider" type="button" class="btn btn-outline-primary" value="Activer mon compte"  alt="Activer mon compte" title="Activer mon compte" onclick="javascript:envoyer();">Ajouter</button>
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


			var x = document.getElementById("TDATE").min = "<%=miny%>-01-01";
			var y = document.getElementById("TDATE").max = "<%=maxy%>-12-31";

		}

		function envoyer() {

			document.getElementById('CompteForm').submit()
			
		}
		
		function FloatOnly(str){

			var c = event.keyCode ;
			if(((c < 48) || (c > 57)) && ((c != 45) || (str.length != 0)) &&
			((c != 46) || (str.indexOf('.') != -1)))
			event.returnValue = false ;
			
		}

		
	
		</script>
    </body>
</html>