<%@ page import="br.com.intersistemas.biblioteca.LocacaoLivro" %>



<div class="fieldcontain ${hasErrors(bean: locacaoLivroInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="locacaoLivro.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${br.com.intersistemas.biblioteca.Livro.list()}" optionKey="id" required="" value="${locacaoLivroInstance?.cliente?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: locacaoLivroInstance, field: 'dataDevolucao', 'error')} required">
	<label for="dataDevolucao">
		<g:message code="locacaoLivro.dataDevolucao.label" default="Data Devolucao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataDevolucao" precision="day"  value="${locacaoLivroInstance?.dataDevolucao}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: locacaoLivroInstance, field: 'dataLocacao', 'error')} required">
	<label for="dataLocacao">
		<g:message code="locacaoLivro.dataLocacao.label" default="Data Locacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataLocacao" precision="day"  value="${locacaoLivroInstance?.dataLocacao}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: locacaoLivroInstance, field: 'livro', 'error')} required">
	<label for="livro">
		<g:message code="locacaoLivro.livro.label" default="Livro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="livro" name="livro.id" from="${br.com.intersistemas.biblioteca.Livro.list()}" optionKey="id" required="" value="${locacaoLivroInstance?.livro?.id}" class="many-to-one"/>

</div>

