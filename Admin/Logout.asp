<%	
    Session("IdAdmin") = ""
    Session("LoginAdmin")  = ""
    Session("PasswdAdmin") = ""
	Session("MsgTitle") = "Message (Deconnexion de l'espace d'administration)"
    Session("Msg") = "Vous êtes deconnecté de l'espace d'administration"
	Response.Redirect "Message.asp"
%>
