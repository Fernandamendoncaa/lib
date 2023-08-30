
<%@ page import="br.com.intersistemas.biblioteca.LocacaoLivro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'locacaoLivro.label', default: 'LocacaoLivro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-locacaoLivro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-locacaoLivro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list locacaoLivro">
			
				<g:if test="${locacaoLivroInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="locacaoLivro.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${locacaoLivroInstance?.cliente?.id}">${locacaoLivroInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${locacaoLivroInstance?.dataDevolucao}">
				<li class="fieldcontain">
					<span id="dataDevolucao-label" class="property-label"><g:message code="locacaoLivro.dataDevolucao.label" default="Data Devolucao" /></span>
					
						<span class="property-value" aria-labelledby="dataDevolucao-label"><g:formatDate date="${locacaoLivroInstance?.dataDevolucao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${locacaoLivroInstance?.dataLocacao}">
				<li class="fieldcontain">
					<span id="dataLocacao-label" class="property-label"><g:message code="locacaoLivro.dataLocacao.label" default="Data Locacao" /></span>
					
						<span class="property-value" aria-labelledby="dataLocacao-label"><g:formatDate date="${locacaoLivroInstance?.dataLocacao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${locacaoLivroInstance?.livro}">
				<li class="fieldcontain">
					<span id="livro-label" class="property-label"><g:message code="locacaoLivro.livro.label" default="Livro" /></span>
					
						<span class="property-value" aria-labelledby="livro-label"><g:link controller="livro" action="show" id="${locacaoLivroInstance?.livro?.id}">${locacaoLivroInstance?.livro?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:locacaoLivroInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${locacaoLivroInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
