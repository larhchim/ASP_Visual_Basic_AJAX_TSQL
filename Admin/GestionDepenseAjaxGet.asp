<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
	
	If(Len(Session("IdAdmin")) = 0) Then
		Response.Write "<tr><td colspan=""3"" align=""center"">Sessions Clotur&eacute;e, Veuillez vous indentifier.</td></tr>"
		Response.end
	End If



	function IsChecked(val)
		if(val = True) then
			IsChecked = "checked"
		else
			IsChecked = ""
		end if
	end function

	IdDepense = Replace(Request.QueryString("IdDepense"), "'", "''")


		Req = "ps_depense_id "&IdDepense&" " 

	Set Con = Server.CreateObject("ADODB.Connection")
	Con.CursorLocation = 3
	Con.Open Application("PC")

	On Error Resume Next

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3

	If(Rs.RecordCount = 1) Then
%>
						<input type="hidden" value='<%=Rs("IdDepense")%>' id="IdDepense">
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
						<input type="text" name="IdRB" id="IdRB" style="width:100%;" value="<%=Rs("IdRB")%>" disabled />
							</td>
							
						</tr>

						<tr>
					     <input type="hidden" value='<%=Rs("IdDepense")%>' id="IdDepense">

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

