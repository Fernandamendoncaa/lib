
<%@ page import="br.com.intersistemas.biblioteca.Autor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'autor.label', default: 'Autor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
		<a href="#list-autor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-autor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="biografia" title="${message(code: 'autor.biografia.label', default: 'Biografia')}" />
					
						<g:sortableColumn property="nome" title="${message(code: 'autor.nome.label', default: 'Nome')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${autorInstanceList}" status="i" var="autorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${autorInstance.id}">${fieldValue(bean: autorInstance, field: "biografia")}</g:link></td>
					
						<td>${fieldValue(bean: autorInstance, field: "nome")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${autorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
