<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>Les conditions</title>
  </head>
  <body bgcolor="white">
    <h1>Exercices sur les conditions</h1>

    <form action="#" method="post">
      <p>
        Saisir la valeur 1 :
        <input type="text" id="inputValeur1" name="valeur1" />
      </p>
      <p>
        Saisir la valeur 2 :
        <input type="text" id="inputValeur2" name="valeur2" />
      </p>
      <p><input type="submit" value="Afficher" /></p>
    </form>

    <%-- Récupération des valeurs --%> <% String valeur1 =
    request.getParameter("valeur1"); %> <% String valeur2 =
    request.getParameter("valeur2"); %> <%-- Vérification de la condition entre
    les deux valeurs --%> <% if (valeur1 != null && valeur2 != null) { %> <%--
    Conversion des valeurs en entiers pour la comparaison --%> <% int intValeur1
    = Integer.parseInt(valeur1); %> <% int intValeur2 =
    Integer.parseInt(valeur2); %> <%-- Condition if pour comparer les valeurs
    --%> <% if (intValeur1 > intValeur2) { %>
    <p>Valeur 1 est supérieure à Valeur 2.</p>
    <% } else if (intValeur1 < intValeur2) { %>
    <p>Valeur 1 est inférieure à Valeur 2.</p>
    <% } else { %>
    <p>Valeur 1 est égale à Valeur 2.</p>
    <% } %>

    <h2>Exercice 1 : Comparaison 1</h2>
    <%-- Demander à l'utilisateur de saisir les valeurs A, B, et C --%>
    <form action="#" method="post">
      <p>
        Saisir la valeur A : <input type="text" id="inputA" name="valeurA" />
      </p>
      <p>
        Saisir la valeur B : <input type="text" id="inputB" name="valeurB" />
      </p>
      <p>
        Saisir la valeur C : <input type="text" id="inputC" name="valeurC" />
      </p>
      <p><input type="submit" value="Vérifier" /></p>
    </form>

    <%-- Récupération des valeurs pour l'exercice 1 --%> <% String valeurA =
    request.getParameter("valeurA"); %> <% String valeurB =
    request.getParameter("valeurB"); %> <% String valeurC =
    request.getParameter("valeurC"); %> <%-- Vérification de la condition entre
    les valeurs A, B, et C --%> <% if (valeurA != null && valeurB != null &&
    valeurC != null) { %> <%-- Conversion des valeurs en entiers pour la
    comparaison --%> <% int intValeurA = Integer.parseInt(valeurA); %> <% int
    intValeurB = Integer.parseInt(valeurB); %> <% int intValeurC =
    Integer.parseInt(valeurC); %> <%-- Condition if pour comparer les valeurs
    --%> <% if (intValeurC > intValeurA && intValeurC < intValeurB) { %>
    <p>Oui, C est compris entre A et B.</p>
    <% } else { %>
    <p>Non, C n'est pas compris entre A et B.</p>
    <% } %> <% } %>

    <h2>Exercice 2 : Pair ou Impair ?</h2>
    <%-- Demander à l'utilisateur de saisir un nombre --%>
    <form action="#" method="post">
      <p>
        Saisir un nombre : <input type="text" id="inputNombre" name="nombre" />
      </p>
      <p><input type="submit" value="Vérifier" /></p>
    </form>

    <%-- Récupération du nombre pour l'exercice 2 --%> <% String nombre =
    request.getParameter("nombre"); %> <%-- Vérification de la parité du nombre
    --%> <% if (nombre != null) { %> <% int intNombre =
    Integer.parseInt(nombre); %> <% if (intNombre % 2 == 0) { %>
    <p>Le nombre est pair.</p>
    <% } else { %>
    <p>Le nombre est impair.</p>
    <% } %> <% } %> <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
  </body>
</html>
