<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
	
	If(Len(Session("IdCompte")) = 0) Then
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
	val = Request.QueryString("val")
	Dim c
     if(val <> "") then
	 c = GetFormattedDate(val)
	 End if
    If(val = "") Then
		Req = "ps_mandat_all"
    Elseif(crt = "dated") Then
		Req = "ps_mondat_dated '" & c & "'"
	Elseif(crt = "datef") Then
		Req = "ps_mondat_datef '" & c & "'"
	Else
		Response.Write "0##::##<tr><td colspan=""3"" align=""center"">Option non indentifi&eacute;e.</td></tr>"
		Response.End
	End If
    
    function IsChecked(val)
		if(val) then
			IsChecked = "Active"
		else
			IsChecked = "No Active"
		end if
	end function

	Set Con = Server.CreateObject("ADODB.Connection")
	Con.CursorLocation = 3
	Con.Open Application("PC")

	On Error Resume Next

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3
    Response.write Rs.RecordCount & "##::##"
    While Not RS.EOF
%>   	
	<tr id="<%=Rs("IdMandat")%>" onclick="javascript:ChargerData('<%=Rs("IdMandat")%>');">
		<td id="A_<%=Rs("IdMandat")%>"  align="left"   valign="center"><%=Rs("DateDebMandat")%></td>
		<td id="NP_<%=Rs("IdMandat")%>" align="left"   valign="center"><%=Rs("DateFinMandat")%></td>
		<td id="T_<%=Rs("IdMandat")%>"  align="center" valign="center"><%=IsChecked(Rs("Active"))%></td>
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
