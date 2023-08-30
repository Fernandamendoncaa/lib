package br.com.intersistemas.biblioteca



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AutorLivroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AutorLivro.list(params), model:[autorLivroInstanceCount: AutorLivro.count()]
    }

    def show(AutorLivro autorLivroInstance) {
        respond autorLivroInstance
    }

    def create() {
        respond new AutorLivro(params)
    }

    @Transactional
    def save(AutorLivro autorLivroInstance) {
        if (autorLivroInstance == null) {
            notFound()
            return
        }

        if (autorLivroInstance.hasErrors()) {
            respond autorLivroInstance.errors, view:'create'
            return
        }

        autorLivroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'autorLivro.label', default: 'AutorLivro'), autorLivroInstance.id])
                redirect autorLivroInstance
            }
            '*' { respond autorLivroInstance, [status: CREATED] }
        }
    }

    def edit(AutorLivro autorLivroInstance) {
        respond autorLivroInstance
    }

    @Transactional
    def update(AutorLivro autorLivroInstance) {
        if (autorLivroInstance == null) {
            notFound()
            return
        }

        if (autorLivroInstance.hasErrors()) {
            respond autorLivroInstance.errors, view:'edit'
            return
        }

        autorLivroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AutorLivro.label', default: 'AutorLivro'), autorLivroInstance.id])
                redirect autorLivroInstance
            }
            '*'{ respond autorLivroInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AutorLivro autorLivroInstance) {

        if (autorLivroInstance == null) {
            notFound()
            return
        }

        autorLivroInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AutorLivro.label', default: 'AutorLivro'), autorLivroInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'autorLivro.label', default: 'AutorLivro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
