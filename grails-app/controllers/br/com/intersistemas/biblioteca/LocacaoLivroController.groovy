package br.com.intersistemas.biblioteca



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LocacaoLivroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LocacaoLivro.list(params), model:[locacaoLivroInstanceCount: LocacaoLivro.count()]
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
            respond locacaoLivroInstance.errors, view:'create'
            return
        }

        locacaoLivroInstance.save flush:true

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
            respond locacaoLivroInstance.errors, view:'edit'
            return
        }

        locacaoLivroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LocacaoLivro.label', default: 'LocacaoLivro'), locacaoLivroInstance.id])
                redirect locacaoLivroInstance
            }
            '*'{ respond locacaoLivroInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LocacaoLivro locacaoLivroInstance) {

        if (locacaoLivroInstance == null) {
            notFound()
            return
        }

        locacaoLivroInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LocacaoLivro.label', default: 'LocacaoLivro'), locacaoLivroInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'locacaoLivro.label', default: 'LocacaoLivro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
