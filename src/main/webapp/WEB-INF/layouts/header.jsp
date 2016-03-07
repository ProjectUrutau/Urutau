<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<link href="<c:url value='/css/stylesheet.css'/>" rel="stylesheet">
		
		<!-- Bootstrap min css -->
		<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
		
		<!-- jQuery -->
		<script src="<c:url value='/js/jquery.js'/>"></script>
		
		<!-- Bootstrap Core -->
		<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
		<title>Urutau</title>
	</head>
	<body>
		<header>
			 <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			 	<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<a class="navbar-brand" href="#">Urutau</a>
					</div>
					<!-- Top Menu Items -->
					<ul class="nav navbar-right top-nav">
						<li class="dropdown">
							<c:if test="${userSession.isLogged() == true}">
								<a href="#" id="top-menu-btn" class="dropdown-toggle" data-toggle="dropdown">
									Sr. ${userSession.userLogged.login}
								</a>
								<ul id="top-menu-dropdown" class="dropdown-menu">
									<li><a href="#">Perfil</a></li>
									<li><a href="#">Configuration</a></li>
									<li class="divider"></li>
									<li><a href="<c:url value='logout'/>"> Logout</a></li>
								</ul>
							</c:if>
							<c:if test="${userSession.isLogged() == false}">
							 	<ul id="top-menu-dropdown" class="nav pull-right">
					          		<li class="dropdown" id="menuLogin">
					            		<a  href="#" id="top-menu-btn" class="dropdown-toggle"data-toggle="dropdown">
					            			Login
					            		</a>
					            		<ul class="dropdown-menu">
					            			<li class="login-box">
						              			<form action="<c:url value='/user/authenticate'/>" class="form-group" method="POST"> 
									                <input name="login" type="text" class="form-control" placeholder="Login or email"/>
									                <input name="password" type="password" class="form-control" placeholder="Password">
									                <button type="submit" class="btn btn-primary btn-group-justified">
									                	Login
									                </button>
												</form>
											</li>
							          		<li class="divider"></li>
							          		<li>
							          			<a href="<c:url value='/#register'/>">Register</a>
							          		</li>
							            </ul>
						          	</li>
						        </ul>
							</c:if>
						</li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Get all content above header -->
		<div id="wrap" class="container">