<%
    Response.CodePage = 65001 
	Response.CharSet = "UTF-8" 
    Response.write "Message : " & Request.Form("Nom") & "  " & Request.Form("Prenom")
    
%>