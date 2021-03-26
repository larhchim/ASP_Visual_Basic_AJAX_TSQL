<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 

	If(Len(Session("IdAdmin")) = 0) Then
		Session("Msg") = "Votre session est fermée, merci de vous identifier"
		Session("MsgTitle") = "message de gestion des appartements"
		response.redirect "Message.asp"
	End If
	Session("PageTitle")= "Syndic"
%>

<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - Géstion des appartements</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="../css/style.css" type="text/css">

		<script type="text/javascript" src="../JS/com.js"></script>
        <script type="text/javascript" src="JS/GestionDepense.js"></script>
		<script lang="Javascript">
		
			function AjaxSendData(fichier) 
			{
				var xmlhttp ;

				if (window.XMLHttpRequest) {
					xmlhttp = new XMLHttpRequest();
				}
				else {
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.onreadystatechange = function () {
					if ((xmlhttp.readyState == 4) && (xmlhttp.status == 200)) {
						document.getElementById('TabDataBody').innerHTML = xmlhttp.responseText;
					}
				}

				xmlhttp.open('GET', fichier, true);
				xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xmlhttp.send();
			}


			function Save(){

				var IdDepense = document.getElementById('IdDepense').value ;
			
				var IdRB = document.getElementById('IdRB').value ;

				var fichier = 'GestionDepenseAjaxSet.asp?IdDepense='+IdDepense+'&IdRB='+IdRB;
				
				AjaxSendData(fichier);

            }

	
        </script>
    </head>
    <body onload="javascript:InitDragDrop('#DivDragDrop', '#DivData');javascript:verif();">
    	<!--#include file="MenuAdmin.asp"-->
		<main role="main" class="container">
			<table align="center" border="0" id="TabForm">
				<thead>
					<tr height="35">
						<td align="center" valign="center" onclick="javascript:verif();">
							<select name="LCriteres" id="LCriteres" style="width:120px;">
								<option value="all">ALL</option>
								<option value="year">Année</option>
								<option value="sum">Montant</option>
							</select>
							&nbsp;&nbsp;
							<input  type="number" min="0" name="TVal" id="TVal" value="" style="width:120px;" onkeypress="javascript:Valider();">
							&nbsp;&nbsp;
							<button type = "button" name = "BTRechercher" value = "Rechercher" title ="Rechercher" onclick="javascript:Rechercher();"><img src="images/search.png" style="width:30px;height:30px;" /></button>
						</td>
					</tr>
				</thead>
			</table>
			<br>
			<div class="DivScroll">
				<table align="center" border="0" id="TabScroll">
					<thead>
						<tr>
							<td align="center"  valign="center"  style="width:70px;">&nbsp;Année</td>
							<td align="center"  valign="center"  style="width:100%;" id="LabCpt">Montant</td>
							<td align="center"  valign="center"  style="width:150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Motif&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</thead>
					<tbody id="TabScrollBody"> </tbody>
					<tfoot><tr><td align="center" valign="center" colspan="3"></td></tr></tfoot>
				</table>
			</div>
			<div id="DivDragDrop">
				<div id="DivData">
					<table align="center" border="0" id="TabData">
						<thead style="cursor:move;" id="DivDataHeader">
							<tr>
								<td align="center" valign="center"  colspan="3">
									<span style="margin-top:3px;margin-left:5px;">Depense</span>
									<img  style="width:30px;margin-right:2px; float:right;" src="Images/Fermer.png" title="Fermer" onclick="javascript:FermerData();"/>
								</td>
							</tr>
						</thead>
						<tbody id="TabDataBody"></tbody>
						<tfoot><tr><td align="center" valign="center" colspan="3"></td></tr></tfoot>
					</table>
				</div>
			</div>
		</main>
		<script>
			function verif(){

				if(document.getElementById('LCriteres').value=='all'){

					document.getElementById("TVal").disabled = true;

				}else{
					document.getElementById("TVal").disabled = false;

				}
				
			}

			function choice(x){


				
				document.getElementById('IdRB').value=x;


			}
		</script>
	</body>
</html>