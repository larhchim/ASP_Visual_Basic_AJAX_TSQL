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
		<script lang="Javascript">
			function Save()
			{
				//Verification des données avant envoi
				var Nom = document.getElementById('Active').checked ;
				var id = document.getElementById('Mn').value ;
				var qt = document.getElementById('Quitus').checked ;
				var rem = document.getElementById('TRemarque').value ;
				var fichier = 'GestionMondatAjaxSet.asp?nom='+Nom+'&id='+id+'&qt='+qt+'&rq='+rem ;
				// les chaines de caracteres contenant : , / ? : @ & = + $ ou # doivent etre codes avec encodeURIComponent
				//data = encodeURIComponent(data) ;
				AjaxSendData(fichier);
				//Rechercher() ;
            }
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

				xmlhttp.open('get', fichier, true);
				xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xmlhttp.send();
			}

			function FermerData() {
				document.getElementById('DivData').style.visibility = 'hidden';
				document.getElementById('TabScrollBody').style.visibility = 'visible';
			}

            function AjaxGetListe(fichier) {
                var xmlhttp, T;

                if (window.XMLHttpRequest) {
                    xmlhttp = new XMLHttpRequest();
                }
                else {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if ((xmlhttp.readyState == 4) && (xmlhttp.status == 200)) {
                        T = xmlhttp.responseText.split('##::##');
                        document.getElementById('TabScrollBody').innerHTML = T[1];
                        document.getElementById('TabScrollBody').style.visibility = 'visible';
                    }
                }

                xmlhttp.open("GET", fichier, true);
                xmlhttp.send();
            }
            
            function Rechercher() {
                var crt, val, fichier;
                crt = document.getElementById('LCriteres').value;
                val = document.getElementById('TVal').value;
                fichier = 'GestionMondatAjaxListe.asp?crt=' + crt + '&val=' + val;
                document.getElementById('DivData').style.visibility = 'hidden';
                AjaxGetListe(fichier);
				
            }

			function AjaxGetData(fichier) {
				var xmlhttp;

				if (window.XMLHttpRequest) {
					xmlhttp = new XMLHttpRequest();
				}
				else {
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.onreadystatechange = function () {
					if ((xmlhttp.readyState == 4) && (xmlhttp.status == 200)) {
						document.getElementById('TabDataBody').innerHTML = xmlhttp.responseText;
						document.getElementById('TabScrollBody').style.visibility = 'hidden';
						document.getElementById('DivData').style.visibility = 'visible';
					}
				}

				xmlhttp.open("GET", fichier, true);
				xmlhttp.send();
			}

			function ChargerData(Id) {
				var cible = 'GestionMondatAjaxGest.asp?IdMondat=' + Id;
				AjaxGetData(cible);
			}
        </script>
    </head>
    <body onload="javascript:InitDragDrop('#DivDragDrop', '#DivData');">
    	<!--#include file="../Admin/MenuAdmin.asp"-->
		<main role="main" class="container">
			<table align="center" border="0" id="TabForm">
				<thead>
					<tr height="35">
						<td align="center" valign="center">
							<select name="LCriteres" id="LCriteres" style="width:120px;">
								<option value="dated">Date Debut</option>
								<option value="datef">Date Fin</option>
							</select>
							&nbsp;&nbsp;
							<input type="date" name="TVal" id="TVal" value="" style="width:140px;" onkeypress="javascript:Valider();">
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
							<td align="center"  valign="center"  style="width:70px;">&nbsp;Date Debut</td>
							<td align="center"  valign="center"  style="width:100%;" id="LabCpt">Date Fin</td>
							<td align="center"  valign="center"  style="width:150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Active&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
									<img  style="width:50px;margin-left:2px;" src="../Admin/Images/Save.png" title="Modifier" onclick="javascript:Save();"/>
									
									<span style="margin-top:3px;margin-left:5px;">Mondat</span>
									<img  style="width:30px;margin-right:2px; float:right;" src="../Admin/Images/Fermer.png" title="Fermer" onclick="javascript:Rechercher();"/>
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