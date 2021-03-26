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

	IdCotisation = Replace(Request.QueryString("IdCotisation"), "'", "''")

	If(IsNumeric(IdCotisation)) Then
		Req = "ps_cotisation_get_byid " & IdCotisation
	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Code non valide.</td></tr>"
		Response.End
	End If

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
						<tr>
							<td align="left"    valign="center">IdCotisation</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center" style="width:100%;"><input type="text" name="ID" id="ID" readonly style="width:100%;" value="<%=IdCotisation%>" disabled/></td>
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
							<td align="left"    valign="center"><input type="text" name="TDE" id="TDE" style="width:100%;" required value="<%=GetFormattedDate(DateEncaissement)%>" /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Numero RIB</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center">
						<input type="text" name="TRB" id="TRB" style="width:100%;" required value="<%=IdRB%>" />

							<select name="rib" id="rib" onclick="javascript:choice(this.value);" style="width:100%;">
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

							</td>
							
						</tr>

<%
	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Informations non disponibles : Code non valide.</td></tr>"
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
