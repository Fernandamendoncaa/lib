package br.com.intersistemas.biblioteca



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LivroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Livro.list(params), model:[livroInstanceCount: Livro.count()]
    }

    def show(Livro livroInstance) {
        respond livroInstance
    }

    def create() {
        respond new Livro(params)
    }

    @Transactional
    def save(Livro livroInstance) {
        if (livroInstance == null) {
            notFound()
            return
        }

        if (livroInstance.hasErrors()) {
            respond livroInstance.errors, view:'create'
            return
        }

        livroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'livro.label', default: 'Livro'), livroInstance.id])
                redirect livroInstance
            }
            '*' { respond livroInstance, [status: CREATED] }
        }
    }

    def edit(Livro livroInstance) {
        respond livroInstance
    }

    @Transactional
    def update(Livro livroInstance) {
        if (livroInstance == null) {
            notFound()
            return
        }

        if (livroInstance.hasErrors()) {
            respond livroInstance.errors, view:'edit'
            return
        }

        livroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Livro.label', default: 'Livro'), livroInstance.id])
                redirect livroInstance
            }
            '*'{ respond livroInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Livro livroInstance) {

        if (livroInstance == null) {
            notFound()
            return
        }

        livroInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Livro.label', default: 'Livro'), livroInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'livro.label', default: 'Livro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
