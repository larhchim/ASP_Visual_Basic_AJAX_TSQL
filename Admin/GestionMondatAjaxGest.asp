<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
	
	If(Len(Session("IdAdmin")) = 0) Then
		Response.Write "<tr><td colspan=""3"" align=""center"">Sessions Clotur&eacute;e, Veuillez vous indentifier.</td></tr>"
		Response.end
	End If


	function IsChecked(val)
		if(val) then
			IsChecked = "checked"
		else
			IsChecked = ""
		end if
	end function
	

	IdMondat = Replace(Request.QueryString("IdMondat"), "'", "''")

	If(IsNumeric(IdMondat)) Then
		Req = "ps_mondat_get_byid " & IdMondat
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
%>                     <input type="hidden" value='<%=Rs("IdMandat")%>' id="Mn">
						<tr>
							<td align="left"    valign="center">Date Debut</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center" style="width:100%;"><input type="text" name="TAppart" id="TAppart" readonly style="width:100%; cursor: none;  pointer-events: none;" value="<%=Rs("DateDebMandat")%>"/></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Date Fin</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TNom" id="TNom" style="width:100%;cursor: none;  pointer-events: none;" value="<%=Rs("DateFinMandat")%>" /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Remarque</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TRemarque" id="TRemarque" style="width:100%;" value="<%=Rs("Remarques")%>" /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Quitus</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="checkbox" name="Quitus" id="Quitus" style="width:100%;" <%=IsChecked(Rs("Quitus"))%>/></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Active</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="checkbox" name="Active" id="Active" style="width:100%;" <%=IsChecked(Rs("Active"))%>/></td>
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