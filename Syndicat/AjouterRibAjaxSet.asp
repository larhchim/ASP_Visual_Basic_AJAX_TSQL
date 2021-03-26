<!--#INCLUDE FILE="../Admin/ParamAdmin.asp"-->
<%
	Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
	
	If(Len(Session("IdSyndic")) = 0) Then
		Response.Write "<tr><td colspan=""3"" align=""center"">Sessions Clotur&eacute;e, Veuillez vous indentifier.</td></tr>"
		Response.end
	End If



	TableId = Replace(Request.QueryString("Tid"), "'", "''")
	NumRib = Replace(Request.QueryString("rib"), "'", "''")
	critere = Replace(Request.QueryString("crit"), "'", "''")

    dim table
    table =split(TableId,",")

    If(critere = "depe") Then


       
         Set Con = Server.CreateObject("ADODB.Connection")
         Con.CursorLocation = 3
         Con.Open Application("PC")

           for  each x in table

                 Req = "ps_depense_modify '"&x&"' , '"&NumRib&"' "
                 On Error Resume Next
                 Con.Execute Req

           next

      

        


        Req = "select * from TDEPENSES WHERE IdRB iS NULL"
		

		On Error Resume Next

		Set Rs = Server.CreateObject("ADODB.RecordSet")
		Rs.Open Req, Con, 3, 3
		Response.write Rs.RecordCount & "##::##"
		Set Rs1 = Server.CreateObject("ADODB.RecordSet")
		%>
		<thead>
			<tr>
				<td align="center"  valign="center"  style="width:70px;">&nbsp;Annee</td>
				<td align="center"  valign="center"  style="width:70%;" id="LabCpt">Montant</td>
				<td align="center"  valign="center"  style="width:350px;">&nbsp;&nbsp;&nbsp;select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</thead>
		<tbody id="TabScrollBody"> 
	<%
		While Not RS.EOF
		%>
			<tr id="<%=Rs("Annee")%>" >
				<td id="A_<%=Rs("Annee")%>" onclick="javascript:ChargerData('<%=Rs("IdDepense")%>');"  align="left"   valign="center"><%=Rs("Annee")%></td>
				<td id="NP_<%=Rs("Annee")%>" onclick="javascript:ChargerData('<%=Rs("IdDepense")%>');" align="left"   valign="center"><%=Rs("Montant")%></td>
				<td id="T_<%=Rs("Annee")%>"  align="center" valign="center"><input type="checkbox" id="depense" name="depense" value="<%=Rs("IdDepense")%>"></td>
			</tr>
	<%
			Rs.MoveNext
		WEnd
	%>
		</tbody>
	<%
	'Else
		'Response.Write "0##::##<tr><td colspan=""3"" align=""center"">Option non indentifi&eacute;e.</td></tr>"
	'	Response.End
	'End If







    ElseIf(critere = "coti") Then


       
         Set Con = Server.CreateObject("ADODB.Connection")
         Con.CursorLocation = 3
         Con.Open Application("PC")

           for  each x in table

                 Req = "UPDATE TCOTISATIONS SET IdRB="&NumRib&" WHERE IdCotisation ="&x
                 On Error Resume Next
                 Con.Execute Req

           next

      

        


       Req = "select * from TCOTISATIONS WHERE IdRB iS NULL"
		Set Con = Server.CreateObject("ADODB.Connection")
		Con.CursorLocation = 3
		Con.Open Application("PC")

		On Error Resume Next

		Set Rs = Server.CreateObject("ADODB.RecordSet")
		Rs.Open Req, Con, 3, 3
		Response.write Rs.RecordCount & "##::##"
		Set Rs1 = Server.CreateObject("ADODB.RecordSet")
	%>
		<thead>
			<tr>
				<td align="center"  valign="center"  style="width:70px;">&nbsp;Appart</td>
				<td align="center"  valign="center"  style="width:70%;" id="LabCpt">Montant</td>
				<td align="center"  valign="center"  style="width:350px;">&nbsp;&nbsp;&nbsp;select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</thead>
	<%
		While Not RS.EOF
			Req1 = "ps_appart_get_nom " & Rs("IdAppart")
			Rs1.Open Req1, Con, 3, 3 
		%>
			<tbody id="TabScrollBody"> 
			<tr id="<%=Rs("IdCotisation")%>"  >
				<td id="A_<%=Rs("IdCotisation")%>" onclick="javascript:ChargerData('<%=Rs("IdCotisation")%>');" align="left"   valign="center"><%=Rs1("Appart")%></td>
				<td id="NP_<%=Rs("IdCotisation")%>" onclick="javascript:ChargerData('<%=Rs("IdCotisation")%>');" align="left"   valign="center"><%=Rs("MontantRegle")%></td>
				<td id="T_<%=Rs("IdCotisation")%>"  align="center" valign="center"><input type="checkbox" id="cotisation" name="cotisation" value="<%=Rs("IdCotisation")%>"></td>
			</tr>
	<%
			RS1.Close()
			Rs.MoveNext
		WEnd
	%>
			</tbody>
	<%
	Else
		Response.Write "0##::##<tr><td colspan=""3"" align=""center"">Option non indentifi&eacute;e.</td></tr>"
		Response.End
	End If
        
        

  
        If(Err.number <> 0) Then
            Response.Write Err.Description
        End If



	
%>