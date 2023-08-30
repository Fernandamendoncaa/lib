<%@ page import="br.com.intersistemas.biblioteca.AutorLivro" %>



<div class="fieldcontain ${hasErrors(bean: autorLivroInstance, field: 'autor', 'error')} required">
	<label for="autor">
		<g:message code="autorLivro.autor.label" default="Autor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="autor" optionValue= "nome" name="autor.id" from="${br.com.intersistemas.biblioteca.Autor.list()}" optionKey="id" required="" value="${autorLivroInstance?.autor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: autorLivroInstance, field: 'livro', 'error')} required">
	<label for="livro">
		<g:message code="autorLivro.livro.label" default="Livro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="livro" optionValue="titulo" name="livro.id" from="${br.com.intersistemas.biblioteca.Livro.list()}" optionKey="id" required="" value="${autorLivroInstance?.livro?.id}" class="many-to-one"/>

</div>

