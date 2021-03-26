<%

If(Len(Session("IdAdmin")) = 0) Then
		Session("Msg") = "Votre session est fermée, merci de vous identifier"
		Session("MsgTitle") = "message de connection"
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
        <script type="text/javascript" src="JS/GestionCotisations.js"></script>
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

				xmlhttp.open('GET', fichier, true);
				xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xmlhttp.send();
			}


			function Save()
			{
				//Verification des données avant envoi
				var fichier = 'GestionCotisationsAjaxSet.asp?' ;
				var ID = document.getElementById('ID').value ;
				var DE = document.getElementById('TDE').value ;
				var RB = document.getElementById('TRB').value ;
				var APPART = document.getElementById('TAppart').value ;
				
				if(VerifierDateV2(DE) == 0)
					return;
				DE = encodeURI(DE) ;
				// les chaines de caracteres contenant : , / ? : @ & = + $ ou # doivent etre codes avec encodeURIComponent
				DE = encodeURIComponent(DE) ;
				var data = 'DE=' + DE+ '&RB=' + RB +'&ID=' +ID+'&APPART='+APPART ;
				var fichier = 'GestionCotisationsAjaxSet.asp?'+data ;
				AjaxSendData(fichier);
				Rechercher() ;
            }

			function Comptes()
			{
				//redirection module des comptes associés
            }
            function IsInt(str)
 {
 var ls = str.length, i, c ;
 if(ls == 0)
 return false ;
 for(i = 0 ; i < ls ; i++)
 {
 c = str.charCodeAt(i) ;
 if((c < 48) || (c > 57))
 {
 return false ;
 }
 }
 return true ;
 }
        function IsDateV2(str)
		{
		var j,m,a,T=str.split('/');
		var TabMois = new Array(0, 31, 28, 31,30,31,30,31,31,30,31,30,31) ;
		if(T.length!=3)
		{
			return false;
		}
		j = T[0];
		m = T[1];
		a = T[2];
		if((j.length != 2) || !IsInt(j))
		{
			return false;
		}
		if((m.length != 2) || !IsInt(m))
		{
			return false;
		}
		if((a.length != 4) || !IsInt(a))
		{
			return false;
		}
		j = parseInt(j,10);
		m = parseInt(m,10);
		a = parseInt(a,10);
		if((m < 1) || (m > 12))
		{
			return false ;
		}
		if(a%4 == 0)
		{
			TabMois[2] = 29 ;
		}
		if((j < 1) || (j > TabMois[m]))
		{
		 	return false ;
		}
		return true ;
		}
		function VerifierDateV2(D)
 		{
 		if(!IsDateV2(D))
	 	{
	 		alert('Entrer un date valide') ;
	 		return 0;
		}
		return 1;
 		}
 		function choice(x){			
			document.getElementById('TRB').value=x;
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
							<input type="text" placeholder="Appart" name="TApp" id="TApp" value="" style="width:120px;" onkeypress="javascript:Valider();">
							&nbsp;&nbsp;
							<input type="number" min="0" placeholder="Année" name="TAnn" id="TAnn" value="" style="width:120px;" onkeypress="javascript:Valider();">
							&nbsp;&nbsp;
							<button type = "button" name = "BTRechercher" value = "Rechercher" title ="Rechercher" onclick="javascript:Rechercher();"><img src="../Admin/images/search.png" style="width:30px;height:30px;" /></button>
						</td>
					</tr>
				</thead>
			</table>
			<br>
			<div class="DivScroll">
				<table align="center" border="0" id="TabScroll">
					<thead>
						<tr>
							<td align="center"  valign="center"  style="width:70px;">&nbsp;Appart</td>
							<td align="center"  valign="center"  style="width:70%;" id="LabCpt">Montant</td>
							<td align="center"  valign="center"  style="width:350px;">&nbsp;&nbsp;&nbsp;Date Reglement&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
									<span style="margin-top:3px;margin-left:5px;">Cotisation</span>
									<img  style="width:30px;margin-right:2px; float:right;" src="Images/Fermer.png" title="Fermer" onclick="javascript:FermerData(); ";"/>
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