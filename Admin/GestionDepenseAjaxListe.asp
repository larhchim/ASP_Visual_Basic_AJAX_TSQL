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

		    'if( Len(val)>0 And IsNumeric(val) = false ) then
						'"Response.Write "0##::##<tr><td colspan=""3"" align=""center"">Chaine de caractere non prise en charge</td></tr>"
						'Response.End

			If(crt ="all" And val<>"" ) Then
				val=""
				Req = "ps_depense_all"

			Elseif(crt = "all" And val="" ) Then
				Req = "ps_depense_all"

			ElseIf(crt = "year" And val<>"" ) Then

				Req = "ps_depense_annee "&val&" "
			
			Elseif(crt = "year" And val=""  ) Then
				Req = "ps_depense_all"

			Elseif(crt = "sum" And val<>"" ) Then 
				
			    Req="ps_depense_montant "&val&" "

			Elseif(crt = "sum" And val="" ) Then 
				Req = "ps_depense_all"

			'Elseif(crt = "Tel") Then
				'Req = "ps_compte_search @Tel='" & val & "'"
			'Elseif(crt = "Email") Then
			''	Req = "ps_compte_search @Email='" & val & "'"
			'Elseif(crt = "Act") Then
			'	Req = "ps_compte_search @active=1"
		'	Elseif(crt = "Des") Then
			'	Req = "ps_compte_search @active=0"
			Else
				Response.Write "0##::##<tr><td colspan=""3"" align=""center"">Option non indentifi&eacute;e.</td></tr>"
		'	'	Response.End
			End If
				'Req = "ps_depense_all"




	Set Con = Server.CreateObject("ADODB.Connection")
	Con.CursorLocation = 3
	Con.Open Application("PC")

	On Error Resume Next

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3
    Response.write Rs.RecordCount & "##::##"
    While Not RS.EOF
%>
	<tr id="<%=Rs("IdDepense")%>" onclick="javascript:ChargerData('<%=Rs("IdDepense")%>');">
		<td id="A_<%=Rs("IdDepense")%>"  align="left"   valign="center"><%=Rs("Annee")%></td>
		<td id="Mon_<%=Rs("IdDepense")%>"  align="center" valign="center"><%=Rs("Montant")%></td>
		<td id="Mot_<%=Rs("IdDepense")%>"  align="right" valign="center" ><%=Rs("Motif")%></td>
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
