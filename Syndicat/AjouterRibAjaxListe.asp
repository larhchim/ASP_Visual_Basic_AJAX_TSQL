<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
	If(Len(Session("IdSyndic")) = 0) Then
		Response.Write "0##::##<tr><td colspan=""3"" align=""center"">Sessions Clotur&eacute;e, Veuillez vous indentifier.</td></tr>"
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

	crit = Replace(Request.QueryString("crit"), "'", "''")
	
	If(crit = "coti" ) Then
		Req = "select * from TCOTISATIONS WHERE IdRB iS NULL"
		Set Con = Server.CreateObject("ADODB.Connection")
		Con.CursorLocation = 3
		Con.Open Application("PC")

		On Error Resume Next

		Set Rs = Server.CreateObject("ADODB.RecordSet")
		Rs.Open Req, Con, 3, 3
		Response.write Rs.RecordCount & "##::##"
		Set Rs1 = Server.CreateObject("ADODB.RecordSet")
	%>
		<thead>
			<tr>
				<td align="center"  valign="center"  style="width:70px;">&nbsp;Appart</td>
				<td align="center"  valign="center"  style="width:70%;" id="LabCpt">Montant</td>
				<td align="center"  valign="center"  style="width:350px;">&nbsp;&nbsp;&nbsp;select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</thead>
		<tbody id="TabScrollBody"> 

	<%
		While Not RS.EOF
			Req1 = "ps_appart_get_nom " & Rs("IdAppart")
			Rs1.Open Req1, Con, 3, 3 
		%>
			<tr id="<%=Rs("IdCotisation")%>"  >
				<td id="A_<%=Rs("IdCotisation")%>" onclick="javascript:ChargerData('<%=Rs("IdCotisation")%>');" align="left"   valign="center"><%=Rs1("Appart")%></td>
				<td id="NP_<%=Rs("IdCotisation")%>" onclick="javascript:ChargerData('<%=Rs("IdCotisation")%>');" align="left"   valign="center"><%=Rs("MontantRegle")%></td>
				<td id="T_<%=Rs("IdCotisation")%>"  align="center" valign="center"><input type="checkbox" id="cotisation" name="cotisation" value="<%=Rs("IdCotisation")%>"></td>
			</tr>
	<%
			RS1.Close()
			Rs.MoveNext
		WEnd
	%>
			</tbody>
	<%
	Elseif(crit = "depe") Then

		Req = "select * from TDEPENSES WHERE IdRB iS NULL"
		Set Con = Server.CreateObject("ADODB.Connection")
		Con.CursorLocation = 3
		Con.Open Application("PC")

		On Error Resume Next

		Set Rs = Server.CreateObject("ADODB.RecordSet")
		Rs.Open Req, Con, 3, 3
		Response.write Rs.RecordCount & "##::##"
		Set Rs1 = Server.CreateObject("ADODB.RecordSet")
		%>
		<thead>
			<tr>
				<td align="center"  valign="center"  style="width:70px;">&nbsp;Annee</td>
				<td align="center"  valign="center"  style="width:70%;" id="LabCpt">Montant</td>
				<td align="center"  valign="center"  style="width:350px;">&nbsp;&nbsp;&nbsp;select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</thead>
		<tbody id="TabScrollBody"> 
	<%
		While Not RS.EOF
		%>
			<tr id="<%=Rs("Annee")%>" >
				<td id="A_<%=Rs("Annee")%>" onclick="javascript:ChargerData('<%=Rs("IdDepense")%>');"  align="left"   valign="center"><%=Rs("Annee")%></td>
				<td id="NP_<%=Rs("Annee")%>" onclick="javascript:ChargerData('<%=Rs("IdDepense")%>');" align="left"   valign="center"><%=Rs("Montant")%></td>
				<td id="T_<%=Rs("Annee")%>"  align="center" valign="center"><input type="checkbox" id="depense" name="depense" value="<%=Rs("IdDepense")%>"></td>
			</tr>
	<%
			Rs.MoveNext
		WEnd
	%>
		</tbody>
	<%
	Else
		Response.Write "0##::##<tr><td colspan=""3"" align=""center"">Option non indentifi&eacute;e.</td></tr>"
		Response.End
	End If

	
%>

	
<%
	rs.Close()
	Set rs = Nothing
	Con.Close()
	Set Con = Nothing
	If(Err.number <> 0) Then
		Response.Write Err.Description
	End If
%>
