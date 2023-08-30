<%@ page import="br.com.intersistemas.biblioteca.Autor" %>

<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="autor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${autorInstance?.nome}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'biografia', 'error')} required">
	<label for="biografia">
		<g:message code="autor.biografia.label" default="Biografia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="biografia" required="" value="${autorInstance?.biografia}"/>

</div>


