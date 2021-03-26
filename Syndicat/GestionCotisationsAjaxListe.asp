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

	app = Replace(Request.QueryString("app"), "'", "''")
	ann = Replace(Request.QueryString("ann"), "'", "''")
	
	If(app = "" and ann = "") Then
		Req = "ps_cotisation_all"
	Elseif(app <> "" and ann = "") Then
		Req = "ps_cotisation_byAPP @App='" &app& "'"
	Elseif(app = "" and Len(ann) <> 0) Then
		Req = "ps_cotisation_byAnn @Ann=" & ann 
	Elseif(Len(app) <> 0 and Len(ann) <> 0) Then
		Req = "ps_cotisation_byAppAnn '"&app& "'," & ann 
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
    Set Rs1 = Server.CreateObject("ADODB.RecordSet")
    While Not RS.EOF
    Req1 = "ps_appart_get_nom " & Rs("IdAppart")
   	Rs1.Open Req1, Con, 3, 3 
%>

	<tr id="<%=Rs("IdCotisation")%>" onclick="javascript:ChargerData('<%=Rs("IdCotisation")%>');" >
		<td id="A_<%=Rs("IdCotisation")%>"  align="left"   valign="center"><%=Rs1("Appart")%></td>
		<td id="NP_<%=Rs("IdCotisation")%>" align="left"   valign="center"><%=Rs("MontantRegle")%></td>
		<td id="T_<%=Rs("IdCotisation")%>"  align="center" valign="center"><%=GetFormattedDate(FormatDateTime(Rs("DateReglement"),2))%></td>
	</tr>
<%
		RS1.Close()
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
