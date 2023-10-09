package br.com.intersistemas.biblioteca.util

import javax.xml.crypto.Data


class Utils {

    static Date informarDataDoFimDoMes() {
        def hoje = new Date()
        Calendar cal = Calendar.getInstance()
        cal.setTime(hoje)
        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH))
        cal.time
    }

    static Date informarDataDoInicioDoMes() {
        def hoje = new Date()
        Calendar cal = Calendar.getInstance()
        cal.setTime(hoje)
        cal.set(Calendar.DAY_OF_MONTH, 1)
        cal.time
    }
}