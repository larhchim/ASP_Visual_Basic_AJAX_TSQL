<!--#INCLUDE FILE="ParamRoot.asp"-->
<%
	Dim Req, Rs, Con, msg
    Dim Log, Pass, Nom, Prenom, Email, Tel, Superf, NbrChbr, NbrSal, TypeCuis, TypeVue, Chemine, Captcha 
	
    Session("MsgTitle") = "Message (Activer mon compte)"

	Log = Replace(Request.Form("TLog"),"'","''")
    Pass = Replace(Request.Form("TPass"),"'","''")
    Nom = FormatName(Replace(Request.Form("TNom"),"'","''"))
    Prenom = FormatName(Replace(Request.Form("TPrenom"),"'","''"))
    Email = LCase(Replace(Request.Form("TEmail"),"'","''"))
    Tel = Replace(Request.Form("TTel"),"'","''")

    Captcha = UCASE(Request.Form("TCaptcha"))

    If((Len(Log) < 4) Or (Len(Pass) < 7) Or (Len(Nom) < 2) Or (Len(Prenom) < 2) Or (Len(Email) < 7) Or (Len(Tel) < 10)) Then
        Session("Msg") = "Prière de saisir correctement les informations demandées"
        Response.Redirect "Message.asp"
    End If

    If(Session("Captcha") <> Captcha) Then
        Session("Msg") = "Prière de saisir correctement le code de securité de votre formulaire"
        Response.Redirect "Message.asp"
    End If

	Req = "ps_compte_verif '" & Log & "','" & Pass & "'"
 
	Set Con = Server.CreateObject("ADODB.Connection")	
	Con.Open Application("PC")
	On Error Resume Next

	Set rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Req, Con, 3, 3

	if(Rs.RecordCount = 1) Then
        IdCompte = Rs("IdCompte")
        Active = Rs("Active")
        If(IsTrue(Active)) Then
		    Session("Msg") = "Votre compte est déjà activé.<br><br> Prière de vous connecter à l'espace copropriétaire avec votre login et votre mot de passe."	
        Else
            Req = "ps_compte_activate " & IdCompte & ",'" & Nom & "','" & Prenom & "','" & Email & "','" & Tel & "'" 
            Con.Execute Req
            Session("Msg") = "Votre compte vient d'être activé.<br><br>Vous pouvez à présent vous connecter à l'espace copropriétaire."
        End If
    Elseif(Rs.RecordCount = 0) Then
		Session("Msg") = "Copropriétaire non trouvé, verifiez votre login et/ou votre mot de passe"
	Else
		Session("Msg") = "Plusieurs copropriétaires ont le meme login !!!, prière de contactez l'administrateur"			
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