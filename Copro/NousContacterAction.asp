<%
	If(Len(Session("IdCompte")) = 0) Then
		Session("Msg") = "Votre session est fermée, merci de vous identifier"
		Session("MsgTitle") = "message de connection"
		response.redirect "Message.asp"
	End If
%>
<!--#INCLUDE FILE="ParamRoot.asp"-->
<%
	Dim Req, Rs, Con, msg
    Dim Nom, Prenom, Email, Tel, Message, Captcha, bodya, bodyb, bodyc, bodym 
	
    Session("MsgTitle") = "Message (Nous contacter)"

    Nom = FormatName(Replace(Request.Form("TNom"),"'","''"))
    Prenom = FormatName(Replace(Request.Form("TPrenom"),"'","''"))
    Email = LCase(Replace(Request.Form("TEmail"),"'","''"))
    Tel = Replace(Request.Form("TTel"),"'","''")
    Message = Replace(Request.Form("TMsg"),"'","''")
    Captcha = UCASE(Request.Form("TCaptcha"))

    If((Len(Nom) < 2) Or (Len(Prenom) < 2) Or (Len(Email) < 7) Or (Len(Tel) < 10) Or (Len(Message) < 10)) Then
        Session("Msg") = "Prière de saisir correctement les informations demandées"
        Response.Redirect "Message.asp"
    End If

    If(Session("Captcha") <> Captcha) Then
        Session("Msg") = "Prière de saisir correctement le code de securité de votre formulaire"
        Response.Redirect "Message.asp"
    End If

    bodya = "<HTML lang=fr><HEAD><TITLE>Envoi Automatique de Courrier : Ola-Blanca</TITLE>"
	bodya = bodya & "</HEAD><BODY bgcolor=white>"
	
	bodyb = "<Table align=center cellspacing=3 cellpadding=5 width=606 style=""FONT-SIZE: 10pt;COLOR: darkgray;FONT-FAMILY: Tahoma"">"
			
	bodyb = bodyb & "<tr><td foreground align=center valign=center colspan=2 style=""border: 1px solid #D2D2D2""><b>Votre message</b></td></tr>"

	bodyb = bodyb & "<tr><td align=left valign=center  style=""border: 1px solid #D2D2D2"">&nbsp;Nom</td>"
	bodyb = bodyb & "<td align=left valign=center  style=""padding-left:10px;border: 1px solid #D2D2D2"">" & Nom & "</td></tr>"	

	bodyb = bodyb & "<tr><td align=left valign=center  style=""border: 1px solid #D2D2D2"">&nbsp;Pr&#233;nom</td>"
	bodyb = bodyb & "<td align=left valign=center  style=""padding-left:10px;border: 1px solid #D2D2D2"">" & Prenom & "</td></tr>"	
			
	bodyb = bodyb & "<tr><td align=left valign=center style=""border: 1px solid #D2D2D2"">&nbsp;Email</td>"
	bodyb = bodyb & "<td align=left valign=center style=""padding-left:10px;border: 1px solid #D2D2D2"">" & Email & "</td></tr>"

	bodyb = bodyb & "<tr><td align=left valign=center style=""border: 1px solid #D2D2D2"">&nbsp;T&#233;l&#233;phone</td>"
	bodyb = bodyb & "<td align=left valign=center style=""padding-left:10px;border: 1px solid #D2D2D2"">" & Tel & "</td></tr>"

	bodyb = bodyb & "<tr><td align=left valign=center style=""border: 1px solid #D2D2D2"">&nbsp;Message</td>"
	bodyb = bodyb & "<td align=left valign=center style=""padding-left:10px;border: 1px solid #D2D2D2"">" & Message & "</td></tr>"

	bodyb = bodyb & "</Table>"

	bodyc = "</BODY></HTML><BR><BR>"
	
	bodym = bodya & bodyb & bodyc
	
	Set Mail = Server.CreateObject("Persits.MailSender")
	Mail.Host	= MailHost
	Mail.From	= MailFrom
	Mail.FromName	= MailFromName
	Mail.Subject	= "Votre message sur le site des copropriétaires d'Ola Blanca : "  & DateFormate(date())
	Mail.Body	= bodym
	Mail.IsHTML	= True
	Mail.username	= MailFrom
	Mail.password	= MailPass
	Mail.AddAddress Email, Email
	'Bcc = "contact@ola-blanca.ma"
	'Mail.AddBcc	Bcc, Bcc
			
	On Error Resume Next
	Mail.Send
	
	If Err.number <> 0 Then
		msg = "Pour des raisons techniques, l'envoi de votre message n'a pas eu lieu."
		msg = msg & "<br><br>Raison Technique : Email non valide - " & Err.Description
	    Session("msg") = msg
    Else
		msg = "<br><center>Nous venons de recevoir votre message.<br><br>"
        msg = msg & "Nous ne manquerons pas d'y donner suite dans les meilleurs délais.</center><br>"
	    Session("msg") = msg & bodyb
    End If
	
	Response.Redirect "Message.asp"
%>