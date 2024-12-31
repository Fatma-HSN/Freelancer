<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<spring:url value="/src/bootstrap" var="bts"/>
	<link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Créer Profil</title>
</head>
<body>
	<c:set var="cxt" value="${pageContext.request.contextPath}" />
	<div class="container my-5">
		<div class="signup-container">
			<h2 class="text-center">Créer Profil</h2>
			<form:form method="POST" action="${cxt}/saveprofil" modelAttribute="profil">
				<div class="mb-3">
					<label for="biblio" class="form-label">Biographie</label>
					<form:textarea path="biblio" class="form-control" rows="3" />
				</div>
				<div class="mb-3">
					<label for="skills" class="form-label">Compétences</label>
					<form:input path="skills" type="text" class="form-control" placeholder="Ex: Java, Python"/>
				</div>
				<div class="mb-3">
					<label for="annee_experience" class="form-label">Années d'expérience</label>
					<form:input path="annee_experience" type="number" class="form-control" />
				</div>
				<div class="mb-3">
					<label for="disponibilite" class="form-label">Disponibilité</label>
					<form:input path="disponibilite" type="text" class="form-control" />
				</div>
				<button type="submit" class="btn btn-primary w-100">Enregistrer</button>
			</form:form>
		</div>
	</div>
</body>
</html>
