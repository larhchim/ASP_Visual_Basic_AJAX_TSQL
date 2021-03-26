<%
'If (Len(Session("IdAdmin")) > 0) Then
if(true) Then
    if(Instr(Session("PageTitle"), "Gestion des Modules")) Then
        li1 = "active"
        li2 = ""
        li3 = ""
    Elseif(Instr(Session("PageTitle"), "Gestion des Offres")) Then
        li1 = ""
        li2 = "active"
        li3 = ""
    Elseif(Instr(Session("PageTitle"), "Login/Logout")) Then
        li1 = ""
        li2 = ""
        li3 = "active"
    Else
        li1 = ""
        li2 = ""
        li3 = ""
    End If
%>

<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Olablanca Site des compropriétaires</title>
    <link href="../CSS/bootstrap.min.css" 	rel="stylesheet"  type="text/css">
    <link href="../CSS/navbar.css" 			rel="stylesheet"  type="text/css">
    <script src="../JS/jquery-3.5.1.slim.min.js"></script>
    <script src="../JS/bootstrap.bundle.min.js"></script>
  </head>
  <body>
 
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
    <ul class="navbar-nav">
      <li class="nav-item dropdown <%=li1%>"  style="padding-right:30px;">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown09" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gestion des Modules</a>
        <div class="dropdown-menu" aria-labelledby="dropdown09">
          <a class="dropdown-item" href="GestionAppartements.asp">Gestion des Appartements</a>
          <a class="dropdown-item" href="GestionComptes.asp">Gestion des Comptes</a>
          <a class="dropdown-item" href="GestionSendages.asp">Gestion des Sendages</a>
          <a class="dropdown-item" href="GestionVotes.asp">Gestion des Votes</a>
          <a class="dropdown-item" href="GestionDocumentation.asp">Gestion des Documents</a>
          <a class="dropdown-item" href="GestionReclamationsn.asp">Gestion des Réclamations</a>
        </div>
      </li>
      <li class="nav-item dropdown <%=li2%>" style="padding-right:30px;">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gestion des Offres</a>
        <div class="dropdown-menu" aria-labelledby="dropdown08">
          <a class="dropdown-item" href="GestionOffresVente.asp">Gestion des Offres de Vente</a>
          <a class="dropdown-item" href="GestionOffresLocation.asp">Gestion des Offres de Location</a>
          <a class="dropdown-item" href="GestionDemandesAchat.asp">Gestion des Demandes d'Achat</a>
          <a class="dropdown-item" href="GestionDemandesLocation.asp">Gestion des Demandes de Location</a>
        </div>
      </li>
       <li class="nav-item dropdown <%=li3%>" style="padding-right:30px;">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Login/Logout</a>
        <div class="dropdown-menu" aria-labelledby="dropdown08">
          <a class="dropdown-item" href="LoginForm.asp">Se Connecter</a>
          <a class="dropdown-item" href="Logout.asp">Se Déconnecter</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
<div style="height:70px;"></div>
</html>
<%End If%>
