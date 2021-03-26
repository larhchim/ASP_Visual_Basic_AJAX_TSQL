<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
	
	If(Len(Session("IdAdmin")) = 0) Then
		Response.Write "0##::##<tr><td colspan=""3"" align=""center"">Sessions Clotur&eacute;e, Veuillez vous indentifier.</td></tr>"
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

	crt = Request.QueryString("crt")
	val = Replace(Request.QueryString("val"), "'", "''")

	If(crt = "App") Then
		Req = "ps_compte_search @Appart='" & val & "'"
	Elseif(crt = "Nom") Then
		Req = "ps_compte_search @Nom='" & val & "'"
	Elseif(crt = "Tel") Then
		Req = "ps_compte_search @Tel='" & val & "'"
	Elseif(crt = "Email") Then
		Req = "ps_compte_search @Email='" & val & "'"
	Elseif(crt = "Act") Then
		Req = "ps_compte_search @active=1"
	Elseif(crt = "Des") Then
		Req = "ps_compte_search @active=0"
	Else
		Response.Write "0##::##<tr><td colspan=""3"" align=""center"">Option non indentifi&eacute;e.</td></tr>"
		Response.End
	End If

	Set Con = Server.CreateObject("ADODB.Connection")
	Con.CursorLocation = 3
	Con.Open Application("PC")

	On Error Resume Next

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3
    Response.write Rs.RecordCount & "##::##"
    While Not RS.EOF
%>
	<tr id="<%=Rs("IdCompte")%>" onclick="javascript:ChargerData('<%=Rs("IdCompte")%>');">
		<td id="A_<%=Rs("IdCompte")%>"  align="left"   valign="center"><%=Rs("Appart")%></td>
		<td id="NP_<%=Rs("IdCompte")%>" align="left"   valign="center"><%=FormatAjaxString(Rs("Nom") & " "  & Rs("Prenom"))%></td>
		<td id="T_<%=Rs("IdCompte")%>"  align="center" valign="center"><%=Rs("Tel")%></td>
		<td id="E_<%=Rs("IdCompte")%>"  align="center" valign="center" style="display:none;"><%=Rs("Email")%></td>
	</tr>
<%
		Rs.MoveNext
	WEnd
	rs.Close()
	Set rs = Nothing
	Con.Close()
	Set Con = Nothing
	If(Err.number <> 0) Then
		Response.Write Err.Description
	End If
%>
