
<%@ page import="br.com.intersistemas.biblioteca.AutorLivro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'autorLivro.label', default: 'AutorLivro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<style>

		#grailsLogo {background-color: #666666}
		h1 {
			color: black;
			background-color:white;
			font-family: "calibri"

		}
		table {
			border-top: 5px solid grey;

		}
		a:link, a:visited, a:hover {
			color: black;
		}
		td, th{ color: black;
			font-family: Calibri  }
		.footer {
			background: #666666;
			color:white}


		.footer a {
			color: #666666;
		}
		.nav {
			font-family: Calibri;}


		</style>

	</head>
	<body>
		<a href="#show-autorLivro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-autorLivro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list autorLivro">
			
				<g:if test="${autorLivroInstance?.autor}">
				<li class="fieldcontain">
					<span id="autor-label" class="property-label"><g:message code="autorLivro.autor.label" default="Autor" /></span>
					
						<span class="property-value" aria-labelledby="autor-label"><g:link controller="autor" action="show" id="${autorLivroInstance?.autor?.id}">${autorLivroInstance?.autor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${autorLivroInstance?.livro}">
				<li class="fieldcontain">
					<span id="livro-label" class="property-label"><g:message code="autorLivro.livro.label" default="Livro" /></span>
					
						<span class="property-value" aria-labelledby="livro-label"><g:link controller="livro" action="show" id="${autorLivroInstance?.livro?.id}">${autorLivroInstance?.livro?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:autorLivroInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${autorLivroInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
