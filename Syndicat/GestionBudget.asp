<%
If(Len(Session("IdSyndic")) = 0) Then
    Session("Msg") = "Votre session est fermée, merci de vous identifier"
    Session("MsgTitle") = "message de connection"
    response.redirect "../Message.asp"

End If
	Session("PageTitle")= "Budget"
%>

<html lang="fr">

    <head>
        <title>Ola Blanca - Résidence Balnéaire - Géstion des appartements</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="../CSS/style.css" type="text/css">

		<script type="text/javascript" src="../JS/com.js"></script>
        <script type="text/javascript" src="JS/GestionBudget.js"></script>
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
    	<!--#include file="MenuSyndic.asp"-->
		<main role="main" class="container">
			<table align="center" border="0" id="TabForm">
				<thead>
					<tr height="35">
						<td align="center" valign="center">
							
							<input type="number" min="0" name="TVal" placeholder="Année" id="TVal" value="" style="width:120px;" onkeypress="javascript:Valider();">
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
                            <td align="center"  valign="center"  style="width:25%;">Annee</td>
							<td align="center"  valign="center"  style="width:25%;">Budget Annuel</td>
							<td align="center"  valign="center"  style="width:25%;" >Type</td>
						</tr>
					</thead>
					<tbody id="TabScrollBody"> </tbody>
					<tfoot><tr><td align="center" valign="center" colspan="4"></td></tr></tfoot>
				</table>
			</div>
			<div id="DivDragDrop">
				<div id="DivData">
					<table align="center" border="0" id="TabData">
						<thead style="cursor:move;" id="DivDataHeader">
							<tr>
								<td align="center" valign="center"  colspan="3">
									<span style="margin-top:3px;margin-left:5px;">Budget</span>
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