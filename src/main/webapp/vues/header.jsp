<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="u" />
<c:set var="cxt" value="${pageContext.request.contextPath}" />

<c:if test="${u.role.role == 'ROLE_CLIENT'}">
    <nav class="navbar navbar-expand-lg navbar-dark bg-warning fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">FreelanceESSAT</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="projects/client/${u.id}">Mes Projets</a></li>
                    <li class="nav-item"><a class="nav-link" href="#about">A propos</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    <li class="nav-item">
                        <sec:authorize access="isAuthenticated()">Bienvenue <sec:authentication property="name" /> (<a href="<c:url value="/logout" />">Logout</a>)</sec:authorize>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</c:if>

<c:if test="${u.role.role == 'ROLE_FREELANCER'}">
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">FreelanceESSAT</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="/projects/freelancer/${u.id}">Mon Profil</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">A propos</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                    <li class="nav-item">
                        <sec:authorize access="isAuthenticated()">Bienvenue <sec:authentication property="name" /> (<a href="<c:url value="/logout" />">Logout</a>)</sec:authorize>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</c:if>
