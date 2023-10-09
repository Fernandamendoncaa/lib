package br.com.intersistemas.biblioteca

import br.com.intersistemas.biblioteca.util.Utils
import grails.transaction.Transactional

import java.time.LocalDate

@Transactional
class LocacaoLivroService {

    Boolean verificarEstoqueLivro(Livro livro) {
        livro.estoque > 0
    }

    def removerEstoqueLivro(Livro livro) {
        livro.estoque--
        livro.save()
    }

    def devolverLivroAoEstoque(Livro livro) {
        livro.estoque++
        livro.save()
    }

    def locacaoLivroRepetido(LocacaoLivro locacaoLivro) {
        def quantidadeNaoDevolvida = LocacaoLivro.tituloNaoDevolvidoPeloCliente(locacaoLivro?.livro, locacaoLivro.cliente).count()
        quantidadeNaoDevolvida != 0
    }

    def limiteDeLocacao(LocacaoLivro locacaoLivro) {
        def quantidadeDeLocacao = LocacaoLivro.locacoesDoCliente(locacaoLivro.cliente).count()
        quantidadeDeLocacao >= 3
    }

    def limiteDeLocacaoNoMes (Cliente cliente) {
        def limiteDeLocacaoNoMes = LocacaoLivro.limiteDeLocacaoNoMes(cliente, Utils.informarDataDoInicioDoMes(), Utils.informarDataDoFimDoMes()).count()
       limiteDeLocacaoNoMes >4

    }
}
