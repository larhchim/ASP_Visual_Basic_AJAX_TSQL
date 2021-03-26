<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
	
	If(Len(Session("IdAdmin")) = 0) Then
		Response.Write "<tr><td colspan=""3"" align=""center"">Sessions Clotur&eacute;e, Veuillez vous indentifier.</td></tr>"
		Response.end
	End If

	Function FormatAjaxString(str)
		Dim i, lg, ch 
		ch = str
		
		lg = len(ch)
		for i = 192 to 255
			ch = Replace(ch, chr(i) , "&#" & i & ";")
		next
		FormatAjaxString = ch
	End Function

	function IsChecked(val)
		if(val = True) then
			IsChecked = "checked"
		else
			IsChecked = ""
		end if
	end function

	IdUser = Replace(Request.QueryString("IdUser"), "'", "''")
	Login = Replace(Request.QueryString("TAppart"), "'", "''")
	Nom = Replace(Request.QueryString("TNom"), "'", "''")
	Prenom = Replace(Request.QueryString("TPrenom"), "'", "''")
	Tel = Replace(Request.QueryString("TTel"), "'", "''")
	Email = Replace(Request.QueryString("TEmail"), "'", "''")
	Pass = Replace(Request.QueryString("TPass"), "'", "''")
	Sup = Replace(Request.QueryString("TSuperficie"), "'", "''")
	QPart = Replace(Request.QueryString("TQPart"), "'", "''") 
	Act = Replace(Request.QueryString("CBAct"), "'", "''")

	If(IsNumeric(IdUser)) Then
		Req = "ps_user_get_byid " & IdUser
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

	If(Rs.RecordCount = 1) Then
%>
						<tr>
							<td align="left"    valign="center">Appartement</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center" style="width:100%;"><input type="text" name="TAppart" id="TAppart" readonly style="width:100%;" value="<%=Rs("Login")%>" /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Nom</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TNom" id="TNom" style="width:100%;" value="<%=FormatAjaxString(Rs("Nom"))%>" /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Pr&eacute;nom</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TPrenom" id="TPrenom" style="width:100%;" value="<%=FormatAjaxString(Rs("Prenom"))%>" /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">T&eacute;l&eacute;phone</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TTel" id="TTel" style="width:100%;" value="<%=Rs("Tel")%>" /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Email</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TEmail" id="TEmail" style="width:100%;" value="<%=FormatAjaxString(Rs("Email"))%>" /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">M.D. Passe</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="password" name="TPass" id="TPass" style="width:100%;" value="" /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Superficie</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TSuperficie" id="TSuperficie" readonly style="width:100%;" value="<%=Rs("Superficie")%>" /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Quote-part</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TQuotePart" id="TQuotePart" readonly style="width:100%;" value="<%=Rs("QuotePart")%>" /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Activ&eacute;</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="checkbox" name="CBActive" id="CBActive" <%=IsChecked(Rs("Active"))%> /></td>
						</tr>

<%
	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Informations non disponibles : Code non valide.</td></tr>"
		Response.End
	End If

'    While Not RS.EOF


'		Rs.MoveNext
'	WEnd
	rs.Close()
	Set rs = Nothing
	Con.Close()
	Set Con = Nothing
	If(Err.number <> 0) Then
		Response.Write Err.Description
	End If
%>