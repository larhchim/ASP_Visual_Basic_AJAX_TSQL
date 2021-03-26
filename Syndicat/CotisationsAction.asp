<!--#INCLUDE FILE="../ParamRoot.asp"-->
<%
	Dim Login, Req, Rs, Con, msg
	
    Session("MsgTitle") = "Message (Connexion à l'espace Syndic)"

    Appart = Replace(Request.Form("TAppart"),"'","''")
    Annee = Replace(Request.Form("TAnnee"),"'","''")
    Montant = Replace(Request.Form("TMontant"),"'","''")
    Moyen = Replace(Request.Form("TMoyen"),"'","''")
    DateReg = Replace(Request.Form("TDateReg"),"'","''")
    Refreg = Replace(Request.Form("TRefreg"),"'","''")
    Refrecu = Replace(Request.Form("TRefrecu"),"'","''")


	Reqw= "ps_cotisations"


	'dt1  = Convert.ToDateTime("01/01/1900")
	'dt2  = Convert.ToDateTime(DateReg)

	'DateReg1=(CType(dt2 - dt1, TimeSpan).Days)

	d=CDate(DateReg)
	DateReg1=FormatDateTime(d,2)
	

	'Set cnSQL = New ADODB.connection
	'cnSQL.Open  "Provider=SQLOLEDB;Data Source=HP-PC;Initial Catalog=kheops_ola;User ID=kheops_ola;Password=Ola2.ES#2020"
	'Set sqlCommand = New ADODB.Command
	'sqlCommand.activeConnection =cnSQL

	'@Appart as NVARCHAR(10),
	'@Annee as INT,
	'@MontantRegle as INT,
	'@MoyenReglement as NVARCHAR(10),
	'@DateReglement as SMALLDATETIME,
	'@ReferenceReglement NVARCHAR(50),
	'@ReferenceRecu NVARCHAR(20)

    Req1= "SELECT IdAppart FROM TAPPARTS WHERE Appart = '"&Appart&"' "

' Req = "ps_cotisation_add '" & Appart & "' ," & Annee   & "," & Montant & ",'" & Moyen & "'," & DateReg1 & ",'" & Refreg & "','" & Refrecu & "'"

    Set Con = Server.CreateObject("ADODB.Connection")	
	Con.Open Application("PC")
	On Error Resume Next
	Set rs = Server.CreateObject("ADODB.RecordSet")

	Rs.Open Req1, Con, 3, 3
	id=Rs("idAppart")
	Rs.Close()
    		Set Rs = Nothing
    		Con.Close()
    		Set Con = Nothing

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



	Set Con = Server.CreateObject("ADODB.Connection")	
	Con.Open Application("PC")
	On Error Resume Next
	Set rs = Server.CreateObject("ADODB.RecordSet")

	Rs.Open Reqw, Con, 3, 3

	If( CInt(Montant) > CInt(Rs("MONTANT")) ) Then
     
	 	msg = "Cotisation autorisé est de "&Rs("MONTANT")&" DH vous avez dépassé ce Montant!!!!"
		Session("Msg") = msg
		Response.Redirect "MessageSyndic.asp"

	Else


   
		Req = "INSERT INTO TCOTISATIONS (IdAppart,Annee,MontantRegle,MoyenReglement,DateReglement,ReferenceReglement,ReferenceRecu) VALUES ("&id&" ,"&Annee&" ,'"&Montant&"' ,'"&Moyen&"','" & DateReg1 & "' , '"&Refreg&"','"&Refrecu&"')"
		'Req =" ps_cotisation_add "&id&" ,"&Annee&" ,'"&Montant&"' ,'"&Moyen&"','" & GetFormattedDate(DateReg) & "' , '"&Refreg&"','"&Refrecu&"' "
		Set Con = Server.CreateObject("ADODB.Connection")	
		Con.Open Application("PC")
		On Error Resume Next
		Set rs = Server.CreateObject("ADODB.RecordSet")

		Rs.Open Req, Con, 3, 3


		Con.CommitTrans
		if(Rs.RecordCount =1) Then
			
			if(Rs("id")=1) Then
				msg = "Cotisation Ajoutée !!!!"
				Session("Msg") = msg
				Rs.Close()
				Set Rs = Nothing
				Con.Close()
				Set Con = Nothing
				Response.Redirect "MessageSyndic.asp"
			End if
		
		Else
			
			msg = "Cotisation non Ajoutée !!!!"
			Session("Msg") = msg

		End If

	

	End If

	Rs.Close()
	Set Rs = Nothing
	Con.Close()
	Set Con = Nothing

	If (Err.number <> 0) Then
		msg = "Pour des raisons techniques, Veuillez reessayer ulterierement"
    End If
 
	Response.Redirect "MessageSyndic.asp"


	
%>