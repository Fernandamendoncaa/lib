
<%@ page import="br.com.intersistemas.biblioteca.Autor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'autor.label', default: 'Autor')}" />
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
		<a href="#show-autor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-autor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list autor">
			
				<g:if test="${autorInstance?.biografia}">
				<li class="fieldcontain">
					<span id="biografia-label" class="property-label"><g:message code="autor.biografia.label" default="Biografia" /></span>
					
						<span class="property-value" aria-labelledby="biografia-label"><g:fieldValue bean="${autorInstance}" field="biografia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${autorInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="autor.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${autorInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:autorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${autorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
