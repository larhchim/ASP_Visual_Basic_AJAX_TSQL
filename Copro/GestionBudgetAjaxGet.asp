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
		if(val = True) then
			IsChecked = "checked"
		else
			IsChecked = ""
		end if
	end function

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

	If(IsNumeric(IdCotisation)) Then
		Req = "ps_budget_byAnnee " & ann
	Else
		Response.Write "<tr><td colspan=""3"" align=""center"">Code non valide.</td></tr>"
		Response.End
	End If

	Set Con = Server.CreateObject("ADODB.Connection")
	Con.CursorLocation = 3
	Con.Open Application("PC")

	On Error Resume Next

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3

	If(Rs.RecordCount = 1) Then
%>
						<tr>
							<td align="left"    valign="center">IdBudget</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center" style="width:100%;"><input type="text" name="ID" id="ID" readonly style="width:100%;" value="<%=Rs("Annee")%>" disabled/></td>
						</tr>
						<tr>
							<td align="left"    valign="center">IdMandat</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center" style="width:100%;"><input type="text" name="TAppart" id="TAppart" readonly style="width:100%;" value="<%=Rs("IdMandat")%>" disabled /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">TypeCotisation</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="Tannee" id="Tannee" style="width:100%;" value="<%=Rs("TypeCotisation")%>" disabled /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">BudgetAnnuel</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TMR" id="TMR" style="width:100%;" value="<%=Rs("BudgetAnnuel")%>" disabled /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">GlobalEncaisse</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TDR" id="TDR" style="width:100%;" value="<%=Rs("GlobalEncaisse")%>" disabled /></td>
						</tr>
						<tr>
							<td align="left"    valign="center">GlobalDepense</td>
							<td align="center"  valign="center">:</td>
							<td align="left"    valign="center"><input type="text" name="TRR" id="TRR" style="width:100%;" value="<%=Rs("GlobalDepense")%>" disabled/></td>
						</tr>	

<%
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
<script type="text/javascript">
	function IsInt(str)
 {
 var ls = str.length, i, c ;
 if(ls == 0)
 return false ;
 for(i = 0 ; i < ls ; i++)
 {
 c = str.charCodeAt(i) ;
 if((c < 48) || (c > 57))
 {
 return false ;
 }
 }
 return true ;
 }
	function IsDateV2(str)
	{
		var j,m,a,T=str.split('/');
		var TabMois = new Array(0, 31, 28, 31,30,31,30,31,31,30,31,30,31) ;
		if(T.length!=3)
		{
			return false;
		}
		j = T[0];
		m = T[1];
		a = T[2];
		if((j.length != 2) || !IsInt(j))
		{
			return false;
		}
		if((m.length != 2) || !IsInt(m))
		{
			return false;
		}
		if((a.length != 4) || !IsInt(a))
		{
			return false;
		}
		j = parseInt(j,10);
		m = parseInt(m,10);
		a = parseInt(a,10);
		if((m < 1) || (m > 12))
		{
			return false ;
		}
		if(a%4 == 0)
		{
			TabMois[2] = 29 ;
		}
		if((j < 1) || (j > TabMois[m]))
		{
		 	return false ;
		}
		return true ;
	}
	function VerifierDateV2()
 	{
 		if(!IsDateV2(document.getElementById('TDate').value))
	 	{
	 		alert('Date non valide') ;
	 		document.getElementById('TDate').focus() ;
	 		return ;
		}
 	}


</script>