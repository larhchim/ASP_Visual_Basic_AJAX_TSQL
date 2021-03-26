<%	
	Session("MsgTitle") = "Message (Deconnexion de l'espace des copropriétaires)"
	Session("IdSyndic") = ""
	Session("LoginSyndic") = ""
	Session("PasswdSyndic") = ""
    Session("Msg") = "Vous êtes deconnecté de l'espace des Syndics"
	Response.Redirect "LoginSyndics.asp"
%>