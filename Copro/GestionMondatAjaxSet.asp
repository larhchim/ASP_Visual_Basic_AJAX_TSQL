<!--#INCLUDE FILE="../Admin/ParamAdmin.asp"-->

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
		if(val) then
			IsChecked = "checked"
		else
			IsChecked = ""
		end if
	end function

	IdMondat = Request.QueryString("id")
	Act = Request.QueryString("nom")
	qt = Request.QueryString("qt")
	rq = Request.QueryString("rq")
	
    If(Act="false") Then
		Act = 0
	ElseIf(Act="true") Then
		Act = 1
	Else
		Response.Write "Valeur activation manquante : " & IdMondat
		Response.end
	End If
	If(qt="false") Then
	   qt = 0
	ElseIf(qt="true") Then
	   qt = 1
	Else
		Response.Write "Valeur activation manquante : " & IdMondat
		Response.end
	End If
	If(IsNumeric(IdMondat) and Act = 0) Then
		Req = "ps_mondat_update_false '" & IdMondat & "'"
	ElseIf(IsNumeric(IdMondat) and Act = 1) Then
	    Req = "ps_mondat_update_true '" & IdMondat & "'"
	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Code non valide.</td></tr>"
		Response.End
	End If
	
	If(IsNumeric(IdMondat) and qt = 0) Then
		Req1 = "ps_mondat_update_q_false '" & IdMondat & "'"
	ElseIf(IsNumeric(IdMondat) and qt = 1) Then
	    Req1 = "ps_mondat_update_q_true '" & IdMondat & "'"
	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Code non valide.</td></tr>"
		Response.End
	End If
    Req2 = "ps_mondat_addRemaque '" & rq & "'," & IdMondat

	Set Con = Server.CreateObject("ADODB.Connection")
	Con.CursorLocation = 3
	Con.Open Application("PC")
    
    On Error Resume Next

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3
	Rs.Open Req2, Con, 3, 3
	Rs.Open Req1, Con, 3, 3
    
	If(Rs.RecordCount = 1) Then
	    response.Write "la modification est bien efectuer"
	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Informations non disponibles : Code non valide.</td></tr>"
		Response.End
	End If

	rs.Close()
	Set rs = Nothing
	Con.Close()
	Set Con = Nothing
%>