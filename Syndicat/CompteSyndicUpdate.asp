<!--#INCLUDE FILE="../ParamRoot.asp"-->
<% 
   Dim Req, Rs, Con, msg
   
   Ttype= Replace(Request.Form("Ttype"),"'","''")
   Tdesignation= Replace(Request.Form("Tdesignation"),"'","''")
   Ttelephone= Replace(Request.Form("Ttelephone"),"'","''")
   Temail= Replace(Request.Form("Temail"),"'","''")
   Tpassword= Replace(Request.Form("Tpassword"),"'","''")




  


   Req = "ps_syndic_update '" & Ttype & "','" & Tdesignation & "','" & Ttelephone & "','" & Temail & "','" & Tpassword & "'"
   


   Set Con = Server.CreateObject("ADODB.Connection")	
   Con.Open Application("PC")
   On Error Resume Next

   Set rs = Server.CreateObject("ADODB.RecordSet")
   Rs.Open Req, Con, 3, 3

    Session("LoginSyndic") = Temail
    Session("PasswdSyndic") = Tpassword
    Session("Designation") = Tdesignation
    Session("Type") = Ttype
    Session("Tel") = Ttelephone

   if(Rs.RecordCount = 1) Then
       Session("Msg") = "Les informations sont bien Modifiées!!!!"
    Else
       Session("Msg") = "Erreur veuillez reessayer!!!!!"			
   End If
   
    Rs.Close()
	Set Rs = Nothing
	Con.Close()
	Set Con = Nothing

    Response.Redirect "MessageSyndic.asp"
%>