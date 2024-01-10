<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les tableaux</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les tableaux</h1>

    <form action="#" method="post">
        <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>

    <% if (chaine != null) { %>

        <%-- Division de la chaîne de chiffres séparés par des espaces --%>
        <% String[] tableauDeChiffres = chaine.split("\\s+"); %>
        <p>Le tableau contient <%= tableauDeChiffres.length %> valeurs</br>
        Chiffre 1 : <%= Integer.parseInt(tableauDeChiffres[0]) %></br>
        Chiffre 2 : <%= Integer.parseInt(tableauDeChiffres[1]) %></br>
        Chiffre 3 : <%= Integer.parseInt(tableauDeChiffres[2]) %></p>

        <h2>Exercice 1 : Le carré de la première valeur</h2>
        <p>Le carré de la première valeur est : <%= Math.pow(Integer.parseInt(tableauDeChiffres[0]), 2) %></p>

        <h2>Exercice 2 : La somme des 2 premières valeurs</h2>
        <p>La somme des deux premières valeurs est : <%= Integer.parseInt(tableauDeChiffres[0]) + Integer.parseInt(tableauDeChiffres[1]) %></p>

        <h2>Exercice 3 : La somme de toutes les valeurs</h2>
        <% int sommeToutesValeurs = 0;
           for (String chiffre : tableauDeChiffres) {
               sommeToutesValeurs += Integer.parseInt(chiffre);
           }
        %>
        <p>La somme de toutes les valeurs est : <%= sommeToutesValeurs %></p>

        <h2>Exercice 4 : La valeur maximale</h2>
        <% int valeurMaximale = Integer.MIN_VALUE;
           for (String chiffre : tableauDeChiffres) {
               int valeur = Integer.parseInt(chiffre);
               if (valeur > valeurMaximale) {
                   valeurMaximale = valeur;
               }
           }
        %>
        <p>La valeur maximale est : <%= valeurMaximale %></p>

        <h2>Exercice 5 : La valeur minimale</h2>
        <% int valeurMinimale = Integer.MAX_VALUE;
           for (String chiffre : tableauDeChiffres) {
               int valeur = Integer.parseInt(chiffre);
               if (valeur < valeurMinimale) {
                   valeurMinimale = valeur;
               }
           }
        %>
        <p>La valeur minimale est : <%= valeurMinimale %></p>

        <h2>Exercice 6 : La valeur la plus proche de 0</h2>
        <% int valeurProcheDeZero = Integer.parseInt(tableauDeChiffres[0]);
           for (String chiffre : tableauDeChiffres) {
               int valeur = Integer.parseInt(chiffre);
               if (Math.abs(valeur) < Math.abs(valeurProcheDeZero)) {
                   valeurProcheDeZero = valeur;
               }
           }
        %>
        <p>La valeur la plus proche de 0 est : <%= valeurProcheDeZero %></p>

        <h2>Exercice 7 : La valeur la plus proche de 0 (2° version)</h2>
        <% int valeurProcheDeZeroVersion2 = Integer.parseInt(tableauDeChiffres[0]);
           for (String chiffre : tableauDeChiffres) {
               int valeur = Integer.parseInt(chiffre);
               if (Math.abs(valeur) < Math.abs(valeurProcheDeZeroVersion2) || (Math.abs(valeur) == Math.abs(valeurProcheDeZeroVersion2) && valeur > 0)) {
                   valeurProcheDeZeroVersion2 = valeur;
               }
           }
        %>
        <p>La valeur la plus proche de 0 (version 2) est : <%= valeurProcheDeZeroVersion2 %></p>

    <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
