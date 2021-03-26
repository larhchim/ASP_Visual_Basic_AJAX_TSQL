<%
If(Len(Session("IdCompte")) = 0) Then
	Session("Msg") = "Votre session est fermée, merci de vous identifier"
	Session("MsgTitle") = "message de connection"
	response.redirect "Message.asp"
End If
%>

<!--#INCLUDE FILE="ParamAdmin.asp"-->
<%
    Dim Req, Con, msg
    Dim OldPass, NewPass, Nom, Prenom, Email, Tel, Superf, NbrChbr, NbrSal, TypeCuis, TypeVue, Chemine, Captcha 
	
    Session("MsgTitle") = "Message (Gérer mon compte)"

    Ope = Request.Form("TOpe")
    OldPass = Replace(Request.Form("TOldPass"),"'","''")
    NewPass = Replace(Request.Form("TNewPass"),"'","''")
    Email = Trim(LCase(Replace(Request.Form("TEmail"),"'","''")))
    Tel = Trim(Replace(Request.Form("TTel"),"'","''"))

    On Error Resume Next
	Set Con = Server.CreateObject("ADODB.Connection")
	Con.Open Application("PC")

    If(Ope = "info") Then
        If((Len(Email) < 7) Or (Len(Tel) < 10))  Then
            Session("Msg") = "Prière de saisir correctement les informations demandées."
	        Con.Close()
	        Set Con = Nothing
            Response.Redirect "Message.asp"
        End If

        Req = "ps_compte_update_ematel " & Session("IdCompte") & ",'"  & Email & "','" & Tel & "'"
        Con.Execute Req
        Con.Close()
	    Set Con = Nothing
        Session("Msg") = "Vos informations sont mises à jour avec succès."
    ElseIf(Ope = "pass") Then
        If((Len(OldPass) < 7) Or (Len(NewPass) < 7)) Then
 	        Con.Close()
	        Set Con = Nothing 
            Session("Msg") = "Prière de saisir un mot de passe contenant au moins 8 caractères (alpha-numériques et symboles)."          
            Response.Redirect "Message.asp"
        End If
        if(Session("Passwd") = OldPass) Then
            Req = "ps_compte_update_pass " & Session("IdCompte") &  ", '" & NewPass & "'"
            Con.Execute Req
            Con.Close()
	        Set Con = Nothing
            Session("Msg") = "Votre mot de passe a été mis à jour avec succès."
            Session("Passwd") = NewPass
        Else
            Con.Close()
	        Set Con = Nothing
            Session("Msg") = "Votre ancien mot de passe est erroné.<br>SPW : " & Session("Passwd")  & "<br>OPW : " & OldPass
            Response.Redirect "Message.asp"           
        End If
    Else
        Session("Msg") = "Opération non prévue, prière de contacter l'administrateur du site web (fichier : MonCompteAction)."
        Response.Redirect "Message.asp"
    End If

    If (Err.number <> 0) Then
		msg = "Pour des raisons techniques, les modifications demandées n'ont pas eu lieu.<br>"
		msg = msg & "<br><br>Raison Technique : " & Err.Description & "<br>Req : " & Req
    	Session("Msg") = msg
	End If

    Response.Redirect "Message.asp"
%>