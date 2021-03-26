<!--#INCLUDE FILE="ParamRoot.asp"-->
<%
	Dim Login, Req, Rs, Con, msg
	
    Session("MsgTitle") = "Message (Mot de passe oublié)"

	Login = Replace(Request.Form("TLog_in"),"'","''")
	Req = "ps_compte_select_by_login '" & Login & "'"
 
	Set Con = Server.CreateObject("ADODB.Connection")	
	Con.Open Application("PC")
	On Error Resume Next

	Set rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3

	if(Rs.RecordCount = 1) Then
        Ola = Rs("Ola")
		Nom = Rs("Nom")
		Prenom = Rs("Prenom")
		Login =  Rs("Login")
		Email =  Rs("Email")
		Pass = Rs("MP")
		Tel =  Rs("Tel")
	Elseif(Rs.RecordCount = 0) Then
		Rs.Close()
		Set Rs = Nothing
		Con.Close()
		Set Con = Nothing
		Session("Msg") = "Copropriétaire non trouvé, verifiez votre login"
		Response.Redirect "Message.asp"
	Else
		Rs.Close()
		Set Rs = Nothing
		Con.Close()
		Set Con = Nothing
		Session("Msg") = "Plusieurs copropriétaires ont le meme login !!!, prière de contactez l'administrateur"
		Response.Redirect "Message.asp"		
	End If
	
	Rs.Close()
	Set Rs = Nothing
	Con.Close()
	Set Con = Nothing

	bodya = "<HTML lang=fr><HEAD><TITLE>Envoi Automatique de Courrier : Ola-Blanca</TITLE><meta charset=""UTF-8""><meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8"">"
	bodya = bodya & "<meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8"" /></HEAD><BODY bgcolor=""white"">" 
	
	bodya = bodya & "<Table align=center cellspacing=3 cellpadding=5 width=606 style=""FONT-SIZE: 10pt;COLOR: darkgray;FONT-FAMILY: Tahoma"">"
			
	bodya = bodya & "<tr><td foreground align=center valign=center colspan=2 style=""border: 1px solid #D2D2D2""><b>Param&egrave;tres de Votre Compte</b></td></tr>"

	bodya = bodya & "<tr><td align=left valign=center  style=""border: 1px solid #D2D2D2"">&nbsp;Nom</td>"
	bodya = bodya & "<td align=left valign=center  style=""border: 1px solid #D2D2D2"">&nbsp;" & Nom & "</td></tr>"	

	bodya = bodya & "<tr><td align=left valign=center  style=""border: 1px solid #D2D2D2"">&nbsp;Pr&#233;nom</td>"
	bodya = bodya & "<td align=left valign=center  style=""border: 1px solid #D2D2D2"">&nbsp;" & Prenom & "</td></tr>"	

	bodya = bodya & "<tr><td align=left valign=center style=""border: 1px solid #D2D2D2"">&nbsp;Login</td>"
	bodya = bodya & "<td align=left valign=center style=""border: 1px solid #D2D2D2"">&nbsp;" & Login & "</td></tr>"
	
	bodya = bodya & "<tr><td align=left valign=center style=""border: 1px solid #D2D2D2"">&nbsp;Mot de passe</td>"
	bodya = bodya & "<td align=left valign=center style=""border: 1px solid #D2D2D2"">&nbsp;" & Pass& "</td></tr>"
		
	bodya = bodya & "<tr><td align=left valign=center style=""border: 1px solid #D2D2D2"">&nbsp;Email</td>"
	bodya = bodya & "<td align=left valign=center style=""border: 1px solid #D2D2D2"">&nbsp;" & Email & "</td></tr>"

	bodya = bodya & "<tr><td align=left valign=center style=""border: 1px solid #D2D2D2"">&nbsp;T&#233;l&#233;phone</td>"
	bodya = bodya & "<td align=left valign=center style=""border: 1px solid #D2D2D2"">&nbsp;" & Tel & "</td></tr>"

	bodya = bodya & "<tr><td align=left valign=center style=""border: 1px solid #D2D2D2;color:red"">&nbsp;<b>Message</b></td>"
	bodya = bodya & "<td align=left valign=center style=""border: 1px solid #D2D2D2;color:red"">&nbsp;<b>Pour des raisons de sécurité, merci de supprimer ce message de votre</b><br>&nbsp;<b>boite mail.</b></td></tr>"

	bodyb = bodyb & "</Table>"

	bodyb = bodyb & "</BODY></HTML><BR><BR>"
	
	bodym = bodya & bodyb
	
	Set Mail = Server.CreateObject("Persits.MailSender")
	Mail.Host	= MailHost
	Mail.From	= MailFrom
	Mail.FromName	= MailFromName
	Mail.Subject	= "Mot de passe : Ola Blanca" 
	Mail.Body	= bodym
	Mail.IsHTML	= True
	Mail.username	= MailFrom
	Mail.password	= MailPass
	Mail.AddAddress Email, Email
		
	On Error Resume Next
	Mail.Send
	
	If Err.number <> 0 Then
		msg = "Pour des raisons techniques, l'envoi de votre mot de passe n'a pas eu lieu."
		msg = msg & "<br><br>Raison Technique : Email non valide - " & Err.Description
	Else
		msg = "Votre mot de passe vient de vous être envoyé par mail"
	End If
		
	Session("msg") = msg
	Response.Redirect "Message.asp"
%>