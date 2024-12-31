<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<spring:url value="src/bootstrap" var="bts"></spring:url>
<link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Freelance Projects</title>
<style>
body {
	padding-top: 56px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<section id="detail" class="py-5">
		<div class="container my-5">
			<h2>Détails du Projet</h2>
			<div class="card mb-4">
				<div class="card-body">
					<h5 class="card-title">${proj.titre}</h5>
					<p class="card-text">
						<strong>Description :</strong> ${proj.description}
					</p>
					<p class="card-text">
						<strong>Budget :</strong> ${proj.budget}
					</p>
					<p class="card-text">
						<strong>Date Limite :</strong> ${proj.date_limite}
					</p>
					<p class="card-text">
						<strong>Compétences Requises :</strong> ${proj.technologies}
					</p>
				</div>
			</div>
			<h3>Soumettre une Proposition</h3>
			<form:form method="POST" action="${cxt}/saveProposition" modelAttribute="prp">

				<div class="mb-3">
					<label for="montant" class="form-label">Montant</label>

					<form:input path="montant"  class="form-control" />

				</div>
				<div class="mb-3">
					<label for="delai" class="form-label">Delai</label>

					<form:input path="delai" type="text" class="form-control"
						placeholder="Entrez le délai (ex: 3 semaines)" />

				</div>
				<div class="mb-3">
					<label for="description" class="form-label">Description</label>

					<form:input path="description" class="form-control" rows="3"
						placeholder="Décrivez votre proposition" />

				</div>

				<input type="hidden" name="proj.id" value="${proj.id}" />
				<input type="hidden" name="freelancer.id" value="${user.id}" />


				<button type="submit" class="btn btn-primary">Soumettre la
					Proposition</button>
			</form:form>

		</div>
	</section>

	<footer class="bg-light py-4">
		<div class="container text-center">
			<p>&copy; 2024 FreelanceESSAT. Tous droits réservés.</p>
			<a href="#about">A Propos</a> | <a href="#contact">Contact</a>
		</div>
	</footer>

</body>
</html>
