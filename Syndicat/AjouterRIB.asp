<%

	If(Len(Session("IdSyndic")) = 0) Then
	
		Session("Msg") = "Votre session est fermée, merci de vous identifier"
		Session("MsgTitle") = "message de connection"
		response.redirect "MessageSyndic.asp"

	End If

		Session("PageTitle")= "Cotisation"

%>


<html lang="fr">
    <head>
        <title>Ola Blanca - Résidence Balnéaire - Géstion des appartements</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="../css/style.css" type="text/css">

		<script type="text/javascript" src="../JS/com.js"></script>
        <script type="text/javascript" src="JS/AjouterRib.js"></script>

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
						
				if(RB == ""){

					alert('Id Rib vide')
					return;

				}
			

				DE = encodeURI(DE) ;
				// les chaines de caracteres contenant : , / ? : @ & = + $ ou # doivent etre codes avec encodeURIComponent
				DE = encodeURIComponent(DE) ;
				var data = 'DE=' + DE+ '&RB=' + RB +'&ID=' +ID+'&APPART='+APPART ;
				var fichier = 'GestionCotisationsAjaxSet.asp?'+data ;
				AjaxSendData(fichier);
				//Rechercher() ;
            }

			function Comptes()
			{
				//redirection module des comptes associés
            }


	 		function choice(x){			
				document.getElementById('TRB').value=x;
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
							<select name="LCriteres" id="LCriteres" style="width:120px;" onchange="javascript:Rechercher();">
								<option value="*">--veuillez choisir--</option>
								<option value="coti">Cotisation</option>
								<option value="depe">Depense</option>
							</select>
							&nbsp;&nbsp;
							<input type="hidden" name="TRB" id="TRB" style="width:120px;" required value="<%=IdRB%>" />

							<select name="rib" id="rib" onclick="javascript:choice(this.value);" style="width:120px;">
								<option value="">--Annee/Mois/Solde--</option>
								<%
									Req3 = "SELECT * FROM TBANQUE" 

									Set Con = Server.CreateObject("ADODB.Connection")
									Con.CursorLocation = 3
									Con.Open Application("PC")

									On Error Resume Next

									Set Rs3 = Server.CreateObject("ADODB.RecordSet")
									Rs3.Open Req3, Con, 3, 3
									While Not RS3.EOF
								 %>

								<option value='<%=Rs3("IdRB")%>'>     <%=Rs3("Annee")%>/<%=Rs3("Mois")%>/<%=Rs3("Solde")%>       </option>

								<% 

									Rs3.MoveNext
									WEnd
									rs3.Close()
									Set rs3 = Nothing
							
				
								%>
							</select>
							&nbsp;&nbsp;
							
							<button name="BTValider" id="BTValider" type="button" class="btn btn-outline-primary" value="Ajouter"  alt="Ajouter" title="Ajouter" onclick="javascript:Modify();">Ajouter</button>


						</td>
					</tr>
				</thead>
			</table>
			<br>
			<div class="DivScroll">
				<table align="center" border="0" id="TabScroll">
					
					<tfoot><tr><td align="center" valign="center" colspan="3"></td></tr></tfoot>
				</table>
			</div>
			<div id="DivDragDrop">
				<div id="DivData">
					<table align="center" border="0" id="TabData">
						
						
						<tfoot><tr><td align="center" valign="center" colspan="3"></td></tr></tfoot>
					</table>
				</div>
			</div>
		</main>

		<script>

	


	
		</script>
	</body>
</html>