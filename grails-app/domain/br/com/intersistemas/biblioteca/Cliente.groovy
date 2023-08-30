package br.com.intersistemas.biblioteca

class Cliente {
    String nome
    String email
    String endereco
    String telefone

    static constraints = {
        nome nullable: false
        telefone nullable: false
        email nullable: false
        endereco nullable: false
    }
}
