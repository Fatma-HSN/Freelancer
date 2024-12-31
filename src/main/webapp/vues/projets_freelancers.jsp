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
    <meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Freelacer</title>
    <!-- Utiliser les liens CDN de Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="header.jsp" />
		<section id="projects" class="py-5">
			<div class="container">
				<h2 class="text-center mb-4">Mes Projets</h2>
				<div class="row">
					<c:forEach items="${projects}" var="p">
						<div class="col-md-4 mb-4">
							<div class="card shadow-sm h-100">
								<div class="card-body d-flex flex-column">
									<h4 class="card-title">titre : ${p.titre}</h4>
									<p class="card-text">Description : ${p.description}</p>
									<p class="text-muted mt-auto">Statut : ${p.etat}</p>
									<div class="d-flex justify-content-between mt-3">
										<a href="detail_project/${p.id}" class="btn btn-sm btn-info"><i
											class="fas fa-eye"></i>Voir le Projet</a>
										<button class="btn btn-danger btn-sm">
											<i class="fas fa-trash"></i> Supprimer
										</button>
										<button class="btn btn-sm btn-warning">
											<i class="fas fa-edit"></i> Modifier
										</button>

									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
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
