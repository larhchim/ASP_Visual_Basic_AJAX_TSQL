<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 

	If(Len(Session("IdCompte")) = 0) Then
		Session("Msg") = "Votre session est fermée, merci de vous identifier"
		Session("MsgTitle") = "message de gestion de Banques"
		response.redirect "Message.asp"
	End If
	Session("PageTitle") = "Syndic"
%>

<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - Géstion des appartements</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="../css/style.css" type="text/css">

		<script type="text/javascript" src="../JS/com.js"></script>
        <script type="text/javascript" src="JS/GestionBanque.js"></script>
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

				function Save()
			{
				//Verification des données avant envoi
				var Idbanque = document.getElementById('Idbanque').value ;
				var TAnnee = document.getElementById('TAnnee').value ;
				var TMois = document.getElementById('TMois').value ;
				var TTotalentrees = document.getElementById('TTotalentrees').value ;
				var TTotalsorties = document.getElementById('TTotalsorties').value ;
				var TSolde = document.getElementById('TSolde').value ;
				var data = 'Idbanque=' + Idbanque + '&TAnnee=' + TAnnee  + '&TMois=' + TMois + '&TTotalentrees=' + TTotalentrees  + '&TTotalsorties=' + TTotalsorties + '&TSolde=' + TSolde ;
				data = encodeURI(data) ;
				// les chaines de caracteres contenant : , / ? : @ & = + $ ou # doivent etre codes avec encodeURIComponent
				//data = encodeURIComponent(data) ;
				var fichier = 'GestionBanqueAjaxSet.asp?'+data;
				AjaxSendData(fichier);
				//Rechercher() ;
            }

			function Comptes()
			{
				//redirection module des comptes associés
            }
        </script>
    </head>
    <body onload="javascript:InitDragDrop('#DivDragDrop', '#DivData');">
    	<!--#include file="MenuCopro.asp"-->
		<main role="main" class="container">
			<table align="center" border="0" id="TabForm">
				<thead>
					<tr height="35">
						<td align="center" valign="center">

							<select name="LCriteres" id="LCriteres" style="width:120px;">
								<option value="all">ALL</option>
								<option value="annee">Annee</option>
                                <option value="solde">Solde</option>
							</select>

							&nbsp;&nbsp;
							<input type="number" name="TVal" id="TVal" value="" style="width:120px;" onkeypress="javascript:Valider();">
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
							<td align="center"  valign="center"  style="width:100%;" id="LabCpt">Mois</td>
							<td align="center"  valign="center"  style="width:150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Solde&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
									<span style="margin-top:3px;margin-left:5px;">Banque</span>
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