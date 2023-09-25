<%@ page import="br.com.intersistemas.biblioteca.AutorLivro" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'autorLivro.label', default: 'AutorLivro')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
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
<a href="#list-autorLivro" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-autorLivro" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="autorLivro.autor.label" default="Autor"/></th>

            <th><g:message code="autorLivro.livro.label" default="Livro"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${autorLivroInstanceList}" status="i" var="autorLivroInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>
                    <g:link action="show"id="${autorLivroInstance.id}">
                        ${autorLivroInstance?.autor?.nome}
                    </g:link>
                </td>

                <td>${autorLivroInstance?.livro?.titulo}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${autorLivroInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
