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

	function IsChecked(val)
		if(val = True) then
			IsChecked = "checked"
		else
			IsChecked = ""
		end if
	end function

	Idbanque = Replace(Request.QueryString("Idbanque"), "'", "''")
	TAnnee = FormatName(Replace(Request.QueryString("TAnnee"), "'", "''"))
	TMois = FormatName(Replace(Request.QueryString("TMois"), "'", "''"))
	TTotalentrees = DelSpace(Replace(Request.QueryString("TTotalentrees"), "'", "''"))
	TTotalsorties = DelSpace(Replace(Request.QueryString("TTotalsorties"), "'", "''"))
	TSolde = Replace(Request.QueryString("TSolde"), "'", "''")
	'Response.Write " '" & Idbanque & "','" & TAnnee & "','" & TMois & "','" & TTotalentrees & "','" & TTotalsorties & "','" & TSolde & "' "

	If(IsNumeric(Idbanque)) Then
		Req = "ps_banque_update '" & Idbanque & "','" & TAnnee & "','" & TMois & "','" & TTotalentrees & "','" & TTotalsorties & "','" & TSolde & "' "
	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Code non valide.</td></tr>"
		Response.End
	End If

	Set Con = Server.CreateObject("ADODB.Connection")
	Con.CursorLocation = 3
	Con.Open Application("PC")

	On Error Resume Next
	Con.Execute Req

	Req = "ps_compte_get_byid " & IdCompte
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3

	If(Rs.RecordCount = 1) Then
		Response.Write "<tr><td colspan=""3"" align=""center"">Informations Modifiees avec succes </td></tr>"
		Response.End
		
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