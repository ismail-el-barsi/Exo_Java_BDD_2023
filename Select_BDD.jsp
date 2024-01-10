<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MariaDB avec JSP</h1>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "mysql";
    String password = "mysql";

    // Charger le pilote JDBC (pilote disponible dans WEB-INF/lib)
    Class.forName("org.mariadb.jdbc.Driver");

    // Établir la connexion
    Connection conn = DriverManager.getConnection(url, user, password);

    // Exemple de requête SQL
    String sql = "SELECT idFilm, titre, année FROM Film WHERE année >= 2000";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

    // Afficher les résultats (à adapter selon vos besoins)
    while (rs.next()) {
        String colonne1 = rs.getString("idFilm");
        String colonne2 = rs.getString("titre");
        String colonne3 = rs.getString("année");
        // Faites ce que vous voulez avec les données...
        //Exemple d'affichage de 2 colonnes
        out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
    }

    // Ne fermez pas la connexion ici, car elle sera utilisée pour les exercices suivants

    %>

    <h2>Exercice 1 : Les films entre 2000 et 2015</h2>
    <%
    String sqlExercice1 = "SELECT idFilm, titre, année FROM Film WHERE année >= 2000 AND année < 2015";
    PreparedStatement pstmtExercice1 = conn.prepareStatement(sqlExercice1);
    ResultSet rsExercice1 = pstmtExercice1.executeQuery();

    while (rsExercice1.next()) {
        String colonne1 = rsExercice1.getString("idFilm");
        String colonne2 = rsExercice1.getString("titre");
        String colonne3 = rsExercice1.getString("année");
        out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
    }

    rsExercice1.close();
    pstmtExercice1.close();
    %>

    <h2>Exercice 2 : Année de recherche</h2>
<form action="#" method="post">
    <label for="inputAnnee">Saisir l'année de recherche : </label>
    <input type="text" id="inputAnnee" name="annee">
    <input type="submit" value="Rechercher">
</form>

<%
String anneeRecherche = request.getParameter("annee");

if (anneeRecherche != null && !anneeRecherche.isEmpty()) {
    String sqlExercice2 = "SELECT idFilm, titre, année FROM Film WHERE année = ?";
    PreparedStatement pstmtExercice2 = conn.prepareStatement(sqlExercice2);
    pstmtExercice2.setString(1, anneeRecherche);
    ResultSet rsExercice2 = pstmtExercice2.executeQuery();

    while (rsExercice2.next()) {
        String colonne1 = rsExercice2.getString("idFilm");
        String colonne2 = rsExercice2.getString("titre");
        String colonne3 = rsExercice2.getString("année");
        out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
    }

    rsExercice2.close();
    pstmtExercice2.close();
}
%>

<h2>Exercice 3 : Modification du titre du film</h2>
<form action="#" method="post">
    <label for="inputIdFilm">ID du film à modifier : </label>
    <input type="text" id="inputIdFilm" name="idFilm">
    <br>
    <label for="inputNouveauTitre">Nouveau titre : </label>
    <input type="text" id="inputNouveauTitre" name="nouveauTitre">
    <br>
    <input type="submit" value="Modifier Titre">
</form>

<%
String idFilmAModifier = request.getParameter("idFilm");
String nouveauTitre = request.getParameter("nouveauTitre");

if (idFilmAModifier != null && !idFilmAModifier.isEmpty() && nouveauTitre != null) {
    String sqlExercice3 = "UPDATE Film SET titre = ? WHERE idFilm = ?";
    PreparedStatement pstmtExercice3 = conn.prepareStatement(sqlExercice3);
    pstmtExercice3.setString(1, nouveauTitre);
    pstmtExercice3.setString(2, idFilmAModifier);
    int rowsUpdated = pstmtExercice3.executeUpdate();

    if (rowsUpdated > 0) {
        out.println("Le titre du film a été modifié avec succès.");
    } else {
        out.println("Aucun film trouvé avec l'ID spécifié.");
    }

    pstmtExercice3.close();
}
%>

<h2>Exercice 4 : La valeur maximum</h2>
<form action="#" method="post">
    <label for="inputTitre">Titre du film : </label>
    <input type="text" id="inputTitre" name="titre">
    <br>
    <label for="inputAnneeFilm">Année du film : </label>
    <input type="text" id="inputAnneeFilm" name="anneeFilm">
    <br>
    <input type="submit" value="Ajouter Film">
</form>

<%
String titreFilm = request.getParameter("titre");
String anneeFilm = request.getParameter("anneeFilm");

if (titreFilm != null && anneeFilm != null) {
    String sqlExercice4 = "INSERT INTO Film (titre, année) VALUES (?, ?)";
    PreparedStatement pstmtExercice4 = conn.prepareStatement(sqlExercice4);
    pstmtExercice4.setString(1, titreFilm);
    pstmtExercice4.setString(2, anneeFilm);
    int rowsInserted = pstmtExercice4.executeUpdate();

    if (rowsInserted > 0) {
        out.println("Le film a été ajouté avec succès.");
    } else {
        out.println("Erreur lors de l'ajout du film.");
    }

    pstmtExercice4.close();
}
%>

<%
// Fermer la connexion à la fin de la page
conn.close();
%>

</body>
</html>