<%@ page import="br.com.intersistemas.biblioteca.Livro" %>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="livro.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${livroInstance?.titulo}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'editora', 'error')} required">
	<label for="editora">
		<g:message code="livro.editora.label" default="Editora" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="editora" required="" value="${livroInstance?.editora}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'isbn', 'error')} required">
	<label for="isbn">
		<g:message code="livro.isbn.label" default="Isbn" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="isbn" type="number" value="${livroInstance.isbn}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'publicacao', 'error')} required">
	<label for="publicacao">
		<g:message code="livro.publicacao.label" default="Publicacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="publicacao" required="" value="${livroInstance?.publicacao}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: livroInstance, field: 'estoque', 'error')} required">
	<label for="estoque">
		<g:message code="livro.estoque.label" default="Estoque" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estoque" required="" value="${livroInstance?.estoque}"/>

</div>


