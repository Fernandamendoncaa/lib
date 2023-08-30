
<%@ page import="br.com.intersistemas.biblioteca.Livro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'livro.label', default: 'Livro')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-livro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-livro" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="editora" title="${message(code: 'livro.editora.label', default: 'Editora')}" />
					
						<g:sortableColumn property="isbn" title="${message(code: 'livro.isbn.label', default: 'Isbn')}" />
					
						<g:sortableColumn property="publicacao" title="${message(code: 'livro.publicacao.label', default: 'Publicacao')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'livro.titulo.label', default: 'Titulo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${livroInstanceList}" status="i" var="livroInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${livroInstance.id}">${fieldValue(bean: livroInstance, field: "editora")}</g:link></td>
					
						<td>${fieldValue(bean: livroInstance, field: "isbn")}</td>
					
						<td>${fieldValue(bean: livroInstance, field: "publicacao")}</td>
					
						<td>${fieldValue(bean: livroInstance, field: "titulo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${livroInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
