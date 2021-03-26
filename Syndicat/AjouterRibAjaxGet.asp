<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
	
	If(Len(Session("IdSyndic")) = 0) Then
		Response.Write "<tr><td colspan=""3"" align=""center"">Sessions Clotur&eacute;e, Veuillez vous indentifier.</td></tr>"
		Response.end
	End If
	


	Function GetFormattedDate(date1)
		strDate = CDate(date1)
		strDay = DatePart("d", strDate)
		strMonth = DatePart("m", strDate)
		strYear = DatePart("yyyy", strDate)
		If strDay < 10 Then
			strDay = "0" & strDay
		End If
		If strMonth < 10 Then
			strMonth = "0" & strMonth
		End If
		GetFormattedDate = strDay&"/"&strMonth&"/"&strYear
	End Function
	function IsChecked(val)
		if(val = True) then
			IsChecked = "checked"
		else
			IsChecked = ""
		end if
	end function

	Id = Replace(Request.QueryString("Id"), "'", "''")
	crit = Replace(Request.QueryString("crit"), "'", "''")

	If(crit = "coti" and IsNumeric(Id)) Then
		Req = "ps_cotisation_get_byid " & Id
	Set Con = Server.CreateObject("ADODB.Connection")
	Con.CursorLocation = 3
	Con.Open Application("PC")

	On Error Resume Next

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3

	Annee=Rs("Annee")
	MontantRegle=Rs("MontantRegle")
	MoyenReglement=Rs("MoyenReglement")
	DateReglement=GetFormattedDate(Rs("DateReglement"))
	ReferenceReglement=Rs("ReferenceReglement")
	ReferenceRecu=Rs("ReferenceRecu")
	DateEncaissement=Rs("DateEncaissement")
	'd=CDate(DateEncaissement)
	'DateEncaissement=FormatDateTime(d,2)
	IdRB=Rs("IdRB")
	Req = "ps_appart_get_nom " & Rs("IdCotisation")
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3
	Appart=Rs("Appart")

	If(Rs.RecordCount = 1) Then

%>
						<thead style="cursor:move;" id="DivDataHeader">
							<tr>
								<td align="center" valign="center"  colspan="3">
									<span style="margin-top:3px;margin-left:5px;">Cotisation</span>
									<img  style="width:30px;margin-right:2px; float:right;" src="Images/Fermer.png" title="Fermer" onclick="javascript:FermerData(); ";"/>
								</td>
							</tr>
						</thead>
						<tbody id="TabDataBody">
							<tr>
								<td align="left"    valign="center">IdCotisation</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center" style="width:100%;"><input type="text" name="ID" id="ID" readonly style="width:100%;" value="<%=Id%>" disabled/></td>
							</tr>
							<tr>
								<td align="left"    valign="center">Appartement</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center" style="width:100%;"><input type="text" name="TAppart" id="TAppart" readonly style="width:100%;" value="<%=Appart%>" disabled /></td>
							</tr>
							<tr>
								<td align="left"    valign="center">Annee</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="text" name="Tannee" id="Tannee" style="width:100%;" value="<%=Annee%>" disabled /></td>
							</tr>
							<tr>
								<td align="left"    valign="center">MontantRegle</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="text" name="TMR" id="TMR" style="width:100%;" value="<%=MontantRegle%>" disabled /></td>
							</tr>
							<tr>
								<td align="left"    valign="center">DateReglement</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="text" name="TDR" id="TDR" style="width:100%;" value="<%=DateReglement%>" disabled /></td>
							</tr>
							<tr>
								<td align="left"    valign="center">ReferenceReglement</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="text" name="TRR" id="TRR" style="width:100%;" value="<%=ReferenceReglement%>" disabled/></td>
							</tr>
							<tr>
								<td align="left"    valign="center">ReferenceRecu</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="text" name="TRefR" id="TRefR" style="width:100%;" value="<%=ReferenceRecu%>" disabled/></td>
							</tr>
							<tr>
								<td align="left"    valign="center">DateEncaissement</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="text" name="TDE" id="TDE" style="width:100%;" required value="<%=DateEncaissement%>" /></td>
							</tr>
							<tr>
								<td align="left"    valign="center">Numero RIB</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center">
									<input type="text" name="TRB" id="TRB" style="width:100%;" required value="<%=IdRB%>" />
								</td>
							</tr>
						</tbody>

<%
	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Informations non disponibles : Code non valide.</td></tr>"
		Response.End
	End If


	ELSEIf(crit = "depe" and IsNumeric(Id)) Then
		Req = "ps_depense_id "&Id&" " 


	Set Con = Server.CreateObject("ADODB.Connection")
	Con.CursorLocation = 3
	Con.Open Application("PC")

	On Error Resume Next

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3

	If(Rs.RecordCount = 1) Then
%>
						<thead style="cursor:move;" id="DivDataHeader">
							<tr>
								<td align="center" valign="center"  colspan="3">
									<span style="margin-top:3px;margin-left:5px;">Depense</span>
									<img  style="width:30px;margin-right:2px; float:right;" src="Images/Fermer.png" title="Fermer" onclick="javascript:FermerData(); ";"/>
								</td>
							</tr>
						</thead>
						<tbody id="TabDataBody">
							<tr>
								<td align="left"    valign="center">Annee</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center" style="width:100%;"><input type="text" name="Annee" id="Annee" readonly style="width:100%;" value="<%=Rs("Annee")%>" disabled /></td>
							</tr>
							<tr>
								<td align="left"    valign="center">Montant</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="text" name="Montant" id="Montant" style="width:100%;" value="<%=Rs("Montant")%>" disabled /></td>
							</tr>
							<tr>
								<td align="left"    valign="center">Date Depense</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="text" name="DateDepense" id="DateDepense" style="width:100%;" value="<%=Rs("DateDepense")%>" disabled/></td>
							</tr>
							<tr>
								<td align="left"    valign="center">Motif</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="text" name="Motif" id="TTel" style="width:100%; text-align:left;" value="<%=Rs("Motif")%>" disabled/></td>
							</tr>
							<tr>
								<td align="left"    valign="center">Beneficiaire</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="text" name="Beneficiaire" id="Beneficiaire" style="width:100%;" value="<%=Rs("Beneficiaire")%>" disabled/></td>
							</tr>
							<tr>
								<td align="left"    valign="center">Nature Reglement</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="text" name="NatureReglement" id="NatureReglement" style="width:100%;" value="<%=Rs("NatureReglement")%>" disabled/></td>
							</tr>
							<tr>
								<td align="left"    valign="center">Reference Reglement</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="text" style="width:100%;" name="ReferenceReglement" id="ReferenceReglement" value=<%=Rs("ReferenceReglement")%> disabled/></td>
							</tr>
							<tr>
								<td align="left"    valign="center">Justif</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center"><input type="checkbox" name="Justif" id="Justif"  disabled <%=IsChecked(Rs("Justif"))%> /><input type="hidden" name="Justif" id="Justif" disabled value="<%=Rs("IdDepense")%>" /></td>
							</tr>
							<tr>
								<td align="left"    valign="center">Numero RIB</td>
								<td align="center"  valign="center">:</td>
								<td align="left"    valign="center">
							<input type="text" name="IdRB" id="IdRB" style="width:100%;" value='<%=Rs("IdRB")%>' />

								</td>
								
							</tr>
						</tbody>
<%
	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Informations non disponibles : Code non valide.</td></tr>"
		Response.End
	End If
	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Code non valide.</td></tr>"
		Response.End
	End If

	rs.Close()
	Set rs = Nothing
	Con.Close()
	Set Con = Nothing
	If(Err.number <> 0) Then
		Response.Write Err.Description
	End If
%>
