
<%@ page import="br.com.intersistemas.biblioteca.Livro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'livro.label', default: 'Livro')}" />
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
		<a href="#show-livro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-livro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list livro">
			
				<g:if test="${livroInstance?.editora}">
				<li class="fieldcontain">
					<span id="editora-label" class="property-label"><g:message code="livro.editora.label" default="Editora" /></span>
					
						<span class="property-value" aria-labelledby="editora-label"><g:fieldValue bean="${livroInstance}" field="editora"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${livroInstance?.isbn}">
				<li class="fieldcontain">
					<span id="isbn-label" class="property-label"><g:message code="livro.isbn.label" default="Isbn" /></span>
					
						<span class="property-value" aria-labelledby="isbn-label"><g:fieldValue bean="${livroInstance}" field="isbn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${livroInstance?.publicacao}">
				<li class="fieldcontain">
					<span id="publicacao-label" class="property-label"><g:message code="livro.publicacao.label" default="Publicacao" /></span>
					
						<span class="property-value" aria-labelledby="publicacao-label"><g:fieldValue bean="${livroInstance}" field="publicacao"/></span>
					
				</li>
				</g:if>

				<g:if test="${livroInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="livro.titulo.label" default="Titulo" /></span>

						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${livroInstance}" field="titulo"/></span>

				</li>
				</g:if>
				<g:if test="${livroInstance?.estoque}">
					<li class="fieldcontain">
						<span id="estoque-label" class="property-label"><g:message code="livro.estoque.label" default="Titulo" /></span>

						<span class="property-value" aria-labelledby="estoque-label"><g:fieldValue bean="${livroInstance}" field="estoque"/></span>

					</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:livroInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${livroInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
