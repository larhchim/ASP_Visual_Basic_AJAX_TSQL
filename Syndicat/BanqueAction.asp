<!--#INCLUDE FILE="../ParamRoot.asp"-->
<%
	Dim Login, Req, Rs, Con, msg
	
    Session("MsgTitle") = "Message (Connexion à l'espace Syndic)"

    TAnnee =  Replace(Request.Form("TAnnee"),"'","''")
    TMois =  Replace(Request.Form("TMois"),"'","''")
    TEntrees =  Replace(Request.Form("TEntrees"),"'","''")
    TSorties =  Replace(Request.Form("TSorties"),"'","''")

    '@Annee as INT,
	'@Mois as TINYINT,
	'@TotalEntrees as FLOAT,
	'@TotaSorties as FLOAT

	d=CDate(TDateDepense)
	TDateDepense1=FormatDateTime(d,2)

 

   

    Req = " ps_banque_add  "&TAnnee&","&TMois&","&TEntrees&","&TSorties&" "
 	Set Con = Server.CreateObject("ADODB.Connection")	
	Con.Open Application("PC")
	On Error Resume Next
	Set rs = Server.CreateObject("ADODB.RecordSet")

	Rs.Open Req, Con, 3, 3


	Con.CommitTrans
	if(Err.number <> 0) Then
    
			msg = "Operation s'est déroulée avec succées !!!!"
			Session("Msg") = msg
        	Rs.Close()
    		Set Rs = Nothing
    		Con.Close()
    		Set Con = Nothing
        	Response.Redirect "MessageSyndic.asp"
    
    Else
	    
		msg = "Opération echouée !!!!"
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