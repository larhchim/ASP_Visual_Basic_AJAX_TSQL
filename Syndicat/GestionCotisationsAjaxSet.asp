<!--#INCLUDE FILE="../Admin/ParamAdmin.asp"-->
<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
	
	If(Len(Session("IdSyndic")) = 0) Then
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

	' function IsChecked(val)
	' 	if(val = True) then
	' 		IsChecked = "checked"
	' 	else
	' 		IsChecked = ""
	' 	end if
	' end function
	Function URLDecode(sStr)
    Dim str,code,a0
    str=""
    code=sStr
    code=Replace(code,"+"," ")
    While len(code)>0
        If InStr(code,"%")>0 Then
            str = str & Mid(code,1,InStr(code,"%")-1)
            code = Mid(code,InStr(code,"%"))
            a0 = UCase(Mid(code,2,1))
            If a0="U" And RegExTest(code,"^%u[0-9A-F]{4}") Then
                str = str & ChrW((Int("&H" & Mid(code,3,4))))
                code = Mid(code,7)
            ElseIf a0="E" And RegExTest(code,"^(%[0-9A-F]{2}){3}") Then
                str = str & ChrW((Int("&H" & Mid(code,2,2)) And 15) * 4096 + (Int("&H" & Mid(code,5,2)) And 63) * 64 + (Int("&H" & Mid(code,8,2)) And 63))
                code = Mid(code,10)
            ElseIf a0>="C" And a0<="D" And RegExTest(code,"^(%[0-9A-F]{2}){2}") Then
                str = str & ChrW((Int("&H" & Mid(code,2,2)) And 3) * 64 + (Int("&H" & Mid(code,5,2)) And 63))
                code = Mid(code,7)
            ElseIf (a0<="B" Or a0="F") And RegExTest(code,"^%[0-9A-F]{2}") Then
                str = str & Chr(Int("&H" & Mid(code,2,2)))
                code = Mid(code,4)
            Else
                str = str & "%"
                code = Mid(code,2)
            End If
        Else
            str = str & code
            code = ""
        End If
    Wend
    URLDecode = str
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

	ID= Replace(Request.QueryString("ID"), "'", "''")
	d = Replace(Request.QueryString("DE"), "'", "''")
	RB = Replace(Request.QueryString("RB"), "'", "''")
	APPART = Replace(Request.QueryString("APPART"), "'", "''")
	DE= URLDecode(d)
	D1=CDate(DE)
	DEN=GetFormattedDate(D1)
	'Response.redirect(DEN)
	Req = "UPDATE TCOTISATIONS SET DateEncaissement = '"&DEN&"', IdRB="&RB&" WHERE IdCotisation ="&ID
	


	Set Con = Server.CreateObject("ADODB.Connection")
	Con.CursorLocation = 3
	Con.Open Application("PC")

	On Error Resume Next
	Con.Execute Req

	If(IsNumeric(ID)) Then
		Req = "ps_cotisation_get_byid " & ID
	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Code non valide.</td></tr>"
		Response.End
	End If
	


	'Req = "ps_cotisation_get_byid " & ID
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3

	
	If(Rs.RecordCount = 1) Then
	
		Response.Write "Sauvegarde bien effectuée"
		Response.End

	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Informations non disponibles : Code non valide.</td></tr>"
		Response.End
	End If

	Rs.Close()
	Set Rs = Nothing
	Con.Close()
	Set Con = Nothing
	If(Err.number <> 0) Then
		Response.Write Err.Description
	End If

%>
