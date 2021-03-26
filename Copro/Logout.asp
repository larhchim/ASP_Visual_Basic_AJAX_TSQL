<%	
	Session("MsgTitle") = "Message (Deconnexion de l'espace des copropriétaires)"
	Session("IdCompte") = ""
	Session("LoginCompte") = ""
	Session("PasswdCompte") = ""
    Session("Msg") = "Vous êtes deconnecté de l'espace des copropriétaires"
	Response.Redirect "Message.asp"
%>