<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
	If(Len(Session("IdSyndic")) = 0) Then
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


	ann = Replace(Request.QueryString("ann"), "'", "''")
	If( ann = "") Then
		Req = "ps_budget_all"
	Elseif( Len(ann) <> 0) Then
		Req = "ps_budget_byAnnee " & ann 
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

	<tr id="<%=Rs("Annee")%>" onclick="javascript:ChargerData('<%=Rs("Annee")%>');" >
		<td id="A_<%=Rs("Annee")%>"  align="left"   valign="center"><%=Rs("Annee")%></td>
		<td id="NP_<%=Rs("Annee")%>" align="left"   valign="center"><%=Rs("BudgetAnnuel")%></td>
		<td id="T_<%=Rs("Annee")%>"  align="center" valign="center"><%=Rs("TypeCotisation")%></td>
	</tr>
<%
		Rs.MoveNext
	WEnd
	Rs.Close()
	Set rs = Nothing
	Con.Close()
	Set Con = Nothing
	If(Err.number <> 0) Then
		Response.Write Err.Description
	End If
%>
