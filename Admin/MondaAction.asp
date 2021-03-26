<!--#INCLUDE FILE="../ParamRoot.asp"-->
<% 
   Dim Req, Rs, Con, msg
   Dim DateD, DateF, Rmq, Synd, quitus, active

   Function GetFormattedDate(date1)
    strDate = CDate(date1)
    strDay = DatePart("d", strDate)
    strMonth = DatePart("m", strDate)
    strYear = DatePart("yyyy", strDate)
    If strDay < 10 Then
      strDay = "0" & strDay
    End If
    If strMonth < 10 Then
      strMonth = "0" & strMonth
    End If
    GetFormattedDate = strDay&"/"&strMonth&"/"&strYear
  End Function

   DateD= Replace(Request.Form("DateD"),"'","''")
   DateF= Replace(Request.Form("DateF"),"'","''")
   Rmq= Replace(Request.Form("Remarques"),"'","''")
   quitus= Replace(Request.Form("Quitus"),"'","''")
   active= Replace(Request.Form("TActive"),"'","''")

  d=CDate(DateD)
  DateD1=GetFormattedDate(d)
  c=CDate(DateF)
  DateF1=GetFormattedDate(c)

   Req = "ps_mondat_add '" & DateD1 & "','" & DateF1 & "'"
   
   Set Con = Server.CreateObject("ADODB.Connection")	
   Con.Open Application("PC")
   On Error Resume Next

   Set rs = Server.CreateObject("ADODB.RecordSet")
   Rs.Open Req, Con, 3, 3

   if(Rs.RecordCount = 1) Then
       Session("Msg") = "Le Manda est bien crée"
    Else
       Session("Msg") = "Erreur de conection"			
   End If
   
    Rs.Close()
	Set Rs = Nothing
	Con.Close()
	Set Con = Nothing

    Response.Redirect "Message.asp"
%>