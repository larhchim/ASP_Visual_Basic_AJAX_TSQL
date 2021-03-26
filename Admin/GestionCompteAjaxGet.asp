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

	IdCompte = Replace(Request.QueryString("IdCompte"), "'", "''")

	If(IsNumeric(IdCompte)) Then
		Req = "ps_compte_get_byid " & IdCompte
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
							<td align="left"    valign="center" style="width:100%;"><input type="text" name="TAppart" id="TAppart" readonly style="width:100%;" value="<%=Rs("Appart")%>" /></td>
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
							<td align="left"    valign="center">Activ&eacute;</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="checkbox" name="CBAct" id="CBAct" <%=IsChecked(Rs("Active"))%> /><input type="hidden" name="TIdCompte" id="TIdCompte" value="<%=Rs("IdCompte")%>" /></td>
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