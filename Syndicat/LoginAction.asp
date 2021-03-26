<%
	Dim Login, Req, Rs, Con, msg
	
    Session("MsgTitle") = "Message (Connexion à l'espace Syndic)"

    Login = Replace(Request.Form("TLogin"),"'","''")
    Passwd = Replace(Request.Form("TPasswd"),"'","''")
	
    Req = "ps_syndic_verif '" & Login & "','" & Passwd & "'"
	Set Con = Server.CreateObject("ADODB.Connection")	
	Con.Open Application("PC")
	On Error Resume Next
	Set rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3

	if(Rs.RecordCount = 1) Then
        Active = Rs("Active")
        If(IsTrue(Active)) Then
        	Session("IdSyndic") = Rs("IdSyndic")
            Session("LoginSyndic") = Rs("Email")
            Session("PasswdSyndic") = Rs("MP")
			Session("Designation") =Rs("Designation")
			Session("Type")=Rs("Type")
			Session("Tel")=Rs("Tel")
        	Session("Msg") = "Bienvenue sur l'espace privé, réservé au Syndic de la résidence balnéaire Ola Blanca."
        	Rs.Close()
    		Set Rs = Nothing
    		Con.Close()
    		Set Con = Nothing
        	Response.Redirect "MessageSyndic.asp"
    	Else
    		Session("Msg") = "Votre compte n'est pas encore activé.<br><br>Prière de l'activer tout d'abord."
    	End If
    Elseif(Rs.RecordCount = 0) Then
		Session("Msg") = "Syndic non trouvé, verifiez votre login et/ou votre mot de passe"
    Else
		Session("Msg") = "Plusieurs Syndic ont le meme login !!!, prière de contactez l'administrateur."			
    End If
	
	Rs.Close()
	Set Rs = Nothing
	Con.Close()
	Set Con = Nothing

	If (Err.number <> 0) Then
		msg = "Pour des raisons techniques, l'activation de votre compte n'a pas eu lieu."
		msg = msg & "<br><br>Raison Technique : " & Err.Description
    	Session("Msg") = msg
    End If
    Session("IdSyndic") = ""
    Session("LoginSyndic") = ""
    Session("PasswdSyndic") = ""
	Response.Redirect "MessageSyndic.asp"
%>