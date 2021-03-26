<!--#INCLUDE FILE="../ParamRoot.asp"-->
<%
	Dim Login, Req, Rs, Con, msg
	
    Session("MsgTitle") = "Message (Connexion à l'espace Syndic)"

    Annee = Replace(Request.Form("TAnnee"),"'","''")
    TypeCotisations = Replace(Request.Form("TTypeCotisation"),"'","''")
    BudgetAnnuel = Replace(Request.Form("TBudgetAnnuel"),"'","''")


    Req = "ps_budget_add "&Annee&",'"&TypeCotisations&"',"&BudgetAnnuel
 	Set Con = Server.CreateObject("ADODB.Connection")	
	Con.Open Application("PC")
	On Error Resume Next
	Set rs = Server.CreateObject("ADODB.RecordSet")

	rs.Open Req, Con, 3, 3

	Con.CommitTrans
	if(Err.number <> 0) Then
        
		if(Rs("id")=1) Then
			msg = "Budget Ajoutée !!!!"
			Session("Msg") = msg
        	Rs.Close()
    		Set Rs = Nothing
    		Con.Close()
    		Set Con = Nothing
        	Response.Redirect "MessageSyndic.asp"
		End if
    
    Else
	    
		msg = "Budget non Ajoutée !!!!"
		Session("Msg") = msg

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