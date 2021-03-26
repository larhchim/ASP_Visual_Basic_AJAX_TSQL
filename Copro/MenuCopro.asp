<%
if(Instr(Session("PageTitle"), "Gestion")) Then
    li1 = "active"
    li2 = ""
    li3 = ""
    li4 = ""
    li5 = "" 
    li6 = "" 
Elseif(Instr(Session("PageTitle"), "Documents")) Then
    li1 = ""
    li2 = "active"
    li3 = ""
    li4 = ""
    li5 = "" 
    li6 = "" 
Elseif(Instr(Session("PageTitle"), "Forum")) Then
    li1 = ""
    li2 = ""
    li3 = "active"
    li4 = ""
    li5 = "" 
    li6 = "" 
Elseif(Session("PageTitle") = "Actualité") Then
    li1 = ""
    li2 = ""
    li3 = ""
    li4 = "active"
    li5 = ""
    li6 = "" 
Elseif(Session("PageTitle") = "Nous Contacter") Then
    li1 = ""
    li2 = ""
    li3 = ""
    li4 = ""
    li5 = "active" 
    li6 = "" 
    Elseif(Session("PageTitle") = "Syndic") Then
    li1 = ""
    li2 = ""
    li3 = ""
    li4 = ""
    li5 = "" 
    li6 = "active" 
Else
    li1 = ""
    li2 = ""
    li3 = ""
    li4 = ""
    li5 = ""
    li6 = "" 
End If

If(Len(Session("IdCompte")) = 0) Then
    Session("Msg") = "Votre session est fermée, merci de vous identifier"
    Session("MsgTitle") = "message de connection"
    'response.redirect "Message.asp"
Else

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
                    <li class="nav-item dropdown <%=li1%>"  style="padding-right:30px;">
                        <a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gérer mon compte&nbsp;&nbsp;&nbsp;</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown09">
                            <a class="dropdown-item" href="GestionProfilForm.asp" alt="Gérer mon compte" title="Gérer mon compte">Gérer mon profil</a>
                            <a class="dropdown-item" href="GestionAnnoncesForm.asp" alt="Gérer mes annonces" title="Gérer mes annonces">Gérer mes annonces</a>
                             <a class="dropdown-item" href="Logout.asp">Se déconnecter</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown <%=li2%>" style="padding-right:30px;">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Documents Administratifs&nbsp;&nbsp;&nbsp;</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown08">
                            <a class="dropdown-item" href="DocPlans.asp">Les plans</a>
                            <a class="dropdown-item" href="DocAssemblees.asp">Les assemblées</a>
                            <a class="dropdown-item" href="DocReglementInterieur.asp">Le règlement intérieur</a>
                            <a class="dropdown-item" href="DocArticlesLoi.asp">Les articles de la loi 18</a>
                            <a class="dropdown-item" href="DocReglementCopropriete.asp">Le règlement de la copropriété</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown <%=li3%>" style="padding-right:30px;">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Forums&nbsp;&nbsp;&nbsp;</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown08">
                            <a class="dropdown-item" href="ForumSport.asp">Forum sport</a>
                            <a class="dropdown-item" href="ForumAffaires.asp">Forum des affaires</a>
                            <a class="dropdown-item" href="ForumDiscussion.asp">Forum de discussion</a>
                            <a class="dropdown-item" href="ForumSendages.asp">Forum des sendages</a>
                            <a class="dropdown-item" href="ForumQuestionsReponses.asp">Forum questions-réponses</a>
                        </div>
                    </li>
                    <!------Ismail------->

                      <li class="nav-item dropdown <%=li6%>"  style="padding-right:30px;">
                        <a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Syndicat&nbsp;&nbsp;&nbsp;</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown09">
                            <a class="dropdown-item" href="GestionCotisations.asp" alt="Gérer mon compte" title="Gestion Cotisations">Visualiser Cotisations</a>
                            <a class="dropdown-item" href="GestionDepense.asp" alt="Gérer mes annonces" title="Gestion depenses">Visualiser depenses</a>
                             <a class="dropdown-item" href="GestionBanque.asp" title="Gestion banque">Visualiser banque</a>
                            <a class="dropdown-item" href="GestionBudget.asp" title="Gestion budget annuel">Visualiser budget Annuel</a>
                            <a class="dropdown-item" href="AfficherMondatAll.asp" title="Gestion Mandat">Visualiser Mandat</a>
                        </div>
                        
                       </li>

                    <!------Ismail------->
                    <li class="nav-item <%=li4%>" style="padding-right:30px;"><a class="nav-link" href="ActualiteForm.asp">Actualité</a></li>
                    <li class="nav-item <%=li5%>"><a class="nav-link" href="NousContacter.asp">Nous Contacter</a></li>
                    <!--<li class="nav-item" style="padding-right:50px;"><a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a></li>-->
                   
                </ul>
            </div>
        </nav>
        <div style="height:70px;"></div>
    </body>
</html>