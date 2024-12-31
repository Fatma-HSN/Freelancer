<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<spring:url value="/src/bootstrap" var="bts"/>
	<link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Mon Profil</title>
</head>
<body>
	<c:set var="cxt" value="${pageContext.request.contextPath}" />
	<div class="container my-5">
		<h2 class="text-center">Mon Profil</h2>
		<p><strong>Nom:</strong> ${profil.user.nom}</p>
		<p><strong>Biographie:</strong> ${profil.biblio}</p>
		<p><strong>Compétences:</strong> ${profil.skills}</p>
		<p><strong>Années d'expérience:</strong> ${profil.annee_experience}</p>
		<p><strong>Disponibilité:</strong> ${profil.disponibilite}</p>
	</div>
</body>
</html>
