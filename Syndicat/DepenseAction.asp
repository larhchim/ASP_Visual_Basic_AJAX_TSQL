<!--#INCLUDE FILE="../ParamRoot.asp"-->
<%
	Dim Login, Req, Rs, Con, msg
	
    Session("MsgTitle") = "Message (Connexion à l'espace Syndic)"


    TAnnee = Replace(Request.Form("TAnnee"),"'","''")
    TMontant = Replace(Request.Form("TMontant"),"'","''")
    TDateDepense = Replace(Request.Form("TDateDepense"),"'","''")
    TMotif = Replace(Request.Form("TMotif"),"'","''")
    TBeneficiaire = Replace(Request.Form("TBeneficiaire"),"'","''")
    TNatureReglement = Replace(Request.Form("TNatureReglement"),"'","''")
    TReferenceReglement = Replace(Request.Form("TReferenceReglement"),"'","''")
    TJustif = Replace(Request.Form("TJustif"),"'","''") 

    '@Annee as INT,
	'@Montant as FLOAT,
	'@DateDepense as SMALLDATETIME,
	'@Motif as NVARCHAR(50),
	'@Beneficiaire as NVARCHAR(50),
	'@NatureReglement as NVARCHAR(50),
	'@ReferenceReglement as NVARCHAR(30),
	'@Justif as BIT

	d=CDate(TDateDepense)
	TDateDepense1=FormatDateTime(d,2)

 
   

    Req = "INSERT INTO TDEPENSES (Annee , Montant , DateDepense , Motif , Beneficiaire , NatureReglement , ReferenceReglement ,Justif ) VALUES ("&TAnnee&" , "&TMontant&" , '"&TDateDepense1&"' , '"&TMotif&"' , '"&TBeneficiaire&"' , '"&TNatureReglement&"' , '"&TReferenceReglement&"' , "&TJustif&" )"
 	Set Con = Server.CreateObject("ADODB.Connection")	
	Con.Open Application("PC")
	On Error Resume Next
	Set rs = Server.CreateObject("ADODB.RecordSet")

	Rs.Open Req, Con, 3, 3

	Con.CommitTrans
	if(Rs.RecordCount =1) Then
    
			msg = "Dépense Ajoutée !!!!"
			Session("Msg") = msg
        	Rs.Close()
    		Set Rs = Nothing
    		Con.Close()
    		Set Con = Nothing
        	Response.Redirect "MessageSyndic.asp"
    
    Else
	    
		msg = "Dépense non Ajoutée !!!!"
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