<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>Les chaines</title>
  </head>
  <body bgcolor="white">
    <h1>Exercices sur les chaines de caractères</h1>

    <form action="#" method="post">
      <p>
        Saisir une chaine (Du texte avec 6 caractères minimum) :
        <input type="text" id="inputValeur" name="chaine" />
      </p>
      <p><input type="submit" value="Afficher" /></p>
    </form>

    <%-- Récupération des valeurs --%> <% String chaine =
    request.getParameter("chaine"); %> <% if (chaine != null && chaine.length()
    >= 6) { %> <%-- Obtention de la longueur de la chaîne --%> <% int
    longueurChaine = chaine.length(); %>
    <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères</p>

    <%-- Extraction du 3° caractère dans votre chaine --%> <% char
    caractereExtrait = chaine.charAt(2); %>
    <p>Le 3° caractère de votre chaine est la lettre <%= caractereExtrait %></p>

    <%-- Obtention d'une sous-chaîne --%> <% String sousChaine =
    chaine.substring(2, 6); %>
    <p>Une sous-chaine de votre texte : <%= sousChaine %></p>

    <%-- Recherche de la lettre "e" --%> <% char recherche = 'e'; int position =
    chaine.indexOf(recherche); %>
    <p>Votre premier "e" est en : <%= position %></p>

    <h2>Exercice 1 : Combien de 'e' dans notre chaine de caractère ?</h2>
    <% int countE = 0; for (int i = 0; i < chaine.length(); i++) { if
    (chaine.charAt(i) == 'e') { countE++; } } %>
    <p>Le nombre de lettre 'e' dans votre chaine est : <%= countE %></p>

    <h2>Exercice 2 : Affichage vertical</h2>
    <% for (int i = 0; i < chaine.length(); i++) { char character =
    chaine.charAt(i); %>
    <p><%= character %></p>
    <% } %>

    <h2>Exercice 3 : Retour à la ligne</h2>
    <% for (int i = 0; i < chaine.length(); i++) { char character =
    chaine.charAt(i); if (character == ' ') { %>
    <br />
    <% } else { %> <%= character %> <% } } %>

    <h2>Exercice 4 : Afficher une lettre sur deux</h2>
    <% for (int i = 0; i < chaine.length(); i += 2) { char character =
    chaine.charAt(i); %>
    <p><%= character %></p>
    <% } %>

    <h2>Exercice 5 : La phrase en verlan</h2>
    <% for (int i = chaine.length() - 1; i >= 0; i--) { char character =
    chaine.charAt(i); %>
    <p><%= character %></p>
    <% } %>

    <h2>Exercice 6 : Consonnes et voyelles</h2>
    <% int countVoyelles = 0; int countConsonnes = 0; String voyelles =
    "aeiouyAEIOUY"; for (int i = 0; i < chaine.length(); i++) { char character =
    chaine.charAt(i); if (Character.isLetter(character)) { if
    (voyelles.indexOf(character) != -1) { countVoyelles++; } else {
    countConsonnes++; } } } %>
    <p>Nombre de voyelles : <%= countVoyelles %></p>
    <p>Nombre de consonnes : <%= countConsonnes %></p>

    <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
  </body>
</html>
