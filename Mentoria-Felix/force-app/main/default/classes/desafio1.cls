// receber dois números, e retornar o maior

public with sharing class desafio1 {

    public static String desafio1(Integer n1, Integer n2) {

        String resultado;

        if (n1 > n2) {
            resultado = 'O maior número é: '+n1;
        } else {
            resultado = 'O maior número é: '+n2;
        }
        System.debug('resultado  '+resultado);
        return resultado;
    } 

}