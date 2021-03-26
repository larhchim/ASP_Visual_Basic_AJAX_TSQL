<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
	
	If(Len(Session("IdCompte")) = 0) Then
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
		Req = "ps_banque_get_byid " & IdCompte
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
							<td align="left"    valign="center">IdBanque</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center" style="width:100%;"><input type="text" name="Idbanque" id="Idbanque" readonly style="width:100%;" value="<%=Rs("IdRB")%>" disabled/></td>
						</tr>
                        <tr>
							<td align="left"    valign="center">Ann&eacute;e</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center" style="width:100%;"><input type="text" name="TAnnee" id="TAnnee"  style="width:100%;" value="<%=Rs("Annee")%>" disabled/></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Mois</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TMois" id="TMois" style="width:100%;" value="<%=FormatAjaxString(Rs("Mois"))%>" disabled/></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Total Entr&eacute;es</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TTotalentrees" id="TTotalentrees" style="width:100%;" value="<%=FormatAjaxString(Rs("TotalEntrees"))%>" disabled/></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Total Sorties</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TTotalsorties" id="TTotalsorties" style="width:100%;" value="<%=Rs("TotalSorties")%>" disabled /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">Solde</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TSolde" id="TSolde" style="width:100%;" value="<%=FormatAjaxString(Rs("Solde"))%>" disabled/></td>
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