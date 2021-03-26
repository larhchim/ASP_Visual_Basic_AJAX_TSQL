<!--#INCLUDE FILE="../Admin/ParamAdmin.asp"-->
<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
	
	If(Len(Session("IdSyndic")) = 0) Then
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

			
	IdDepense = Request.QueryString("IdDepense")

	IdRB = Request.QueryString("IdRB")


	

	'Req2 = "ps_depense_rib "&IdRB&" "
	


	'Set Rs2 = Server.CreateObject("ADODB.RecordSet")
	'Rs2.Open Req2, Con, 3, 3

	'if(Rs2.RecordCount <>1) Then

	'	Response.Write "<tr><td colspan=""3"" align=""center"">Informations non disponibles : Code non valide.</td></tr>"
		'Response.End

   ' End if

	Set Con = Server.CreateObject("ADODB.Connection")
	Con.CursorLocation = 3
	Con.Open Application("PC")
	On Error Resume Next
	Req = "ps_depense_modify '" & IdDepense & "',' "& IdRB &" ' " 


	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3

	If(Rs.RecordCount = 1) Then
	
		Response.Write "Sauvegarde bien effectuée"
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