<%
if(Instr(Session("PageTitle"), "Accueil")) Then
    li1 = "active"
    li2 = ""
    li3 = ""
    li4 = ""
    li5 = "" 
Elseif(Instr(Session("PageTitle"), "Règlement intérieur")) Then
    li1 = ""
    li2 = "active"
    li3 = ""
    li4 = ""
    li5 = "" 
Elseif(Instr(Session("PageTitle"), "VAL")) Then
    li1 = ""
    li2 = ""
    li3 = "active"
    li4 = ""
    li5 = "" 
Elseif(Session("PageTitle") = "Espace Copropriétaires") Then
    li1 = ""
    li2 = ""
    li3 = ""
    li4 = "active"
    li5 = ""
Elseif(Session("PageTitle") = "Nous Contacter") Then
    li1 = ""
    li2 = ""
    li3 = ""
    li4 = ""
    li5 = "active" 
Else
    li1 = ""
    li2 = ""
    li3 = ""
    li4 = ""
    li5 = ""
End If
%>
<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Olablanca Site des compropriétaires</title>
    <link href="CSS/bootstrap.min.css" rel="stylesheet">
    <link href="CSS/navbar.css" rel="stylesheet">
    <script src="JS/jquery-3.5.1.slim.min.js"></script>
    <script src="JS/bootstrap.bundle.min.js"></script>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
            <ul class="navbar-nav"><li class="nav-item <%=li1%>" style="padding-right:30px;"><a class="nav-link" href="Default.asp">Accueil</a></li>
                <li class="nav-item <%=li2%>" style="padding-right:30px;"><a class="nav-link" href="ReglementInterieur.asp">Règlement intérieur</a></li>
                <li class="nav-item dropdown <%=li3%>" style="padding-right:30px;">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ventes/Achats/Locations&nbsp;&nbsp;&nbsp;</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown08">
                        <a class="dropdown-item" href="OffresVente.asp">Offres de vente</a>
                        <a class="dropdown-item" href="OffresLocation.asp">Offres de location</a>
                        <a class="dropdown-item" href="DemandesAchat.asp">Demandes d'achat</a>
                        <a class="dropdown-item" href="DemandesLocation.asp">Demandes de location</a>
                    </div>
                </li>
                <li class="nav-item dropdown <%=li4%>"  style="padding-right:30px;">
                    <a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Espace Copropriétaires&nbsp;&nbsp;&nbsp;</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown09">
                        <a class="dropdown-item" href="CompteForm.asp">Activer mon compte</a>
                        <a class="dropdown-item" href="PassForm.asp">Mot de passe oublié</a> 
                        <a class="dropdown-item" href="LoginForm.asp">Se connecter à mon compte</a>
                    </div>
                </li>
                <li class="nav-item <%=li5%>"><a class="nav-link" href="NousContacter.asp">Nous Contacter</a></li>
                <!--<li class="nav-item" style="padding-right:50px;"><a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a></li>-->
              
            </ul>
        </div>
    </nav>
    <div style="height:70px;"></div>
  </body>
</html>
