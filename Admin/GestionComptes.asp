<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 

	If(Len(Session("IdAdmin")) = 0) Then
		Session("Msg") = "Votre session est fermée, merci de vous identifier"
		Session("MsgTitle") = "message de gestion des appartements"
		response.redirect "Message.asp"
	End If
	Session("PageTitle") = "Gestion des Modules"
%>

<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - Géstion des appartements</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="../css/style.css" type="text/css">

		<script type="text/javascript" src="../JS/com.js"></script>
        <script type="text/javascript" src="JS/GestionComptes.js"></script>
		<script lang="Javascript">
		
			function AjaxSendData(fichier, data) 
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

				xmlhttp.open('POST', fichier, true);
				xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xmlhttp.send(data);
			}


			function Save()
			{
				//Verification des données avant envoi
				var Nom = document.getElementById('TNom').value ;
				var Prenom = document.getElementById('TPrenom').value ;
				var Tel = document.getElementById('TTel').value ;
				var Email = document.getElementById('TEmail').value ;
				var MP = document.getElementById('TPass').value ;
				var Act = document.getElementById('CBAct').checked ;
				var fichier = 'GestionCompteAjaxSet.asp' ;
				var IdCpt = document.getElementById('TIdCompte').value ;
				var data = 'IdCompte=' + IdCpt + '&Nom=' + Nom  + '&Prenom=' + Prenom + '&Tel=' + encodeURIComponent(Tel)  + '&Email=' + Email + '&MP=' + MP + '&Act=' + Act ;
				data = encodeURI(data) ;
				// les chaines de caracteres contenant : , / ? : @ & = + $ ou # doivent etre codes avec encodeURIComponent
				//data = encodeURIComponent(data) ;
				AjaxSendData(fichier, data);
				//Rechercher() ;
            }

			function Comptes()
			{
				//redirection module des comptes associés
            }
        </script>
    </head>
    <body onload="javascript:InitDragDrop('#DivDragDrop', '#DivData');">
    	<!--#include file="MenuAdmin.asp"-->
		<main role="main" class="container">
			<table align="center" border="0" id="TabForm">
				<thead>
					<tr height="35">
						<td align="center" valign="center">
							<select name="LCriteres" id="LCriteres" style="width:120px;">
								<option value="App">Appartement</option>
								<option value="Nom">Nom</option>
								<option value="Tel">Téléphone</option>
								<option value="Email">Email</option>
								<option value="Act">Ativés</option>
								<option value="Des">Désativés</option>
							</select>
							&nbsp;&nbsp;
							<input type="text" name="TVal" id="TVal" value="" style="width:120px;" onkeypress="javascript:Valider();">
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
							<td align="center"  valign="center"  style="width:70px;">&nbsp;Appart.</td>
							<td align="center"  valign="center"  style="width:100%;" id="LabCpt">Nom et Prénom : (0)</td>
							<td align="center"  valign="center"  style="width:150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Téléphone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
									<img  style="width:50px;margin-left:2px;" src="Images/Save.png" title="Modifier" onclick="javascript:Save();"/>
									<img  style="width:50px;margin-left:20px;" src="Images/Comptes.png" title="Comptes associ&eacute;s" onclick="javascript:Comptes();"/>
									<span style="margin-top:3px;margin-left:5px;">Compte Principal</span>
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
	</body>
</html>