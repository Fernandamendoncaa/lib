package br.com.intersistemas.biblioteca

import br.com.intersistemas.biblioteca.util.Utils
import org.springframework.beans.factory.annotation.Autowired

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LocacaoLivroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def locacaoLivroService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LocacaoLivro.list(params), model: [locacaoLivroInstanceCount: LocacaoLivro.count()]
    }

    def show(LocacaoLivro locacaoLivroInstance) {
        respond locacaoLivroInstance
    }

    def create() {
        respond new LocacaoLivro(params)
    }

    @Transactional
    def save(LocacaoLivro locacaoLivroInstance) {
        if (locacaoLivroInstance == null) {
            notFound()
            return
        }
        if (locacaoLivroInstance.hasErrors()) {
            respond locacaoLivroInstance.errors, view: 'create'
            return
        }

        //verificar se o livro requisitado na locação tem estoque disponível.
        if (!locacaoLivroService.verificarEstoqueLivro(locacaoLivroInstance?.livro)) {
            // Se não, mensagem de erro para o operador
            flash.error = "O livro ${locacaoLivroInstance?.livro?.titulo} está sem estoque!"
            render view: 'create', model: [locacaoLivroInstance: locacaoLivroInstance]
            return
        }

        //validação sobre a locação de livro repetido.
        if (locacaoLivroService.locacaoLivroRepetido(locacaoLivroInstance)) {
            flash.error = "Você já pegou emprestado o livro ${locacaoLivroInstance?.livro?.titulo}"
            render view: 'create', model: [locacaoLivroInstance: locacaoLivroInstance]
            return
        }

        //verificar se o cliente tem 3 locacações.
        if (locacaoLivroService.limiteDeLocacao(locacaoLivroInstance)) {
            //se houver mais de 3 locações, messagem de erro para o operador
            flash.error = "você já tem 3 livros alugados"
            render view: 'create', model: [locacaoLivroInstance: locacaoLivroInstance]
            return

        }

        //verificar quantas locações o cliente tem em um mês
        if (locacaoLivroService.limiteDeLocacaoNoMes(locacaoLivroInstance?.cliente)) {
            //se houver 5 locações em um mês, não continuar a operação
            flash.error = "você ja fez 5 locações esse mês"
            render view: 'create', model: [locacaoLivroInstance: locacaoLivroInstance]
            return
        }

        //TODO não pode pegar mais de 3 livros

        // se sim, continua a operação
        locacaoLivroInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'locacaoLivro.label', default: 'LocacaoLivro'), locacaoLivroInstance.id])
                redirect locacaoLivroInstance
            }
            '*' { respond locacaoLivroInstance, [status: CREATED] }
        }
    }
    def edit(LocacaoLivro locacaoLivroInstance) {
        respond locacaoLivroInstance
    }

    @Transactional
    def update(LocacaoLivro locacaoLivroInstance) {
        if (locacaoLivroInstance == null) {
            notFound()
            return
        }

        if (locacaoLivroInstance.hasErrors()) {
            respond locacaoLivroInstance.errors, view: 'edit'
            return
        }

        def devolvendo = locacaoLivroInstance.devolvido

        locacaoLivroInstance.save flush: true

        // TODO criar mecanismo de devolução ao estoque
        if(devolvendo)
            locacaoLivroService.devolverLivroAoEstoque(locacaoLivroInstance.livro)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LocacaoLivro.label', default: 'LocacaoLivro'), locacaoLivroInstance.id])
                redirect locacaoLivroInstance
            }
            '*' { respond locacaoLivroInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LocacaoLivro locacaoLivroInstance) {

        if (locacaoLivroInstance == null) {
            notFound()
            return
        }

        locacaoLivroInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LocacaoLivro.label', default: 'LocacaoLivro'), locacaoLivroInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'locacaoLivro.label', default: 'LocacaoLivro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
