<!--#INCLUDE FILE="ParamAdmin.asp"-->
<%
	Dim Login, Req, Rs, Con, msg
	
    Session("MsgTitle") = "Message (Connexion à l'espace des copropriétaires)"

    Login = Replace(Request.Form("TLogin"),"'","''")
    Passwd = Replace(Request.Form("TPasswd"),"'","''")
	
    Req = "ps_admin_verif '" & Login & "','" & Passwd & "'"

	Set Con = Server.CreateObject("ADODB.Connection")	
	Con.Open Application("PC")
	
	Set rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3

	if(Rs.RecordCount = 1) Then
        Active = Rs("Active")
        If(IsTrue(Active)) Then
        	Session("IdAdmin") = Rs("IdAdmin")
    		Session("LoginAdmin")  = Rs("LoginAdmin")
        	Session("PasswdAdmin") = Rs("MPAdmin")
        	Session("Msg") = "Bienvenue sur l'espace d'administration, de la plateforme Ola Blanca."
			Session("PageTitle") = "Login/Logout"
        	Rs.Close()
    		Set Rs = Nothing
    		Con.Close()
    		Set Con = Nothing
        	Response.Redirect "Message.asp"
    	Else
    		Session("Msg") = "Votre compte n'est pas activé."
    	End If
    Elseif(Rs.RecordCount = 0) Then
		Session("Msg") = "Administrateur non trouvé, verifiez votre login et/ou votre mot de passe"
    Else
		Session("Msg") = "Plusieurs administrateurs ont le meme login !!!, prière de contactez le super administrateur."			
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

    Response.Redirect "Message.asp"
%>