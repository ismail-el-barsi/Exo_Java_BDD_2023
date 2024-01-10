<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>Boucles</title>
  </head>
  <body bgcolor="white">
    <h1>Exercices sur les boucles</h1>
    <form action="#" method="post">
      <label for="inputValeur">Saisir le nombre d'étoiles : </label>
      <input type="text" id="inputValeur" name="valeur" />
      <input type="submit" value="Afficher" />
    </form>

    <%-- Récupération de la valeur saisie par l'utilisateur --%> <% String
    valeur = request.getParameter("valeur"); %> <%-- Vérification de l'existence
    de la valeur --%> <% if (valeur != null && !valeur.isEmpty()) { %> <%--
    Boucle for pour afficher une ligne d'étoiles --%> <%int cpt =
    Integer.parseInt(valeur); %>
    <p><% for (int i = 1; i <= cpt; i++) { %> <%= "*" %>&nbsp; <% } %></p>

    <h2>Exercice 1 : Le carré d'étoiles</h2>
    <% for (int i = 1; i <= cpt; i++) { for (int j = 1; j <= cpt; j++) {
    out.print("*"); } out.println("<br />"); } %>

    <h2>Exercice 2 : Triangle rectangle gauche</h2>
    <% for (int i = 1; i <= cpt; i++) { for (int j = 1; j <= i; j++) {
    out.print("*"); } out.println("<br />"); } %>

    <h2>Exercice 3 : Triangle rectangle inversé</h2>
    <% for (int i = cpt; i >= 1; i--) { for (int j = 1; j <= i; j++) {
    out.print("*"); } out.println("<br />"); } %>

    <h2>Exercice 4 : Triangle rectangle 2</h2>
    <% for (int i = 1; i <= cpt; i++) { for (int j = cpt; j > i; j--) {
    out.print("&nbsp;&nbsp;"); } for (int k = 1; k <= i; k++) { out.print("*");
    } out.println("<br />"); } %>

    <h2>Exercice 5 : Triangle isocèle</h2>
    <% for (int i = 1; i <= cpt; i++) { for (int j = cpt; j > i; j--) {
    out.print("&nbsp;&nbsp;"); } for (int k = 1; k <= i; k++) { out.print("*");
    } out.println("<br />"); } %>

    <h2>Exercice 6 : Le demi losange</h2>
    <% for (int i = 1; i <= cpt; i++) { for (int j = cpt; j > i; j--) {
    out.print("&nbsp;&nbsp;"); } for (int k = 1; k <= i; k++) { out.print("*");
    } out.println("<br />"); } for (int i = cpt - 1; i >= 1; i--) { for (int j =
    1; j <= cpt - i; j++) { out.print("&nbsp;&nbsp;"); } for (int k = 1; k <= i;
    k++) { out.print("*"); } out.println("<br />"); } %>

    <h2>Exercice 7 : La table de multiplication</h2>
    <% for (int i = 1; i <= 10; i++) { out.println("
    <p>" + cpt + " x " + i + " = " + (cpt * i) + "</p>
    "); } %> <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
  </body>
</html>
