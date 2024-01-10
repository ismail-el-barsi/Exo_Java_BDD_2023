<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="java.sql.*" %>

<html>
  <head>
    <meta charset="UTF-8" />
    <title>Connexion à MariaDB via JSP</title>
  </head>
  <body>
    <h1>Exemple de connexion à MariaDB avec JSP</h1>
    <% String url = "jdbc:mariadb://localhost:3306/films"; String user =
    "mysql"; String password = "mysql"; // Charger le pilote JDBC (pilote
    disponible dans WEB-INF/lib) Class.forName("org.mariadb.jdbc.Driver"); //
    Établir la connexion Connection conn = DriverManager.getConnection(url,
    user, password); // Exercice 1 : Les films entre 2000 et 2015 String
    sqlExercice1 = "SELECT idFilm, titre, année FROM Film WHERE année BETWEEN
    2000 AND 2015"; PreparedStatement pstmtExercice1 =
    conn.prepareStatement(sqlExercice1); ResultSet rsExercice1 =
    pstmtExercice1.executeQuery(); // Afficher les résultats (à adapter selon
    vos besoins) out.println("
    <h2>Résultats de l'Exercice 1 : Les films entre 2000 et 2015</h2>
    "); while (rsExercice1.next()) { String colonne1 =
    rsExercice1.getString("idFilm"); String colonne2 =
    rsExercice1.getString("titre"); String colonne3 =
    rsExercice1.getString("année"); out.println("id : " + colonne1 + ", titre :
    " + colonne2 + ", année : " + colonne3 + "<br />"); } rsExercice1.close();
    pstmtExercice1.close(); // Exercice 2 : Année de recherche String inputYear
    = request.getParameter("inputYear"); if (inputYear != null &&
    !inputYear.isEmpty()) { String sqlExercice2 = "SELECT idFilm, titre, année
    FROM Film WHERE année = ?"; PreparedStatement pstmtExercice2 =
    conn.prepareStatement(sqlExercice2); pstmtExercice2.setInt(1,
    Integer.parseInt(inputYear)); ResultSet rsExercice2 =
    pstmtExercice2.executeQuery(); out.println("
    <h2>Résultats de l'Exercice 2 : Films de l'année " + inputYear + "</h2>
    "); while (rsExercice2.next()) { String colonne1 =
    rsExercice2.getString("idFilm"); String colonne2 =
    rsExercice2.getString("titre"); String colonne3 =
    rsExercice2.getString("année"); out.println("id : " + colonne1 + ", titre :
    " + colonne2 + ", année : " + colonne3 + "<br />"); } rsExercice2.close();
    pstmtExercice2.close(); } // Exercice 3 : Modification du titre du film
    String filmIdToUpdate = request.getParameter("filmIdToUpdate"); String
    newTitle = request.getParameter("newTitle"); if (filmIdToUpdate != null &&
    newTitle != null && !filmIdToUpdate.isEmpty() && !newTitle.isEmpty()) {
    String sqlExercice3 = "UPDATE Film SET titre = ? WHERE idFilm = ?";
    PreparedStatement pstmtExercice3 = conn.prepareStatement(sqlExercice3);
    pstmtExercice3.setString(1, newTitle); pstmtExercice3.setInt(2,
    Integer.parseInt(filmIdToUpdate)); int rowsUpdated =
    pstmtExercice3.executeUpdate(); out.println("
    <h2>Résultats de l'Exercice 3 : Modification du titre du film</h2>
    "); out.println(rowsUpdated + " enregistrement(s) modifié(s).<br />");
    pstmtExercice3.close(); } // Exercice 4 : La valeur maximum String
    newFilmTitle = request.getParameter("newFilmTitle"); String newFilmYear =
    request.getParameter("newFilmYear"); if (newFilmTitle != null && newFilmYear
    != null && !newFilmTitle.isEmpty() && !newFilmYear.isEmpty()) { String
    sqlExercice4 = "INSERT INTO Film (titre, année) VALUES (?, ?)";
    PreparedStatement pstmtExercice4 = conn.prepareStatement(sqlExercice4);
    pstmtExercice4.setString(1, newFilmTitle); pstmtExercice4.setInt(2,
    Integer.parseInt(newFilmYear)); int rowsInserted =
    pstmtExercice4.executeUpdate(); out.println("
    <h2>Résultats de l'Exercice 4 : Ajout d'un nouveau film</h2>
    "); out.println(rowsInserted + " enregistrement(s) ajouté(s).<br />");
    pstmtExercice4.close(); } // Fermer la connexion conn.close(); %>

    <h2>Exercice 2 : Année de recherche</h2>
    <form action="#" method="get">
      <p>
        Saisir l'année de recherche : <input type="text" name="inputYear" />
      </p>
      <p><input type="submit" value="Rechercher" /></p>
    </form>

    <h2>Exercice 3 : Modification du titre du film</h2>
    <form action="#" method="post">
      <p>
        Saisir l'ID du film à mettre à jour :
        <input type="text" name="filmIdToUpdate" />
      </p>
      <p>
        Saisir le nouveau titre du film : <input type="text" name="newTitle" />
      </p>
      <p><input type="submit" value="Mettre à jour" /></p>
    </form>

    <h2>Exercice 4 : Ajout d'un nouveau film</h2>
    <form action="#" method="post">
      <p>
        Saisir le titre du nouveau film :
        <input type="text" name="newFilmTitle" />
      </p>
      <p>
        Saisir l'année du nouveau film :
        <input type="text" name="newFilmYear" />
      </p>
      <p><input type="submit" value="Ajouter" /></p>
    </form>

    <p><a href="index.html">Retour au sommaire</a></p>
  </body>
</html>
