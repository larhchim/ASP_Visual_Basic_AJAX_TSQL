<%
If (Len(Session("IdSyndic")) > 0) Then

    if(Instr(Session("PageTitle"), "Cotisation")) Then
        li1 = "active"
        li2 = ""
        li3 = ""
        li4 = ""
    Elseif(Instr(Session("PageTitle"), "Depense")) Then
        li1 = ""
        li2 = "active"
        li3 = ""
        li4 = ""
    Elseif(Instr(Session("PageTitle"), "Banque")) Then
        li1 = ""
        li2 = ""
        li3 = "active"
        li4 = ""
    Elseif(Instr(Session("PageTitle"), "Budget")) Then
        li1 = ""
        li2 = ""
        li3 = ""
        li4 = "active"
    Else
        li1 = ""
        li2 = ""
        li3 = ""
        li4 = ""
      
    End If



%>

<!doctype html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Olablanca Site des compropriétaires</title>
        <link href="../CSS/bootstrap.min.css" rel="stylesheet">
        <link href="../CSS/navbar.css" rel="stylesheet">
        <script src="../JS/jquery-3.5.1.slim.min.js"></script>
        <script src="../JS/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown "  style="padding-right:30px;">
                        <a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gérer mon compte&nbsp;&nbsp;&nbsp;</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown09">
                             <a class="dropdown-item" href="profileSyndic.asp">Mon Compte</a>
                             <a class="dropdown-item" href="Logout.asp">Se déconnecter</a>
                             

                        </div>
                    </li>

                     <li class="nav-item dropdown <%=li1%>"  style="padding-right:30px;">
                        <a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Syndicat&nbsp;&nbsp;&nbsp;</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown09">
                        <a  class="dropdown-item" href="AjoutCotisations.asp">Ajouter Cotisations</a>
                        <a  class="dropdown-item" href="GestionCotisations.asp">Visualiser Cotisations</a>
                        <a  class="dropdown-item" href="AjoutDepense.asp">Ajouter depenses</a>
                        <a  class="dropdown-item" href="GestionDepense.asp">Visualiser depenses</a>
                        <a  class="dropdown-item" href="AjouterBanque.asp">Ajouter banque</a>
                        <a  class="dropdown-item" href="GestionBanque.asp">Visualiser banque</a>
                        <a  class="dropdown-item" href="Ajouterbudgetannuel.asp">Ajouter budget</a>
                        <a  class="dropdown-item" href="GestionBudget.asp">Visualiser budget</a>
                        <a  class="dropdown-item" href="AjouterRIB.asp">Ajouter RIB</a>
                        </div>
                    </li>



                   
                    <!--<li class="nav-item" style="padding-right:50px;"><a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a></li>-->
                </ul>
            </div>
        </nav>
        <div style="height:70px;"></div>
    </body>
</html>

<%End If%>