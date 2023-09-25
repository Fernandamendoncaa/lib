
<%@ page import="br.com.intersistemas.biblioteca.LocacaoLivro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'locacaoLivro.label', default: 'LocacaoLivro')}" />
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
		<a href="#list-locacaoLivro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-locacaoLivro" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="locacaoLivro.cliente.label" default="Cliente" /></th>
					
						<g:sortableColumn property="dataDevolucao" title="${message(code: 'locacaoLivro.dataDevolucao.label', default: 'Data Devolucao')}" />
					
						<g:sortableColumn property="dataLocacao" title="${message(code: 'locacaoLivro.dataLocacao.label', default: 'Data Locacao')}" />
					
						<th><g:message code="locacaoLivro.livro.label" default="Livro" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${locacaoLivroInstanceList}" status="i" var="locacaoLivroInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">


						<td><g:link action="show" id="${locacaoLivroInstance.id}">${locacaoLivroInstance?.cliente?.nome} </g:link></td>

						<td><g:formatDate format="dd/MM/yyyy" date="${locacaoLivroInstance?.dataDevolucao}"/></td>

						<td><g:formatDate format="dd/MM/yyyy" date="${locacaoLivroInstance?.dataLocacao}"/></td>

						<td>${locacaoLivroInstance?.livro?.titulo}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${locacaoLivroInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
