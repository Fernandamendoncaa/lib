package br.com.intersistemas.biblioteca

import org.apache.catalina.filters.AddDefaultCharsetFilter

class LocacaoLivro {
    Cliente cliente
    Livro livro
    Date dataLocacao
    Date dataDevolucao
    Boolean devolvido = false

    static constraints = {
        livro nullable: false
        cliente nullable: false
        dataLocacao nullable: false
        dataDevolucao nullable: false
        devolvido nullable: true
    }

    static namedQueries = {

        tituloNaoDevolvidoPeloCliente { Livro livro, Cliente cliente ->
            eq 'cliente', cliente
            eq 'livro', livro
            ne 'devolvido', true
        }

        locacoesDoCliente { Cliente cliente ->
            eq 'cliente', cliente
            ne 'devolvido', true

        }
        limiteDeLocacaoNoMes {Cliente cliente, Date dataInicial, Date dataFinal ->
            eq 'cliente',cliente
            dataInicial.clearTime()
            dataFinal.clearTime()
            between 'dataLocacao', dataInicial, dataFinal


        }
    }
}